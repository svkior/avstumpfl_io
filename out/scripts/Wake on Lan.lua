-- <summary>
-- 	  This script sends Wake on Lan Magic Packet
-- </summary>
-- <name>Wake on Lan</name>
-- <param name="Name" default="Wake on Lan">Port name</param>
-- <param name="Mac" default="a0:01:b2:00:20:01">Mac address of device. Separate bytes with ":". Example: a0:01:b2:00:20:01</param>
-- <author>David Malzner, AV Stumpfl GmbH</author>
require("avio")
require("socket")
Mac = "";
udp = "";
function init(name,mac)
	avio.addPort(name,"Wake on Lan command");		
	avio.addChannel(name,"Send",1);		
	avio.setFunction("wake","Send");				
	Mac = mac;			
	udp = socket.udp();
	udp:setoption('broadcast', true);
	print("initialized script Wake on Lan");										
end
    
function wake(input)											--Logic function will be called if "Input 1" or "Input 2" changes
	if(input == 0) then return end;
	macByte = string.split(Mac,":");
	sendStr = ""
	for i=1,6 do
		sendStr = sendStr..string.char(0xFF);
	end
	for i=1,16 do
		for j,v in ipairs(macByte) do
			sendStr = sendStr..string.char(tonumber(macByte[j],16))
		end
	end  
	udp:sendto(sendStr,"255.255.255.255",1234);
end

function string.split(s,d)
   local t = {}
   local i = 0
   local f
   local match = '(.-)' .. d .. '()'
   if string.find(s, d) == nil then
      return {s}
   end
   for sub, j in string.gfind(s, match) do
         i = i + 1
         t[i] = sub
         f = j
   end
   if i~= 0 then
      t[i+1]=string.sub(s,f)
   end
   return t
end