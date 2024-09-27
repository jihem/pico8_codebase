pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
--[[
   _._ 
 o|- -|o this file is licensed under cc4-by-nc-sa international license.
  ( l )  to view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/
    =    author: jean-marc "jihem" quere 2017 - jean-marc.quere@codyssea.com
--]]

function iif(c,t,f)
 if c then
  return t
 else
  return f
 end
end

function tcp(t)
 local u = { }
 for k, v in pairs(t) do
  u[k] = v 
 end
 return u
end

lab={}
function lab:new(o)
 o=o or {}
 setmetatable(o,self)
 self.__index=self
 return o
end

function lab:init()
 local l,i={}

 self.l={}
 for i=1,self.w do
  add(l,3)
 end
 add(l,1)
 for i=1,self.h do
  add(self.l,tcp(l)) 
 end
 l={}
 for i=1,self.w do
  add(l,2)
 end
 add(self.l,l)

 local s,i,j={}
 for i=0,self.h-1 do
  for j=0,self.w-1 do
   if j>0 then
    add(s,{i*self.w+j-1,i*self.w+j})
   end
   if i>0 then
    add(s,{(i-1)*self.w+j,i*self.w+j})
   end
  end
 end
 l={}
 for i=0,self.w*self.h-1 do
  add(l,i)
 end
 
 local c,a,b,k=true
 while c do
  j=flr(rnd(#s))+1
  a=l[s[j][1]+1]
  b=l[s[j][2]+1]
  if a!=b then  
   if s[j][2]-s[j][1]==1 then
    self.l[flr(s[j][2]/self.w)+1][s[j][2]%self.w+1]=band(2,self.l[flr(s[j][2]/self.w)+1][s[j][2]%self.w+1])
   else
    self.l[flr(s[j][2]/self.w)+1][s[j][2]%self.w+1]=band(1,self.l[flr(s[j][2]/self.w)+1][s[j][2]%self.w+1])  
   end  
   c=false
   for k=1,self.w*self.h do
    if l[k]==a then
     l[k]=b
    end
    if l[k]!=b then
     c=true
    end
   end
  end
  del(s,s[j])
 end 
end

function lab:update()
end

function lab:draw()
 local l,i,c,x0,y0,x1,y1

 for l=1,#self.l do
  for i=1,#self.l[l] do
   c=self.l[l][i]
   x1=self.x+self.sx*i
   y1=self.y+self.sy*l
   x0=x1-self.sx
   y0=y1-self.sy
   
   color(7)
   if band(c,1)==1 then
    line(x0,y1,x0,y0)
   end
   if band(c,2)==2 then
    line(x0,y0,x1,y0)
   end
  
  end
 end
 
end

local lll
function _init()
 lll=lab:new({x=23,y=23,sx=8,sy=8,w=10,h=10})
 lll:init()
end

function _update()
 if btnp(1) or btnp(2) or btnp(3) or btnp(4) then
  run()
 end
end

function _draw()
 cls(1)
 if lll!=nil then
  lll:draw()
 end
 print("press ⬅️⬆️⬇️➡️ to generate",12,118,7) 
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__label__
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111777777777777777777777777777777777777777777777777777777777777777777777777777777777111111111111111111111111
11111111111111111111111711111111111111111111111711111111111111171111111111111111111111111111111111111117111111111111111111111111
11111111111111111111111711111111111111111111111711111111111111171111111111111111111111111111111111111117111111111111111111111111
11111111111111111111111711111111111111111111111711111111111111171111111111111111111111111111111111111117111111111111111111111111
11111111111111111111111711111111111111111111111711111111111111171111111111111111111111111111111111111117111111111111111111111111
11111111111111111111111711111111111111111111111711111111111111171111111111111111111111111111111111111117111111111111111111111111
11111111111111111111111711111111111111111111111711111111111111171111111111111111111111111111111111111117111111111111111111111111
11111111111111111111111711111111111111111111111711111111111111171111111111111111111111111111111111111117111111111111111111111111
11111111111111111111111711111117111111177777777711111117777777777777777777777777111111177777777711111117111111111111111111111111
11111111111111111111111711111117111111111111111711111111111111171111111711111111111111111111111711111117111111111111111111111111
11111111111111111111111711111117111111111111111711111111111111171111111711111111111111111111111711111117111111111111111111111111
11111111111111111111111711111117111111111111111711111111111111171111111711111111111111111111111711111117111111111111111111111111
11111111111111111111111711111117111111111111111711111111111111171111111711111111111111111111111711111117111111111111111111111111
11111111111111111111111711111117111111111111111711111111111111171111111711111111111111111111111711111117111111111111111111111111
11111111111111111111111711111117111111111111111711111111111111171111111711111111111111111111111711111117111111111111111111111111
11111111111111111111111711111117111111111111111711111111111111171111111711111111111111111111111711111117111111111111111111111111
11111111111111111111111711111117777777777777777711111117777777771111111777777777111111177777777777777777111111111111111111111111
11111111111111111111111711111111111111171111111111111111111111111111111111111117111111171111111711111117111111111111111111111111
11111111111111111111111711111111111111171111111111111111111111111111111111111117111111171111111711111117111111111111111111111111
11111111111111111111111711111111111111171111111111111111111111111111111111111117111111171111111711111117111111111111111111111111
11111111111111111111111711111111111111171111111111111111111111111111111111111117111111171111111711111117111111111111111111111111
11111111111111111111111711111111111111171111111111111111111111111111111111111117111111171111111711111117111111111111111111111111
11111111111111111111111711111111111111171111111111111111111111111111111111111117111111171111111711111117111111111111111111111111
11111111111111111111111711111111111111171111111111111111111111111111111111111117111111171111111711111117111111111111111111111111
11111111111111111111111777777777111111177777777711111117777777777777777777777777111111171111111711111117111111111111111111111111
11111111111111111111111711111111111111111111111711111111111111111111111111111117111111111111111111111117111111111111111111111111
11111111111111111111111711111111111111111111111711111111111111111111111111111117111111111111111111111117111111111111111111111111
11111111111111111111111711111111111111111111111711111111111111111111111111111117111111111111111111111117111111111111111111111111
11111111111111111111111711111111111111111111111711111111111111111111111111111117111111111111111111111117111111111111111111111111
11111111111111111111111711111111111111111111111711111111111111111111111111111117111111111111111111111117111111111111111111111111
11111111111111111111111711111111111111111111111711111111111111111111111111111117111111111111111111111117111111111111111111111111
11111111111111111111111711111111111111111111111711111111111111111111111111111117111111111111111111111117111111111111111111111111
11111111111111111111111711111117111111177777777711111117777777771111111711111117777777771111111711111117111111111111111111111111
11111111111111111111111711111117111111111111111711111117111111111111111711111117111111111111111711111117111111111111111111111111
11111111111111111111111711111117111111111111111711111117111111111111111711111117111111111111111711111117111111111111111111111111
11111111111111111111111711111117111111111111111711111117111111111111111711111117111111111111111711111117111111111111111111111111
11111111111111111111111711111117111111111111111711111117111111111111111711111117111111111111111711111117111111111111111111111111
11111111111111111111111711111117111111111111111711111117111111111111111711111117111111111111111711111117111111111111111111111111
11111111111111111111111711111117111111111111111711111117111111111111111711111117111111111111111711111117111111111111111111111111
11111111111111111111111711111117111111111111111711111117111111111111111711111117111111111111111711111117111111111111111111111111
11111111111111111111111711111117111111177777777777777777111111177777777777777777111111177777777777777777111111111111111111111111
11111111111111111111111711111117111111171111111711111111111111111111111711111111111111111111111111111117111111111111111111111111
11111111111111111111111711111117111111171111111711111111111111111111111711111111111111111111111111111117111111111111111111111111
11111111111111111111111711111117111111171111111711111111111111111111111711111111111111111111111111111117111111111111111111111111
11111111111111111111111711111117111111171111111711111111111111111111111711111111111111111111111111111117111111111111111111111111
11111111111111111111111711111117111111171111111711111111111111111111111711111111111111111111111111111117111111111111111111111111
11111111111111111111111711111117111111171111111711111111111111111111111711111111111111111111111111111117111111111111111111111111
11111111111111111111111711111117111111171111111711111111111111111111111711111111111111111111111111111117111111111111111111111111
11111111111111111111111777777777111111171111111711111117777777771111111777777777111111177777777711111117111111111111111111111111
11111111111111111111111711111111111111171111111111111117111111111111111711111111111111171111111111111117111111111111111111111111
11111111111111111111111711111111111111171111111111111117111111111111111711111111111111171111111111111117111111111111111111111111
11111111111111111111111711111111111111171111111111111117111111111111111711111111111111171111111111111117111111111111111111111111
11111111111111111111111711111111111111171111111111111117111111111111111711111111111111171111111111111117111111111111111111111111
11111111111111111111111711111111111111171111111111111117111111111111111711111111111111171111111111111117111111111111111111111111
11111111111111111111111711111111111111171111111111111117111111111111111711111111111111171111111111111117111111111111111111111111
11111111111111111111111711111111111111171111111111111117111111111111111711111111111111171111111111111117111111111111111111111111
11111111111111111111111711111117777777771111111711111117777777771111111711111117111111171111111777777777111111111111111111111111
11111111111111111111111711111111111111171111111711111117111111111111111111111117111111171111111111111117111111111111111111111111
11111111111111111111111711111111111111171111111711111117111111111111111111111117111111171111111111111117111111111111111111111111
11111111111111111111111711111111111111171111111711111117111111111111111111111117111111171111111111111117111111111111111111111111
11111111111111111111111711111111111111171111111711111117111111111111111111111117111111171111111111111117111111111111111111111111
11111111111111111111111711111111111111171111111711111117111111111111111111111117111111171111111111111117111111111111111111111111
11111111111111111111111711111111111111171111111711111117111111111111111111111117111111171111111111111117111111111111111111111111
11111111111111111111111711111111111111171111111711111117111111111111111111111117111111171111111111111117111111111111111111111111
11111111111111111111111711111117777777771111111711111117111111177777777777777777111111177777777711111117111111111111111111111111
11111111111111111111111711111111111111111111111711111117111111111111111711111117111111171111111711111117111111111111111111111111
11111111111111111111111711111111111111111111111711111117111111111111111711111117111111171111111711111117111111111111111111111111
11111111111111111111111711111111111111111111111711111117111111111111111711111117111111171111111711111117111111111111111111111111
11111111111111111111111711111111111111111111111711111117111111111111111711111117111111171111111711111117111111111111111111111111
11111111111111111111111711111111111111111111111711111117111111111111111711111117111111171111111711111117111111111111111111111111
11111111111111111111111711111111111111111111111711111117111111111111111711111117111111171111111711111117111111111111111111111111
11111111111111111111111711111111111111111111111711111117111111111111111711111117111111171111111711111117111111111111111111111111
11111111111111111111111777777777111111177777777711111117111111171111111711111117777777771111111711111117111111111111111111111111
11111111111111111111111711111111111111171111111111111117111111171111111111111117111111111111111111111117111111111111111111111111
11111111111111111111111711111111111111171111111111111117111111171111111111111117111111111111111111111117111111111111111111111111
11111111111111111111111711111111111111171111111111111117111111171111111111111117111111111111111111111117111111111111111111111111
11111111111111111111111711111111111111171111111111111117111111171111111111111117111111111111111111111117111111111111111111111111
11111111111111111111111711111111111111171111111111111117111111171111111111111117111111111111111111111117111111111111111111111111
11111111111111111111111711111111111111171111111111111117111111171111111111111117111111111111111111111117111111111111111111111111
11111111111111111111111711111111111111171111111111111117111111171111111111111117111111111111111111111117111111111111111111111111
11111111111111111111111777777777777777777777777777777777777777777777777777777777777777777777777777777777111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111177717771777117711771111117777711177777111777771117777711111177711771111117717771771177717771777177717771111111111111
11111111111171717171711171117111111177711771777177717711177177117771111117117171111171117111717171117171717117117111111111111111
11111111111177717711771177717771111177111771771117717711177177111771111117117171111171117711717177117711777117117711111111111111
11111111111171117171711111711171111177711771771117717771777177117771111117117171111171717111717171117171717117117111111111111111
11111111111171117171777177117711111117777711177777111777771117777711111117117711111177717771717177717171717117117771111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
