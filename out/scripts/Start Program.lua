-- <summary>
-- 	  This scripts starts a program if input channel is set
-- </summary>
-- <name>Start Program</name>
-- <param name="Name" default="Start Program">Name of the port</param>
-- <param name="Program Name" default="Notepad">Name of program</param>
-- <param name="Program Path" default="c:\windows\notepad.exe">Path to program</param>
-- <author>David Malzner, AV Stumpfl GmbH</author>
require("avio")
ProgPath="";
function init(name,progName,progPath)
	avio.addPort(name,"This port contains a program to start");
	avio.addChannel(name,progName,1);
	avio.setFunction("start",progName);
	ProgPath = progPath;
	print("initialized script Start Program");
end
    
function start(input)
	if input ~= 0 then
		os.execute(ProgPath)
	end
end

























