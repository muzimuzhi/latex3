-- Common settings for LaTeX3 development repo, used by l3build script

checkdeps   = checkdeps   or {maindir .. "/l3backend", maindir .. "/l3kernel"}
typesetdeps = typesetdeps or {maindir .. "/l3packages/xparse"}

checkengines    = checkengines
  or {"pdftex", "xetex", "luatex", "uptex"}
checksuppfiles  = checksuppfiles  or
  {
    "regression-test.cfg",
    "sRGB_v4_ICC_preference.icc"
  }

specialformats = specialformats or {}
specialformats.latex =
  {
    ["etex-dvips"] = {binary = "etex", format = "latex"},
    ["etex-dvisvgm"] =
      {
        binary = "etex",
        format = "latex",
        tokens = "\\ExplSyntaxOn\\sys_load_backend:n{dvisvgm}\\ExplSyntaxOff"
      }
  }

tagfiles = tagfiles or {"*.dtx", "README.md", "CHANGELOG.md", "*.ins"}
unpacksuppfiles = unpacksuppfiles or
  {
    "docstrip.tex",
    "hyphen.cfg",
    "texsys.cfg",
    "UShyphen.tex"
  }

packtdszip  = true

typesetcmds = typesetcmds or "\\AtBeginDocument{\\csname DisableImplementation\\endcsname}"

typesetexe = "pdftex"
typesetopts = "--fmt=pdflatex -interaction=nonstopmode"

if checksearch == nil then
  checksearch = false
end
if unpacksearch == nil then
  unpacksearch = false
end

-- Detail how to set the version automatically
function update_tag(file,content,tagname,tagdate)
  local iso = "%d%d%d%d%-%d%d%-%d%d"
  local url = "https://github.com/latex3/latex3/compare/"
  content =  update_tag_extra(file,content,tagname,tagdate)
  if string.match(content,"%(C%)%s*[%d%-,]+ The LaTeX Project") then
    local year = os.date("%Y")
    content = string.gsub(content,
      "%(C%)%s*([%d%-,]+) The LaTeX Project",
      "(C) %1," .. year .. " The LaTeX Project")
    content = string.gsub(content,year .. "," .. year,year)
    content = string.gsub(content,
      "%-" .. math.tointeger(year - 1) .. "," .. year,
      "-" .. year)
    content = string.gsub(content,
      math.tointeger(year - 2) .. "," .. math.tointeger(year - 1) .. "," .. year,
      math.tointeger(year - 2) .. "-" .. year)
  end
  if string.match(file,"%.dtx$") then
    content = string.gsub(content,
      "\n( *)\\ProvidesExpl" .. "(%w+ *{[^}]+} *){" .. iso .. "}",
      "\n%1\\ProvidesExpl%2{" .. tagname .. "}")
    return string.gsub(content,
      "\n%% \\date{Released " .. iso .. "}\n",
      "\n%% \\date{Released " .. tagname .. "}\n")
  elseif string.match(file, "%.md$") then
    if string.match(file,"CHANGELOG.md") then
      local previous = string.match(content,"compare/(" .. iso .. ")%.%.%.HEAD")
      if tagname == previous then return content end
      content = string.gsub(content,
        "## %[Unreleased%]",
        "## [Unreleased]\n\n## [" .. tagname .."]")
      return string.gsub(content,
        iso .. "%.%.%.HEAD",
        tagname .. "...HEAD\n[" .. tagname .. "]: " .. url .. previous
          .. "..." .. tagname)
    end
    return string.gsub(content,
      "\nRelease " .. iso .. "\n",
      "\nRelease " .. tagname .. "\n")
  end
  return content
end

function update_tag_extra(file,content,tagname,tagdate)
  return(content)
end

-- Need to build format files
local function fmt(engines,dest)
  local function mkfmt(engine)
    local cmd = engine
    local opts
    if specialformats.latex[engine] then
      cmd = specialformats.latex[engine].binary or engine
      opts = specialformats.latex[engine].options
    end
    -- Use .ini files if available
    local src = "latex.ltx"
    local ini = string.gsub(engine,"tex","") .. "latex.ini"
    if fileexists(texmfdir .. "/tex/latex/tex-ini-files/" .. ini) then
      src = ini
    end
    print("Building format for " .. engine)
    local errorlevel = os.execute(
      os_setenv .. " TEXINPUTS=" .. unpackdir .. os_pathsep .. localdir
      .. os_pathsep .. texmfdir .. "//"
      .. os_concat ..
      os_setenv .. " LUAINPUTS=" .. unpackdir .. os_pathsep .. localdir
      .. os_pathsep .. texmfdir .. "//"
      .. os_concat .. cmd .. " -etex -ini -output-directory=" .. unpackdir
      .. (opts and (" " .. opts) or "")
      .. " " .. src .. " > " .. os_null)
    if errorlevel ~= 0 then
      -- Remove file extension: https://stackoverflow.com/a/34326069/6015190
      local basename = src:match("(.+)%..+$")
      local f = io.open(unpackdir .. "/" .. basename .. '.log',"r")
      local content = f:read("*all")
      io.close(f)
      print("-------------------------------------------------------------------------------")
      print(content)
      print("-------------------------------------------------------------------------------")
      print("Failed building LaTeX format for " .. engine)
      print("  Look for errors in the transcript above")
      print("-------------------------------------------------------------------------------")
      return errorlevel
    end

    local fmtname = jobname(src) .. ".fmt"
    local newname
    if specialformats.latex[engine] and specialformats.latex[engine].format then
      newname = specialformats.latex[engine].format .. ".fmt"
    else
      newname = string.gsub(engine,"tex$","latex.fmt")
    end
    if fmtname ~= newname then
      ren(unpackdir,fmtname,newname)
      fmtname = newname
    end

    cp(fmtname,unpackdir,dest)

    return 0
  end

  if options["stdengine"] then
    local errorlevel = mkfmt(stdengine)
    if errorlevel ~= 0 then return errorlevel end
  else
    for _,engine in pairs(engines) do
      local errorlevel = mkfmt(engine)
      if errorlevel ~= 0 then return errorlevel end
    end
  end
  return 0
end

function checkinit_hook()
  local engines = options.engine
  if not engines then
    local target = options.target
    if target == 'check' or target == 'bundlecheck' then
      engines = checkengines
    elseif target == 'save' then
      engines = {stdengine}
    else
      error'Unexpected target in call to checkinit_hook'
    end
  end
  return fmt(engines,testdir)
end

function cmdcheck_hook()
  return fmt({stdengine},testdir)
end

function docinit_hook()
  return fmt({typesetexe},typesetdir)
end

-- Allow for 'dev' release
--
-- See https://docs.github.com/en/actions/learn-github-actions/environment-variables
-- for the meaning of the environment variables, but tl;dr: GITHUB_REF_TYPE says
-- if we have a tag or a branch, GITHUB_REF_NAME has the corresponding name.
-- If either one of them isn't set, we look at the current git HEAD.
do
  local gh_type = os.getenv("GITHUB_REF_TYPE")
  local name = os.getenv("GITHUB_REF_NAME")
  if gh_type == "tag" and name then
    main_branch = not string.match(name,"-dev$")
  else
    if gh_type ~= "branch" or not name then
      local f = io.popen("git rev-parse --abbrev-ref HEAD")
      name = f:read("*a"):sub(1,-2)
      assert(f:close())
    end
    main_branch = string.match(name,"^main")
  end
  if not main_branch then
    tdsroot = "latex-dev"
    print("Creating/installing dev-version in " .. tdsroot)
    if bundle == "" then
      ctanpkg = module
    else
      ctanpkg = bundle
    end
    ctanpkg = ctanpkg .. "-dev"
    ctanzip = ctanpkg
  end
end