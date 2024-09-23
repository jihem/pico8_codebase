pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
--[[
   _._ 
 o|- -|o this file is licensed under cc4-by-nc-sa international license.
  ( l )  to view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/
    =    author: jean-marc "jihem" quere 2020 - jean-marc.quere@codyssea.com
--]]

_fill=(function()
 local _poke
 _poke=function (a,x,y)
  poke(a,x) poke(a+1,y)
  return a+(a>=0x4af1 and -0x07f3 or 2)  
 end
 return function (x,y)
  local c,i,e=pget(x,y),0x4300
  if (peek(0x5f25)!=c) then
   e=_poke(0x4300,x,y)
   while i!=e do
    x,y=peek(i),peek(i+1)
    i+=(i>=0x4af1 and -0x07f3 or 2)   
    if 
      x>-1 and x<128 and y>-1 and y<128 and
      pget(x,y)==c then
     pset(x,y)
     e=_poke(_poke(_poke(_poke(e,x-1,y),x,y-1),x+1,y),x,y+1)
    end
   end
  end
 end
end)()

function _draw()
 cls(5) color(6)
 for i=0,10 do
  circ(rnd(128),rnd(128),rnd(32)+5)
 end color(12)
 _fill(63,63)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000