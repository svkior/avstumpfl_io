-- <summary>
-- 	  This scripts defines an area in a 2D field and indicates if the x- and y coordinates of the input are inside or outside this area.
-- </summary>
-- <name>Add</name>
-- <param name="name" default="Get Area">Name of the port</param>
-- <param name="Width" default="1920">Width of area to detect</param>
-- <param name="Height" default="1080">Height of area to detect</param>
-- <param name="Object Upper Left X" default="100">Upper left X position of object to detect</param>
-- <param name="Object Upper Left Y" default="100">Upper left Y position of object to detect</param>
-- <param name="Object Lower Right X" default="200">Lower right X position of object to detect</param>
-- <param name="Object Lower Right Y" default="200">Lower right Y position of object to detect</param>
-- <param name="Invert Y Position" default="0">Inverts Y Position if value is set to 1</param>
-- <author>David Malzner, AV Stumpfl GmbH</author>
require("avio")
Ulx = 0;
Ulx = 0;
Lrx = 0;
Lry = 0;
Invert = 0;
Height = 0;
function init(name,width,height,ulx,uly,lrx,lry,invert)
	avio.addPort(name,"This port detects an area");
	avio.addChannel(name,"in x",width);
	avio.addChannel(name,"in y",height);
	avio.addChannel(name,"out detected",1);
	Ulx = ulx;
	Uly = uly;
	Lrx = lrx;
	Lry = lry;
	Height = height;
	Invert = invert;
	avio.setFunction("detect","in x","in y");
	print("initialized script get area");
end
    
function detect(x,y)
	if(Invert == 1) then
		y = Height-y;
	end
	if x > Ulx and x < Lrx and y > Uly and y < Lry then
		result = 1;
	else
		result = 0;
	end
	if(result ~= lastResult) then
		avio.setChannel("out detected",result)
	end
	lastResult = result
end  
