# thay cert
echo "#############################"
echo "install-haproxy.sh"
sudo apt update
sudo add-apt-repository ppa:vbernat/haproxy-2.7 -y
sudo apt update
sudo apt install haproxy=2.7.\* -y
sudo systemctl status haproxy
haproxy -v




sudo tee -a /etc/haproxy/haproxy.cfg > /dev/null << EOF
frontend frontend_https
        bind :80 
        bind *:443 ssl crt /etc/haproxy/certs/       
        mode http
        option httpclose
        option forwardfor
        http-request set-header X-Forwarded-Proto http unless { ssl_fc } or { req.hdr(X-Forwarded-Proto) https }
        http-request set-header X-Forwarded-Proto https if { ssl_fc }
        http-request redirect scheme https code 301 if !{ ssl_fc }

        #reqadd X-Forwarded-Proto:\ https        
        cookie  SRVNAME insert indirect nocache
        default_backend backend_ingress       

backend backend_ingress
        mode    http
        stats   enable
        stats   auth username:password
        balance roundrobin
        server  master1 MASTER_IP:30080 cookie p1 weight 1 check inter 2000
EOF

privateip=`hostname -i |cut -d " " -f1`
echo "privateip=$privateip"
sudo sed -i "s/MASTER_IP/$privateip/g" /etc/haproxy/haproxy.cfg
sudo tail -25 /etc/haproxy/haproxy.cfg

sudo mkdir -p /etc/haproxy/certs
sudo tee /etc/haproxy/certs/viettq.pem > /dev/null << EOF
-----BEGIN RSA PRIVATE KEY-----
#input ssl cert your domain here! 
-----END CERTIFICATE-----
EOF

sudo service haproxy restart
echo "haproxy status after installation"
sudo service haproxy status