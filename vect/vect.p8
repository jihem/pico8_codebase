pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
--[[
   _._ 
 o|- -|o this file is licensed under cc4-by-nc-sa international license.
  ( l )  to view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/
    =    author: jean-marc "jihem" quere 2016 - jean-marc.quere@codyssea.com
--]]

oop={
 new=function(_,o)
  o=o or {}
  _.__index=_
  return setmetatable(o,_)
 end
}

function rot(x,y,a)
return {
         x*cos(a)-y*sin(a),
         x*sin(a)+y*cos(a)
       }
end

plr=oop:new({
 c={ {-5,5},{0,-5},{5,5} },
 p={},
 l={ {1,2},{2,3},{3,1} },
 a=0,
 v=2,
 x=63,
 y=63,
 draw=function(_)
  _.p={}
  for c in all(_.c) do
   add(_.p,rot(c[1],c[2],_.a))
  end
  for l in all(_.l) do
   line(_.p[l[1]][1]+_.x
       ,_.p[l[1]][2]+_.y
       ,_.p[l[2]][1]+_.x
       ,_.p[l[2]][2]+_.y
       ,5)
  end
  for p in all(_.p) do
   pset(p[1]+_.x
       ,p[2]+_.y
       ,6)
  end
  camera(_.x-63,_.y-63)
  cursor(_.x-63,_.y-63)
  print(_.a,7)
 end,
 update=function(_)
  _.a+=(btn(⬅️) and  0.01) or
       (btn(➡️) and -0.01) or
       0
       
  if btn(⬆️) then
   _.x+=_.v*cos(_.a+0.25)
   _.y+=_.v*sin(_.a+0.25)
  end
 end
})

function _init()
 p1=plr:new()
end

function _draw()
 cls()
 rect(30,30,97,97,3)
 p1:draw()
end

function _update()
 p1:update()
end 
oop={
 new=function(_,o)
  o=o or {}
  _.__index=_
  return setmetatable(o,_)
 end
}

function rot(x,y,a)
return {
         x*cos(a)-y*sin(a),
         x*sin(a)+y*cos(a)
       }
end

plr=oop:new({
 c={ {-5,5},{0,-5},{5,5} },
 p={},
 l={ {1,2},{2,3},{3,1} },
 a=0,
 v=2,
 x=63,
 y=63,
 draw=function(_)
  _.p={}
  for c in all(_.c) do
   add(_.p,rot(c[1],c[2],_.a))
  end
  for l in all(_.l) do
   line(_.p[l[1]][1]+_.x
       ,_.p[l[1]][2]+_.y
       ,_.p[l[2]][1]+_.x
       ,_.p[l[2]][2]+_.y
       ,5)
  end
  for p in all(_.p) do
   pset(p[1]+_.x
       ,p[2]+_.y
       ,6)
  end
  camera(_.x-63,_.y-63)
  cursor(_.x-63,_.y-63)
  print(_.a,7)
 end,
 update=function(_)
  _.a+=(btn(⬅️) and  0.01) or
       (btn(➡️) and -0.01) or
       0
       
  if btn(⬆️) then
   _.x+=_.v*cos(_.a+0.25)
   _.y+=_.v*sin(_.a+0.25)
  end
 end
})

function _init()
 p1=plr:new()
end

function _draw()
 cls()
 rect(30,30,97,97,3)
 p1:draw()
end

function _update()
 p1:update()
end

__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
