-- Simplify requiring stackline from ~/hammerspoon/init.lua

package.path = os.getenv'HOME' ..'/.config/hammerspoon/stackline/?.lua;' .. package.path
return require 'stackline.stackline'
