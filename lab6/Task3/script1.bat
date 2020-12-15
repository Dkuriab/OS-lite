net stop dnscache
ping -n 10 127.0.0.1 > nul
sc query > services_new.txt
start script2.bat
net start dnscache