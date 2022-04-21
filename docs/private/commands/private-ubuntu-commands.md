### Network
echo "1" > /proc/sys/net/ipv4/ip__forward
sudo iptables -t nat -A PREROUTING -p tcp --dport 22 -j REDIRECT --to-port 2222

netsh interface portproxy add v4tov4 listenport=35999 listenaddress=0.0.0.0 connectport=80 connectaddress=0.0.0.0

netsh http delete urlacl url=http://*:35999/ user=Everyone
