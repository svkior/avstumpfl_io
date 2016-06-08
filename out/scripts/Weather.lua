-- <summary>
-- 	  Retrieve current and future weather online from http://free.worldweatheronline.com
-- </summary>
-- <name>Get weather information from http://free.worldweatheronline.com </name>
-- <param name="Name" default="Weather">Name of the port</param>
-- <param name="City" default="Wallern an der Trattnach">Name of City</param>
-- <param name="Country" default="Austria">Country</param>
-- <param name="Days" default="5">Number of future days to retrieve</param>
-- <param name="API Key" default="kxnwb49ncjfbgjtykumhahp8">API Key for accessing the service. Register your own at www.worldweatheronline.com</param>
-- <param name="Proxy Server" default="">Proxy Server for internet connection (optional) Example: http://10.4.0.1:3128</param>
-- <author>David Malzner, AV Stumpfl GmbH</author>
require("avio")
require('LuaXml')
-- load the http module
require("io")
require("socket.http")
require("ltn12")
urlweather="http://api.worldweatheronline.com/free/v1/weather.ashx?q="
City = {}
Country = {}
Days = {}
APIKey = {}
Proxy = nil
function init(name,city,country,days,apikey,proxy)
	City = city
	Country = country
	if(days > 5) then
		days = 5
	end
	Days = days
	APIKey = apikey
	if(type(proxy) == "string" and proxy:sub(1,7) == "http://") then
		Proxy = proxy
	end
	avio.addPort(name,"The weather");
	avio.addChannel(name,"Force Retrieve",1);	
	avio.addChannel(name,"Temp. Now",100);
	avio.addChannel(name,"Windspeed Now [km/h]",500);
	avio.setFunction("checkWeather","Force Retrieve");
	for i=1,Days do
		avio.addChannel(name,"Temp. Max Day+"..i,100)
		avio.addChannel(name,"Windspeed Max Day+"..i,500)
	end
	--checkWeather()
	print("initialized script weather")
end
    
function checkWeather()
	res = {}
	print("Start Request")
	urlformated = urlweather..City..","..Country.."&format=xml&num_of_days="..Days.."&key="..APIKey
	urlformated = string.gsub(urlformated," ","+")
	
	if(Proxy ~= nil) then
		r, c, h, s = socket.http.request
		{
			url = urlformated,
			proxy = Proxy,
			sink = ltn12.sink.table(res)
		}
	else
		r, c, h, s = socket.http.request
		{
			url = urlformated,
			sink = ltn12.sink.table(res)
		}
	end
	res = table.concat(res)
	weatherxml = xml.eval(res)
	current = weatherxml:find("current_condition")
	temp = current:find("temp_C")
	avio.setChannel("Temp. Now",tonumber(temp[1]))
	wind = current:find("windspeedKmph")
	avio.setChannel("Windspeed Now [km/h]",tonumber(wind[1]))
	days = weatherxml:find("weather")
	i=1
	for att,cont in res:gmatch'<weather>(.-)</weather>' do
		day = xml.eval("<weather>"..att.."</weather>")
		temp = day:find("tempMaxC")
		wind = day:find("windspeedKmph")
		avio.setChannel("Temp. Max Day+"..i,tonumber(temp[1]))
		avio.setChannel("Windspeed Max Day+"..i,tonumber(wind[1]))
		i = i+1
	end
	
	print("Finished")
end
