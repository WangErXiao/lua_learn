#!/usr/local/bin/luajit

print(os.time())
a={year=2015,month=1,day=1,hour=8,min=1}
print(os.time(a))

local day1={year=2015,month=10,day=30}
local t1=os.time(day1)
day2={year=2015,month=10,day=31}
local t2=os.time(day2)
print(os.difftime(t2,t1))
