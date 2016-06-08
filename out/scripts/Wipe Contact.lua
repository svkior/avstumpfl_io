-- <summary>
-- 	  This script sets the output to 1 and back to 0 after the setted delay
-- </summary>
-- <name>Wipe Contact</name>
-- <param name="Name" default="Wipe Contact">Name of the port</param>
-- <param name="Default delay in milliseconds" default="750">Default delay between setting the output to 1 and back to 0</param>
-- <author>Klemens Schwarz, AV Stumpfl GmbH</author>
require("avio")

Delay = 750; 

function init(name, delay)
	avio.addPort(name,"");
	avio.addChannel(name,"input",1);
	avio.addChannel(name,"delay");  
	avio.addChannel(name,"output",1); 
	avio.setChannel("delay", delay); 
	avio.setFunction("wipe","input");
	OutputValueToSend = output; 
	print("initialized script");
end
    
function wipe(input)
	if (input == 1) then
		avio.setChannel("output", 1); 
		avio.sleep(Delay);
		avio.setChannel("output", 0); 
	end 
end
















