-- <summary>
-- 	  Get the angle in degree (0-360) of 2 points in a 2D area defined by x- and y coordinates
-- </summary>
-- <name>Add</name>
-- <param name="name" default="Add">Name of the port</param>
-- <author>David Malzner, AV Stumpfl GmbH</author>
require("avio")
function init(name)
	avio.addPort(name,"This port offers an add operation");
	avio.addChannel(name,"in x1",1000);
	avio.addChannel(name,"in y1",1000);
	avio.addChannel(name,"in x2",1000);
	avio.addChannel(name,"in y2",1000);
	avio.addChannel(name,"out angle",360);
	avio.setFunction("getAngle","in x1","in y1","in x2","in y2");
	print("initialized script getRotation");
end
    
function getAngle(x1,y1,x2,y2)
	a = (y2-y1)/2;
	b = (x2-x1)/2;
	angleRad = math.pi-math.atan(a/b);
	angleDeg = angleRad * (360/(2*math.pi))
	avio.setChannel("out angle",angleDeg);
end 

































