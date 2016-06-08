-- <summary>
-- 	  This script creates a logical not operation. The output is 1 if input is 0, 0 otherwise
-- </summary>
-- <param name="name" default="NOT">Name of the port</param>
-- <author>David Malzner, AV Stumpfl GmbH</author>
require("avio")
function init(name)
	avio.addPort(name,"This port offers logical Not channels");
	avio.addChannel(name,"input",1);
	avio.addChannel(name,"output",1);
	avio.setFunction("avioNot","input");
	print("initialized script not");
end

function avioNot(input)
	res=0;
	if(input == 0) then
		res = 1;
	end
	avio.setChannel("output",res);
end

