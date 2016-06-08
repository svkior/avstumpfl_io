-- <summary>
-- 	  This scripts writes the string value of a channel to a textfile if the channel changes. 
-- </summary>
-- <name>Write File</name>
-- <param name="name" default="Write File">Name of the port</param>
-- <param name="filename" default="c:\test\text.txt">Path to filename</param>
-- <author>David Malzner, AV Stumpfl GmbH</author>
require("avio")
Filename = "";
function init(name,filename)
	avio.addPort(name,"This ports writes a file","string");
	avio.addChannel(name,"Text");
	Filename=filename;
	avio.setFunction("writeText","Text");
end
    
function writeText(text)
	file = io.open(Filename,"w+");
	if(file ~= nil) then
		file:write(text)
		file:close();
	end
end
