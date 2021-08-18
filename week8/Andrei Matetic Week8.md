# Networking Fundamentals Homework: Rocking your Network!  

## Phase 1: "I'd like to Teach the World to `Ping`"  

I created a file with the CIDR address blocks associated with the Hollywood servers  

```  
sysadmin@UbuntuDesktop:~$ cat hollywoo.txt  
15.199.95.91/28  
15.199.94.91/28  
11.199.158.91/28  
167.172.144.11/32  
11.199.141.91/28  
```

```
sysadmin@UbuntuDesktop:~/Desktop/week8$ for cidr in $(cat hollywoo.txt); do fping -c 1 -r 1 -g $cidr 2>/dev/null ; done    
167.172.144.11 : [0], 84 bytes, 41.0 ms (41.0 avg, 0% loss)  
```  
As RockStar Corp doesn't want any of their servers responding to ICMP requests, the server at 167.172.144.11 needs to be reconfigured not to send replies to a `ping` request. ICMP operates at layer 3.

## Phase 2:  "Some `SYN` for Nothin"

```
sudo nmap -sS 167.172.144.11
[sudo] password for sysadmin:

Starting Nmap 7.60 ( https://nmap.org ) at 2021-08-12 20:07 CDT
Nmap scan report for 167.172.144.11
Host is up (0.0044s latency).
Not shown: 999 filtered ports
PORT   STATE SERVICE
22/tcp open  ssh

Nmap done: 1 IP address (1 host up) scanned in 16.58 seconds
```  
SSH is an application layer protocol. While not exactly a vulnerability, 22 is the well known port for SSH, and it can be configured to listen on a non-standard port. Doing so would only deter anyone going after low hanging fruit and not anyone with the time and patience to do a full port scan.  

Not a network issue, but RockStar Corp sets their servers up with the same default username/password combination. Overall password hygiene should be reviewed.

## Phase 3: I Feel a `DNS` Change Comin' On  

```  
ssh jimi@167.172.144.11
jimi@167.172.144.11's password:
Linux GTscavengerHunt 4.9.0-11-amd64 #1 SMP Debian 4.9.189-3+deb9u1 (2019-09-20) x86_64

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Sat Aug 14 01:33:02 2021 from 174.50.161.39
Could not chdir to home directory /home/jimi: No such file or directory
$ pwd
/

$ cat etc/hosts
# Your system has configured 'manage_etc_hosts' as True.
# As a result, if you wish for changes to this file to persist
# then you will need to either
# a.) make changes to the master file in /etc/cloud/templates/hosts.tmpl
# b.) change or remove the value of 'manage_etc_hosts' in
#     /etc/cloud/cloud.cfg or cloud-config from user-data
#
127.0.1.1 GTscavengerHunt.localdomain GTscavengerHunt
127.0.0.1 localhost
98.137.246.8 rollingstone.com

oooooooollowing lines are desirable for IPv6 capable hosts
::1 ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
ff02::3 ip6-allhosts

sysadmin@UbuntuDesktop:~$ nslookup rollingstone.com
Server:		8.8.8.8
Address:	8.8.8.8#53

Non-authoritative answer:
Name:	rollingstone.com
Address: 151.101.64.69
Name:	rollingstone.com
Address: 151.101.0.69
Name:	rollingstone.com
Address: 151.101.192.69
Name:	rollingstone.com
Address: 151.101.128.69

sysadmin@UbuntuDesktop:~$ nslookup 98.137.246.8
8.246.137.98.in-addr.arpa	name = unknown.yahoo.com.

Authoritative answers can be found from:
```  
DNS is an application layer protocol that maps hostnames, that are human memorable, to IP address. Mappings can also be statically defined in the `/etc/hosts` file. Address lookups check `/etc/hosts` before sending the request to configured nameserver.  The added `98.137.246.8 rollingstone.com` entry sends requests to `unknown.yahoo.com`.  Remediation options include monitoring the hosts file for changes and changing the lookup order to query DNS before checking the hosts file.

## Phase 4:  Sh`ARP` Dressed Man  

In the ARP packets below, two different devices claim to have the same IP address of 192.168.47.200. Further investigation is required to determine if this is a configuration error or something malicious (e.g. ARP spoofing).  

```  
3	2014-01-06 16:56:26.348782	ARP	42		Who has 192.168.47.200? Tell 192.168.47.171
4	2014-01-06 16:56:26.348860	ARP	60		192.168.47.200 is at 00:0c:29:0f:71:a3
5	2014-01-06 16:56:36.933972	ARP	42		192.168.47.200 is at 00:0c:29:1d:b3:b1
```  

The `HTTP POST` verb allows for a client to send data to the server.  A message is being sent via a contact form: *Hi Got The Blues Corp!  This is a hacker that works at Rock Star Corp.  Rock Star has left port 22, SSH open if you want to hack in.  For 1 Milliion Dollars I will provide you the user and password!*  

HTTP is an application layer protocol to interact with websites. Data is sent in the clear so something can be set to scan for specific text (e.g. actual usernames and passwords) and flag for review. 

```  
16	2019-08-15 08:01:46.121459902	10.0.2.15	33546	104.18.126.89	80	HTTP	1876	7	POST

POST /formservice/en/3f64542cb2e3439c9bd01649ce5595ad/6150f4b54616438dbb01eb877296d534/c3a179f3630a440a96196bead53b76fa/I660593e583e747f1a91a77ad0d3195e3/ HTTP/1.1
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101 Firefox/60.0
Referer: http://www.gottheblues.yolasite.com/contact-us.php

0%3Ctext%3E=Mr+Hacker&0%3Clabel%3E=Name&1%3Ctext%3E=Hacker%40rockstarcorp.com&1%3Clabel%3E=Email&2%3Ctext%3E=&2%3Clabel%3E=Phone&3%3Ctextarea%3E=Hi+Got+The+Blues+Corp%21++This+is+a+hacker+that+works+at+Rock+Star+Corp.++Rock+Star+has+left+port+22%2C+SSH+open+if+you+want+to+hack+in.++For+1+Milliion+Dollars+I+will+provide+you+the+user+and+password%21&3%3Clabel%3E=Message&redirect=http%3A%2F%2Fwww.gottheblues.yolasite.com%2Fcontact-us.php%3FformI660593e583e747f1a91a77ad0d3195e3Posted%3Dtrue&locale=en&redirect_fail=http%3A%2F%2Fwww.gottheblues.yolasite.com%2Fcontact-us.php%3FformI660593e583e747f1a91a77ad0d3195e3Posted%3Dfalse&form_name=&site_name=GottheBlues&wl_site=0&destination=DQvFymnIKN6oNo284nIPnKyVFSVKDX7O5wpnyGVYZ_YSkg%3D%3D%3A3gjpzwPaByJLFcA2ouelFsQG6ZzGkhh31_Gl2mb5PGk%3D&g-recaptcha-response=03AOLTBLQA9oZg2Lh3adsE0c7OrYkMw1hwPof8xGnYIsZh8cz5TtLwl8uDMZuVOls6duzyYq2MTzsVHYzKda77dqzzNUwpa6F5Tu6b9875yKU1wZHpfOQmV8D7OTcx2rnGD6I8s-6qvyDAjCuS6vA78-iNLNUtWZXFJwleNj3hPquVMu-yzcSOX60Y-deZC8zXn8hu4c6uW0-aWc711YdgRnK3yOFlHy7cZEciuwkE_Hx_7ZyrbZBhdGF8_z6F9LIq6tk-OLs6HBp-6GG0yWy7A2iD0NmnO2TBDPBe9Si54sGlzVNP-RLm1mazWyu4GzBRk5GfJNOcJxa30c20coEIgEIYGCSCFbJhfAHTTP/1.1 303 See Other

Date: Thu, 15 Aug 2019 13:01:47 GMT
Location: http://www.gottheblues.yolasite.com/contact-us.php?formI660593e583e747f1a91a77ad0d3195e3Posted=true
```  
