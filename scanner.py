#!/bin/python

import sys
import socket
from datetime import datetime

#Define the target using argument from command line
if len(sys.argv) == 2:
	target = socket.gethostbyname(sys.argv[1]) 	#Translate hostname to IPv4 address
else:
	print("Invalid number of arguments.\nSyntax: python3 scanner.py <ip>")
	
#Banner at script start
print ("-" * 50)
print ("Scanning target "+target)
print ("Time started: "+str(datetime.now()))
print ("-" * 50)

try:
	for port in range(1,255):	#Sets min/max port values
		s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		socket.setdefaulttimeout(1)
		result = s.connect_ex((target,port))	#Returns an error indicator
		if result == 0:
			print("Port {} is open".format(port))
		s.close()
		
except keyboardInterrupt:
	print ("\nExiting program.")
	sys.exit()
	
except socket.gaierror:
	print("Hostname could not be resolved.")
	sys.exit()
	
except socket.error:
	print("Couldn't connect to server.")
	sys.exit()
