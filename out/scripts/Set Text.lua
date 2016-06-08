-- <summary>
-- 	  This script sets the output to the wished text if the input is 1
-- </summary>
-- <name>Set Text</name>
-- <param name="Name" default="Set text">Name of the port</param>
-- <param name="Default output" default="">Default output (character '&' must be replaced by character '|' if needed for URLs etc.)</param>
-- <author>Klemens Schwarz, AV Stumpfl GmbH</author>
require("avio")

TextToSend = ""; 

function init(name, textToSend)
	avio.addPort(name,"");
	avio.addPort(name.." Text", "", "string"); 
	avio.addChannel(name,"input", 1);
	avio.addChannel(name.." Text","text to send");  
	avio.setFunction("setText","input");
	textToSend = textToSend:gsub("|", "&"); 
	TextToSend = textToSend; 
	print("initialized script");
end
    
function setText(input)
	if (input == 1) then
		avio.setChannel("text to send", TextToSend); 
	end 
end
















