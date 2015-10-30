#!/usr/local/bin/luajit

a ={1 , 3,5, "hello"}

print(table.concat(a))
print(table.concat(a,"!"))

b={1,8}
table.insert(b,1,3)
print(b[1],b[2],b[3])

