-- <summary>
-- 	  This script calls a szene with 8 outputs
-- </summary>
-- <name>Scene Call Delayed</name>
-- <param name="Name" default="Scene Call Delayed">Name of the port</param>
-- <param name="Default delay" default="1000">Default value for delay (milliseconds!)</param>
-- <param name="Default output 1" default="0">Default value for output 1</param>
-- <param name="Default output 2" default="0">Default value for ouptut 2</param>
-- <param name="Default output 3" default="0">Default value for ouptut 3</param>
-- <param name="Default output 4" default="0">Default value for ouptut 4</param>
-- <param name="Default output 5" default="0">Default value for ouptut 5</param>
-- <param name="Default output 6" default="0">Default value for ouptut 6</param>
-- <param name="Default output 7" default="0">Default value for ouptut 7</param>
-- <param name="Default output 8" default="0">Default value for ouptut 8</param>
-- <author>Klemens Schwarz, AV Stumpfl GmbH</author>
require("avio")

_delay = 1000; 
_o1 = 0; 
_o2 = 0; 
_o3 = 0; 
_o4 = 0; 
_o5 = 0; 
_o6 = 0; 
_o7 = 0; 
_o8 = 0; 

function init(name, delay, o1, o2, o3, o4, o5, o6, o7, o8)
	avio.addPort(name,"");
	avio.addChannel(name,"input",1);
	avio.addChannel(name,"delay"); 
	avio.addChannel(name,"output1");  
	avio.addChannel(name,"output2");
	avio.addChannel(name,"output3"); 
	avio.addChannel(name,"output4"); 
	avio.addChannel(name,"output5"); 
	avio.addChannel(name,"output6"); 
	avio.addChannel(name,"output7"); 
	avio.addChannel(name,"output8"); 
	
	avio.setFunction("callScene","input");
	
	_delay = delay; 
	avio.setChannel("delay", delay); 
	
	_o1 = o1; 
	_o2 = o2; 
	_o3 = o3; 
	_o4 = o4; 
	_o5 = o5; 
	_o6 = o6; 
	_o7 = o7; 
	_o8 = o8; 
	print("initialized script");
end
    
function callScene(input)
	_delay = avio.getChannel("delay"); 
	if (input == 1) then
		avio.setChannel("output1", _o1); 
		avio.sleep(_delay); 
		avio.setChannel("output2", _o2);
		avio.sleep(_delay); 
		avio.setChannel("output3", _o3);
		avio.sleep(_delay); 
		avio.setChannel("output4", _o4);
		avio.sleep(_delay); 
		avio.setChannel("output5", _o5);
		avio.sleep(_delay); 
		avio.setChannel("output6", _o6);
		avio.sleep(_delay); 
		avio.setChannel("output7", _o7);
		avio.sleep(_delay); 
		avio.setChannel("output8", _o8); 
	end 
end
















