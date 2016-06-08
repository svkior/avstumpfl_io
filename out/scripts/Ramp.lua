-- <summary>
-- 	  This script creates a ramp. The ramp starts if input channel "trigger" is set and becomes start value if input channel "reset" is set. The input channel "fadetime" sets the duration 
--	  of the ramp. 
-- </summary>
-- <author>David Malzner, AV Stumpfl GmbH</author>
-- <param name="name" default="Ramp">Name of the port</param>
-- <param name="start" default="0">Reset value of ramp</param>
-- <param name="stop" default="255">Stop value of ramp</param>
-- <param name="fadetime" default="50">Default fadetime, can be changed by input channel "fadetime" at runtime</param>
require("avio")
mStart=0;
mStop=0;
mFadetime=0;
function init(name,start,stop,fadetime)
	avio.addPort(name,"Ramp");
	avio.addChannel(name,"trigger",1);
	avio.addChannel(name,"reset",1);
	avio.addChannel(name,"fadetime",100);
	avio.addChannel(name,"output",stop);	
	avio.setFunction("fade","trigger");
	avio.setFunction("reset","reset");
	avio.setFunction("setFadetime","fadetime");
	mStart=start;
	mStop=stop;
	mFadetime=fadetime;
	print("initialized script ramp "..fadetime);
end

function ramp(channel,start,stop,duration)
	timeStep=50;
	a=stop-start; 
	b=duration/timeStep;
	increment= a/b;
	if(increment==0) then							--minimum of 1 increment
		increment=1;
	end
	print(start.." "..stop.." "..increment);
	for i=start,stop,increment do
		avio.setChannel(channel,i);
		avio.sleep(timeStep);
	end
	avio.setChannel(channel,stop);
end

function fade(trigger)
	if(trigger ~= 0) then
		print(mStart.." "..mStop.." "..mFadetime);
		ramp("output",mStart,mStop,mFadetime*50);
	end
end

function setFadetime(fadetime)
	mFadetime=fadetime;
end

function reset(reset)
	if(reset ~= 0) then
		avio.setChannel("output",0);
	end
end

