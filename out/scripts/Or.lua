-- <summary>
-- 	  This script creates logical or operations. The output channel is 1 if at least 1 input channel is 1.
-- </summary>
-- <param name="name" default="OR">Name of the port</param>
-- <param name="nrOfInputs" default="2">Number of input channels</param>
-- <author>David Malzner, AV Stumpfl GmbH</author>
require("avio")
function init(name,nrOfInputs)
	avio.addPort(name,"This port offers logical Or channels");
	arguments = {};
	for i=1,nrOfInputs do
		channelName = "input "..i;
		avio.addChannel(name,channelName);
		arguments[i] = channelName;
	end
	avio.setFunction("avioOr",unpack(arguments));
	avio.addChannel(name,"output",1);
	print("initialized script or");
end

function avioOr(...)
	res = 0;
	arg = {...}
	for i,v in ipairs(arg) do
		if(v == 1) then
			res = 1;
			break;
		end
	end
	avio.setChannel("output",res);
end