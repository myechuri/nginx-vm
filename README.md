# nginx-vm
Nginx on {Alpine 3.4, VirtualBox, Vagrant}

### Disclaimer

Tested in the following env:

Host: Ubuntu ``16.04 Server``

Vagrant ``1.8.1``

VirtualBox ``5.0``

### Prereqs

```
# sudo apt-get install nfs-common nfs-kernel-server
# vagrant plugin install vagrant-alpine
```

Disable firewall temporarily to allow guest to execute ``mount -o 'vers=3,udp' 192.168.50.1:'/root/nginx-vm' /vagrant``.
```
# service ufw stop
```
### Start Nginx Alpine VM

```
# vagrant up
```

### Check VM is up

```
# vagrant global-status
```

### Check Nginx is functional

From host:
```
# curl 192.168.50.4
<!doctype html>
<title>Alpine Nginx</title>

<h2>Website served by Nginx inside an Alpine VirtualBox VM</h2>

<script>
//app goes here
</script>
#
```

### Cleanup

```
# vagrant destroy -f node
==> node: Forcing shutdown of VM...
==> node: Destroying VM and associated drives...
==> node: Pruning invalid NFS exports. Administrator privileges will be required...
# 
```
