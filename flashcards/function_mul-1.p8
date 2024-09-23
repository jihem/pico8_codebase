pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
--[[
   _._ 
 o|- -|o this file is licensed under cc4-by-nc-sa international license.
  ( l )  to view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/
    =    author: jean-marc "jihem" quere 2020 - jean-marc.quere@codyssea.com
--]]

function _mul(a,b)
 local r=0
 while b>0 do
  if (b%2==1) r+=a
  a=shl(a,1)
  b=flr(shr(b,1))
 end
 return r
end

cls()
print(_mul(21,13))

print(band(12.34,0xffff.0000))
print(band(12.34,0x0000.ffff))

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000