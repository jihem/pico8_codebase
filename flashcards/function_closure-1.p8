pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
--[[
   _._ 
 o|- -|o this file is licensed under cc4-by-nc-sa international license.
  ( l )  to view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/
    =    author: jean-marc "jihem" quere 2020 - jean-marc.quere@codyssea.com
--]]

function fib(n)
 if (n<2) return n
 return fib(n-1)+fib(n-2)
end

c_fib=(function()
 local m={}
 return function (n)
  if (m[n]) return m[n]
  if (n<2) return n
  m[n]=c_fib(n-1)+c_fib(n-2)
  return m[n]
 end
end)()

d=t()
print(fib(23)..'('..t()-d..'s)')
d=t()
print(c_fib(23)..'('..t()-d..'s)')
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000