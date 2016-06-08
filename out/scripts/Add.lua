-- <summary>
-- 	  This script adds 2 values. 1 value can be set constant. 
-- </summary>
-- <name>Add</name>
-- <param name="name" default="Add">Name of the port</param>
-- <param name="default" default="0">Default add value of input 2</param>
-- <author>David Malzner, AV Stumpfl GmbH</author>
require("avio")
function init(name,default)
	avio.addPort(name,"This port offers an add operation");
	avio.addChannel(name,"input1");
	avio.addChannel(name,"input2");
	avio.addChannel(name,"output");  
	avio.setFunction("add","input1","input2");
	avio.setChannel("input2",default); 
	print("initialized script add");
end
    
function add(input1,input2)
	res = input1+input2;
	avio.setChannel("output",res); 
end

















