-- <summary>
-- 	  This script compares 2 values
-- </summary>
-- <name>Compare 2 values</name>
-- <param name="name" default="Compare">Name of the port</param>
-- <author>David Malzner, AV Stumpfl GmbH</author>
require("avio")
function init(name)
	avio.addPort(name,"This port offers an compare operation");
	avio.addChannel(name,"input1");
	avio.addChannel(name,"input2");
	avio.addChannel(name,"output",1);  
	avio.setFunction("compare","input1","input2");
	print("initialized script add");
end
    
function compare(input1,input2)
	if(input1 == input2) then
		res = 1;
	else
		res = 0;
	end
	avio.setChannel("output",res); 
end    

















