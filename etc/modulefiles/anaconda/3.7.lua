-- -*- lua -*-

-- Local
local BINARY	= "anaconda"
local VERSION	= "3.7"
local BASE 	= pathJoin("/opt/pkgs", BINARY, VERSION)

-- Global
prepend_path("PATH", pathJoin(BASE, "bin"))

-- Help
help ([[
    provides anaconda 3.7 package and environment manager
]])

whatis("Name: " .. BINARY)
whatis("Version: " .. VERSION)
