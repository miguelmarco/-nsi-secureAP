#! /bin/lua
os.execute("sleep 4");
while true do
    lf = io.popen([[ls /dev/ttyUSB*]]):lines()(0)
    fi = io.open(lf);
    chr = fi:read();
    chr2 = fi:read();
    fi:close();
    os.execute("sh /etc/SecureAP/generauser " .. chr);
    os.execute("sleep 4");
end;
