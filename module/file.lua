#!/usr/local/bin/luajit

file=io.input("table.lua")

repeat 
	line =io.read()
	if nil ==line then
		break
	end
	print(line)
until (false)

io.close(file)
