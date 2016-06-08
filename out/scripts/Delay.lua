-- <summary>
-- 	  This script creates commands which will be started after a specific time. 
-- </summary>
-- <param name="name" default="Delay">Port name</param>
-- <param name="nrOfOutputs" default="2">Number of output channels to be created</param>
-- <param name="delay" default="1000">Time between each command in milliseconds</param>
-- <author>David Malzner, AV Stumpfl GmbH</author>
require("avio")
mNrOfOutputs = 0;
mDelay = 0;
function init(name,nrOfOutputs,delay)
	avio.addPort(name,"This port offers delay channels");
	avio.addChannel(name,"input",1);
	for i=1,nrOfOutputs do
		channelName = "output "..i;
		avio.addChannel(name,channelName,1);
	end
	mNrOfOutputs = nrOfOutputs;
	mDelay = delay
	avio.setFunction("trigger","input");
end
function trigger(input)
	if(input ~= 0) then
		for i=1,mNrOfOutputs do
			channelName = "output "..i;
			avio.setChannel(channelName,0);
		end
		for i=1,mNrOfOutputs do
			avio.sleep(mDelay);
			channelName = "output "..i;
			avio.setChannel(channelName,1);
		end
	end
end


