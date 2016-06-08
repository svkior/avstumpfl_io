-- <summary>
-- 	  This script creates a counter. The value can be incremented and decremented by the input channels.
-- </summary>
-- <author>David Malzner, AV Stumpfl GmbH</author>
-- <param name="name" default="Count">Name of the port</param>
-- <param name="maxValue" default="255">Maximum value counted to</param>
-- <param name="increment" default="10">Value which will be added or subtracted each step</param>
require("avio")
mCount=0;
mMaxValue=0;
mIncrement=0;
function init(name,maxValue,increment)
	avio.addPort(name,"Increment/decrement");
	avio.addChannel(name,"+",1);
	avio.addChannel(name,"-",1);
	avio.addChannel(name,"output",maxValue);
	
	avio.setFunction("plus","+");
	avio.setFunction("minus","-");
	mIncrement=increment;
	mMaxValue=maxValue;
	print("initialized script count");
end

function plus(input1)
	if(input1 ~= 0 and mCount < mMaxValue) then
		mCount = mCount+mIncrement;
	end
	if(mCount > mMaxValue) then
		mCount = mMaxValue;
	end
	avio.setChannel("output",mCount);
end

function minus(input1)
	if(input1 ~= 0 and mCount > 0) then
		mCount = mCount-mIncrement;
	end
	if(mCount < 0) then
		mCount = 0;
	end
	avio.setChannel("output",mCount);
end
