/system scheduler
add name=schedule1 on-event=first-setup policy=\
    ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
    start-time=startup
