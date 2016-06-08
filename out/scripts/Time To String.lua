-- <summary>
-- 	   This script converts an integer time value to a formated string time value formated as hh:mm:ss
-- </summary>
-- <name>Time To String</name>
-- <param name="Name" default="Time To String">Port name</param>
-- <param name="Devider" default="1000">Devider to convert input value to seconds</param>
-- <author>Oliver Hauser, David Malzner, AV Stumpfl GmbH</author>
require("avio")
Devider = 1;
function init(name,devider)
	avio.addPort(name.." Input Integer","");					
	avio.addPort(name.." Output hh:mm:ss","","string");			
	avio.addChannel(name.." Input Integer","Input Integer");		
	avio.addChannel(name.." Output hh:mm:ss","Output hh:mm:ss"); 	
	Devider = devider;
	avio.setFunction("convert","Input Integer");						
end
    
   
function convert(input)	
	minus=false
	if(input < 0) then
		input = input*-1;
		minus = true;
	end										
	sec = input/Devider;
	if(sec == lastSec) then return end;
	lastSec = sec;
	h = math.floor(sec / 3600);
	min = math.floor((sec % 3600) / 60);
	sec = math.floor((sec % 3600) % 60);
	res = ""
	minusStr = ""
	if(minus) then
		minusStr = "-"
	end
	if h < 10 then
		res = minusStr.."0" .. h;
	else
		res = minusStr..h;
	end
	res = res .. ":";
	if min < 10 then
		res = res .. "0" .. min;
	else
		res = res .. min;
	end
	res = res .. ":"
	if sec < 10 then
		res = res .. "0" .. sec;
	else
		res = res .. sec;
	end
	avio.setChannel("Output hh:mm:ss",res);
end
