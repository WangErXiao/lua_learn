#!/usr/local/bin/luajit

local a ={ "a","b","c","d"}

for i , v in ipairs(a) do
	print("index:"..i.." values:"..v)
end
