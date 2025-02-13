first enable the required ports:

sudo ufw allow 2377/tcp
sudo ufw allow 7946/tcp
sudo ufw allow 7946/udp
sudo ufw allow 4789/udp
sudo ufw reload

ip tables: 

sudo iptables -A INPUT -p tcp --dport 2377 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 7946 -j ACCEPT
sudo iptables -A INPUT -p udp --dport 7946 -j ACCEPT
sudo iptables -A INPUT -p udp --dport 4789 -j ACCEPT

check if firewall is enabled

sudo ufw status

if not sudo ufw enable

# init the swarm on the docker manager 

"sudo docker swarm init --advertise-addr 192.168.133.252

# to join swarm as worker

"docker swarm join --token SWMTKN-1-6804tywy1ruufryk7xhw8nwmmqhwtv1kzh0wn3hpky8k0boi2s-4nk12xykylv3bfuhr99gbw8pa 192.168.133.252:2377"

# running a test service

docker service create --replicas 1 --name helloworld alpine ping docker.com

# check 

sudo docker services ls

# inspecting the service

docker service inspect --pretty <SERVICE-ID>

# check which nodes are running the service

docker service ps <SERVICE-ID>

# scaling the service

 docker service scale <SERVICE-ID>=<NUMBER-OF-TASKS>

 # deleting the service

  docker service rm "servicename"

https://docs.docker.com/engine/swarm/swarm-tutorial/rolling-update/






