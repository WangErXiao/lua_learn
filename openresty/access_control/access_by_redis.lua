local redis = require "resty.redis"
local red = redis:new()

function conn()
	red:set_timeout(1000)
	local ok, err = red:connect("127.0.0.1", 6379)
	if not ok then
		ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR)
	end
end

function check_block()
	local time=os.time()
	local res, err = red:get("block:"..ngx.var.remote_addr)
	if  res == "forbiden"  then	
		ngx.exit(ngx.HTTP_FORBIDDEN) 	
	end
end

function check_times()
	local time=os.time()	--system time
	local res, err = red:get("user:"..ngx.var.remote_addr..":"..time)
	if not res then	-- redis error
		ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR) --redis get data error
	end

	if type(res) == "string" then
		if tonumber(res) >= 10 then -- attack, 10 times request/s
			local key="block:"..ngx.var.remote_addr 
			red:set(key , "forbiden" ) 
			red:expire(key,60)
			ngx.exit(ngx.HTTP_FORBIDDEN)
		end
	end
end

function  incr_times()
	local time=os.time()	--system time
	local key="user:"..ngx.var.remote_addr..":"..time;
	ok, err = red:incr(key)
	if not ok then
		ngx.exit(ngx.HTTP_INTERNAL_SERVER_ERROR) --redis get data error
	end
	red:expire(key,60*5)
end

conn()
check_block()
check_times()
incr_times()
