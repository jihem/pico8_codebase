pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
--[[
   _._ 
 o|- -|o this file is licensed under cc4-by-nc-sa international license.
  ( l )  to view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/
    =    author: jean-marc "jihem" quere 2020 - jean-marc.quere@codyssea.com
--]]

function _if(c,t,f) return c and t or f end

function _line(x0,y0,x1,y1,cl)
 local dx,dy,ii,ix,iy,jx,jy,mi,mn,mx
 if (cl) color(cl)
 dx=x1-x0
 dy=y1-y0
 ix=_if(dx==0,0,sgn(dx))
 iy=_if(dy==0,0,sgn(dy))
 dx=abs(dx)+1
 dy=abs(dy)+1
 mx=max(dx,dy)
 mn=min(dx,dy)
 ii=mx
 jx=_if(dx==ii,ix,0)
 jy=_if(dy==ii,iy,0)
 ix=_if(dx==ii,0,ix)
 iy=_if(dy==ii,0,iy)
 mi=0
 while ii>0 do
  pset(x0,y0)
  x0+=jx
  y0+=jy
  mi+=mn
  if mi>mx then
   mi-=mx
   x0+=ix
   y0+=iy
  end
  ii-=1
 end
end

cls()
_line(20,64,48,78)
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000