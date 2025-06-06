#!/usr/bin/env texlua

-- Build script for LaTeX3 "l3kernel" files

-- Identify the bundle and module
module = "l3kernel"
bundle = ""

-- Location of main directory: use Unix-style path separators
maindir = ".."
docfiledir = "./doc"

-- Non-standard settings
checkconfigs = 
  {
    "build",
    "config-ptex", "config-backend", "config-l3doc", 
    "config-plain", -- "config-context"
  }
checkfiles   = {"l3names.def"}
cleanfiles   = {"*.fmt", "*.log", "*.pdf", "*.zip"}
docfiles     = {"source3body.tex", "l3prefixes.csv"}
installfiles =
  {
    "l3dvipdfmx.def", "l3dvips.def", "l3dvisvgm.def", "l3pdfmode.def",
    "l3xdvipdfmx.def",
    "l3str-enc-*.def",
    "l3debug.def", "l3sys.def",
    "expl3.lua","expl3.ltx",
    "*.cls", "*.sty", "*.tex"
  }
sourcefiles  = {"*.dtx", "*.ins"}
tagfiles     =
  {
    "*.dtx", "CHANGELOG.md", "README.md",
    "interface3.tex", "l3styleguide.tex",
    "l3syntax-changes.tex",
    "l3term-glossary.tex",
    "source3.tex",
    "*.ins"
  }
typesetfiles =
  {
    "expl3.dtx", "l3docstrip.dtx", "l3doc.dtx", "interface3.tex",
    "l3syntax-changes.tex", "l3styleguide.tex", "l3term-glossary.tex",
    "source3.tex", "l3prefixes.tex", "l3news*.tex"
  }
typesetskipfiles = {"source3-body.tex"}
typesetruns      = 3
unpackfiles      = {"l3.ins"}

checkdeps   = {maindir .. "/l3backend"}
typesetdeps = typesetdeps

-- Load the common build code
dofile(maindir .. "/build-config.lua")

-- Detail how to set the version automatically
function update_tag_extra(file,content,tagname,tagdate)
  local iso = "%d%d%d%d%-%d%d%-%d%d"
  if string.match(file,"expl3%.dtx$") then
    content = string.gsub(content,
      "\n\\def\\ExplFileDate{" .. iso .. "}%%\n",
      "\n\\def\\ExplFileDate{" .. tagname .. "}%%\n")
  elseif string.match(file,"%.tex$") then
    content = string.gsub(content,
      "\n\\date{Released " .. iso .. "}\n",
      "\n\\date{Released " .. tagname .. "}\n")
  end
  return(content)
end

uploadconfig = {
  author      = "The LaTeX Project team",
  license     = "lppl1.3c",
  summary     = "LaTeX3 programming conventions",
  topic       = {"macro-supp","latex3","expl3"},
  ctanPath    = "/macros/latex/required/l3kernel",
  repository  = "https://github.com/latex3/latex3/",
  bugtracker  = "https://github.com/latex3/latex3/issues",
  update      = true,
  description = [[
The l3kernel bundle provides an implementation of the LaTeX3 programmers'
interface, as a set of packages that run under LaTeX2e. The interface
provides the foundation on which the LaTeX3 kernel and other future code
are built: it is an API for TeX programmers. The packages are set up so that
the LaTeX3 conventions can be used with regular LaTeX2e packages.
  ]]
}

function cmdcheck()
  mkdir(localdir)
  cleandir(testdir)
  dep_install(checkdeps)
  unpack()
  cmdcheck_hook()
  for _,filetype in pairs(
      {bibfiles, docfiles, typesetfiles, typesetdemofiles}
    ) do
    for _,file in pairs(filetype) do
      cp(file, docfiledir, testdir)
    end
  end
  for _,file in pairs(sourcefiles) do
    cp(file, sourcefiledir, testdir)
  end
  for _,file in pairs(typesetsuppfiles) do
    cp(file, supportdir, testdir)
  end
  print("Checking source3")
  run(
    testdir,
    os_setenv .. " TEXINPUTS=." .. os_pathsep .. abspath(localdir)
      .. os_pathsep ..
    os_concat ..
    stdengine .. " --fmt=" .. string.gsub(stdengine, "tex$", "latex") .. 
      " --interaction=batchmode" ..
      " \"\\PassOptionsToClass{check}{l3doc} \\input source3.tex \""
      .. " > " .. os_null
  )
  for line in io.lines(testdir .. "/source3.cmds") do
    if string.match(line, "^%!") then
      print("   - " .. string.match(line, "^%! (.*)"))
    end
  end
end

target_list = target_list or { }
target_list.cmdcheck =
  {
    func = cmdcheck,
    desc = "Run cmd cover test"
  }
