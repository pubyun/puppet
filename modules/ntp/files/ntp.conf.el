restrict default kod nomodify notrap nopeer noquery
restrict 127.0.0.1
server time.bitcomm.cn prefer
server ntp.time.ac.cn
server time.nist.gov
server  127.127.1.0     # local clock
fudge   127.127.1.0 stratum 10
driftfile /var/lib/ntp/drift
