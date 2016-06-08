-- <summary>
-- 	  This script divides 2 values. Input values can be set constant.
-- </summary>
-- <param name="name" default="Div">Name of the port</param>
-- <param name="dividend" default="0">Default add value of dividend</param>
-- <param name="divisor" default="1">Default add value of divisor</param>
-- <author>David Malzner, AV Stumpfl GmbH</author>
require("avio")
function init(name,dividend,divisor)
	avio.addPort(name,"This port offers an divide operation");
	avio.addChannel(name,"dividend");
	avio.addChannel(name,"divisor");
	avio.addChannel(name,"output");
	avio.setFunction("div","dividend","divisor");
	avio.setChannel("dividend",dividend);
	avio.setChannel("divisor",divisor);
	print("initialized script div");
end

function div(dividend,divisor)
	if(divisor ~= 0) then
		res = dividend/divisor;
	else
		res = 0;
		print("divide by 0 error in div.lua");
	end
	avio.setChannel("output",res);
end