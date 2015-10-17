#!/usr/local/bin/luajit

sum=0
sum1=0
for i=1,100 do
	sum=sum+i
end
for i=1,100 , 2 do
	sum1=sum1+i
end
print("sum="..sum)
print("sum1="..sum1)
