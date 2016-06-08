-- <summary>
-- 	  This script sets the output to the wished value if the input is 1
-- </summary>
-- <name>Set Value</name>
-- <param name="Name" default="Set value">Name of the port</param>
-- <param name="Default output" default="1">Default output</param>
-- <author>Klemens Schwarz, AV Stumpfl GmbH</author>
require("avio")

OutputValueToSend = 0; 

function init(name, output)
	avio.addPort(name,"");
	avio.addChannel(name,"input", 1);
	avio.addChannel(name,"output",output);  
	avio.setFunction("setOutput","input");
	OutputValueToSend = output; 
	print("initialized script");
end
    
function setOutput(input)
	if (input == 1) then
		avio.setChannel("output", OutputValueToSend); 
	end 
end
















