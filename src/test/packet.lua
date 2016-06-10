package.path = './lib/?.lua;'
package.cpath = './lib/?.so;'

local chuck = require("chuck")
local packet = chuck.packet

local buff = chuck.buffer.New()
local w = packet.Writer(buff)
w:WriteI8(1)
w:WriteI16(-2)
w:WriteNum(3.2)
w:WriteStr("hello")
w:WriteStr("fasdfasdfasffdsafjklafklkfjklfjlkasfjaklfjfkjasfjaklf")
w:WriteStr("fasdfasdfasffdsafjklafklkfjklfjlkasfjaklfjfkjasfjaklf")
--w:WriteTable({-2,3,6273549})

t1 = {}
t2 = {}

t1[1] = 1
t1[2] = t2

t2[1] = 2
t2[2] = t1


--t循环引用,WriteTable报错
--w:WriteTable(t1)

local d = 2.8

w:WriteTable({a=1,b=d})

local r = packet.Reader(buff)

print(r:ReadI8())
print(r:ReadI16())
print(r:ReadNum())
print(r:ReadStr())
print(r:ReadStr())
print(r:ReadStr())
local t = r:ReadTable()
--for k,v in pairs(t) do
--	print(v)
--end
--local t = r:ReadTable()
print(t.a,t.b,d)