ipv4 is equal to 2^32 = 4294967296 (means there is 4294967296 unique ip addresses in the world)

because,
min value: 00000000.00000000.00000000.00000000
max value: 11111111.11111111.11111111.11111111

and each part have 8 bits
11111111 binary is equal to 255 in decimal
00000000 binary is equal to 0 in decimal

the range of each part is 0-255
the last IP address is: 255.255.255.255
and the first IP address is: 0.0.0.0


when we write 10.0.0.0/8 its means we are using 8 bits for network and 24 bits for host 
thats why
10.0.0.0/16 = 2^16  = 65536
10.0.0.0/24 = 2^8   = 256
10.0.0.0/28 = 2^4   = 16
10.0.0.0/32 = 2^0   = 1

in the same way
192.168.1.0 - 192.168.1.255 (there will be 256 address)so /24
= 192.168.1.0/24

192.168.2.0 - 192.168.2.255 (there will be 256 addresses) so /24
= 192.168.2.0/24

192.168.3.0 - 192.168.3.255 (there will be 256 addresses) so /24
= 192.168.3.0/24

192.168.4.0 - 192.168.4.255 (there will be 256 addresses) so /24
= 192.168.4.0/24
