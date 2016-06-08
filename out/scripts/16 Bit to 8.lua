-- <summary>
-- 	  This script converts a 16 bit value to 2 8 bit values. This is usually used for DMX
-- </summary>
-- <param name="name" default="16To8">The name of the port</param>
-- <author>David Malzner, AV Stumpfl GmbH</author>
require("avio")
function init(name)	avio.addPort(name,"This port converts a 16 Bit value to 2 8 Bit values");
	avio.addChannel(name,"16BitInput",65535);
	avio.addChannel(name,"outputMSB",255);
	avio.addChannel(name,"outputLSB",255);
	avio.setFunction("convert","16BitInput");
end

function convert(input)	msb = math.floor(input/256);
	lsb = math.floor(input%256);
	avio.setChannel("outputMSB",msb);
	avio.setChannel("outputLSB",lsb);
end


