#!/usr/local/bin/luajit

print(string.byte("abc",1,3))
print(string.byte("abc",3))
print(string.byte("abc"))

print(string.char(97,98,99))
print(string.char())
print(string.char(65,66))

print(string.upper("Hello Lua"))

print(string.len("hello lua"))

print(string.format("%.4f",3.1415926))

print(string.rep("abc",3))

print(string.reverse("Hello Lua"))
