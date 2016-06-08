-- <summary>
-- 	  Multiplexes multiple signals to one output 
-- </summary>
-- <param name="Name" default="Multiplex">Name of the port</param>
-- <param name="Number of inputs" default="2">Number of inputs to be multiplexed (max. 100)</param>
-- <param name="Max. value of inputs" default="255">Maximum Value of inputs. This is important for automatic scaling</param>
-- <author>David Malzner, AV Stumpfl GmbH</author>
require("avio")
function init(name,nrOfInputs,maxVal)
	avio.addPort(name,"Multiplexer")
	if(nrOfInputs > 100) then
		nrOfInputs = 100
	end
	avio.addChannel(name,"Select Input",nrOfInputs-1);
	arguments = {}
	arguments[1] = "Select Input";
	for i=1,nrOfInputs do
		channelName = "input "..i-1
		avio.addChannel(name,channelName,maxVal)
		arguments[i+1] = channelName;
	end
	avio.setFunction("multiplex",unpack(arguments))
	avio.addChannel(name,"output",maxVal)
end
function multiplex(...)
	arg = {...}
	selectedChannel = arg[1]
	output = avio.getChannel("input "..selectedChannel)
	avio.setChannel("output",output)
end


