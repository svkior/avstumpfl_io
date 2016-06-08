-- <summary>
-- 	  This script sends a mail over smtp server. Encryption (SSL or TLS) is not supported !
-- </summary>
-- <name>Mail SMTP</name>
-- <param name="Name" default="Mail">Name of the port</param>
-- <param name="From" default="david@example.com">Sender</param>
-- <param name="To" default="john@example.com">Receiver</param>
-- <param name="Subject" default="Hello from AVIO">Subject of mail</param>
-- <param name="Body" default="This message was sent from IOBox, Wings 5 or AVIO Service">The content of the mail</param>
-- <param name="Mailserver" default="mail.gmx.at">SMTP Server</param>
-- <param name="Port" default="25">SMTP Server</param>
-- <param name="Username" default="david@example.com">Username for authentication</param>
-- <param name="Password" default="secret123">Password for authentication</param>
-- <author>David Malzner, AV Stumpfl GmbH</author>
local smtp = require("socket.smtp")
require("avio")
From = {}
To = {}
Subject = {}
Body = {}
Mailserver = {}
Port = {}
User = {}
Pass = {}
function init(name,from,to,subject,body,mailserver,port,user,pass)
	From = from
	To = to
	Subject = subject
	Body = body
	Mailserver = mailserver
	Port = port
	User = user
	Pass = pass
	avio.addPort(name,"Send an email message")	avio.addPort(name.." Content","Content of email message","string");	avio.addChannel(name.." Content","Content");	avio.setChannel("Content",body);
	avio.addChannel(name,"Send Mail")
	avio.setFunction("send","Send Mail")
end
function send(value)
	if(value==0) then 
		return
	end	Body = avio.getChannel("Content");
	mesgt = {
	    	headers = {
	   	 	to = To,
	    	subject = Subject
  		},
  			body = Body
		}
	r, e = smtp.send{
	  from = From,
	  rcpt = To, 
	  source = smtp.message(mesgt),
	  server = Mailserver,
	  user = User,
	  password = Pass,
	  port = Port
	}
	print(r)
	print(e)
end

