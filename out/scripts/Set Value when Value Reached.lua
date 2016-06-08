-- <summary>
-- 	  This script sets the output to the wished value if the input reaches a certain value
-- </summary>
-- <name>Set value when value reached</name>
-- <param name="Name" default="Value reached">Name of the port</param>
-- <param name="Default input" default="120">Minimum input value after when to set the output</param>
-- <param name="Default output" default="0">Default output</param>
-- <author>Klemens Schwarz, AV Stumpfl GmbH</author>
require("avio")

MinimumInputValue = 120; 
OutputValueToSend = 0; 
OutputReached = false; 

function init(name, input, output)
	avio.addPort(name,"");
	avio.addChannel(name,"input");
	avio.addChannel(name,"output",output);  
	avio.setFunction("setOutput","input");
	MinimumInputValue = input;  
	OutputValueToSend = output; 
	print("initialized script");
end
    
function setOutput(input)
	if (input >= MinimumInputValue and OutputReached == false) then
		avio.setChannel("output", OutputValueToSend); 
		OutputReached = true; 
	end 
	if (input < MinimumInputValue) then
		OutputReached = false; 
	end  
end
















