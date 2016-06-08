-- <summary>
-- 	  This script creates logical and operations. The output channel is 1 if all input channels are 1. 
-- </summary>
-- <name>Logical AND</name>
-- <param name="name" default="AND">Name of the port</param>
-- <param name="nrOfInputs" default="2">Number of input channels to be created</param>
-- <author>David Malzner, AV Stumpfl GmbH</author>
require("avio")
function init(name,nrOfInputs)
	avio.addPort(name,"This port offers logical AND channels");
	arguments = {};
	for i=1,nrOfInputs do
		channelName = "input "..i;
		avio.addChannel(name,channelName,1);
		arguments[i] = channelName;
	end
	avio.setFunction("avioAnd",unpack(arguments));
	avio.addChannel(name,"output",1);
	print("initialized script and");
end

function avioAnd(...)
	res = 1;
	arg = {...}
	for i,v in ipairs(arg) do
		if(v == 0) then
			res = 0;
		end
	end
	avio.setChannel("output",res);
end