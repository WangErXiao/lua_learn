#!/usr/local/bin/luajit

file=io.open("test1.txt","a+")
io.output(file)
io.write("\nhello world")
io.close(file)
