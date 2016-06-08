-- <summary>
-- 	  This script subtracts 2 values. Values can be set constant 
-- </summary>
-- <param name="name" default="Sub">Name of the port</param>
-- <param name="default1" default="0">Default add value of minuend</param>
-- <param name="default2" default="0">Default add value of subtrahend</param>
-- <author>David Malzner, AV Stumpfl GmbH</author>
require("avio")
function init(name,default1,default2)
	avio.addPort(name,"This port offers an subtract operation");
	avio.addChannel(name,"minuend");
	avio.addChannel(name,"subtrahend");
	avio.addChannel(name,"output");
	avio.setFunction("sub","minuend","subtrahend");
	avio.setChannel("minuend",default1);
	avio.setChannel("subtrahend",default2);
	print("initialized script sub");
end

function sub(minuend,subtrahend)
	res = minuend-subtrahend;
	avio.setChannel("output",res);
end