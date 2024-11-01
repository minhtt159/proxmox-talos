# proxmox-talos

So, first of all, I'm following this [guide](https://www.talos.dev/v1.8/talos-guides/install/virtualized-platforms/proxmox/)
And I'm checking out talhelper cli

https://budimanjojo.github.io/talhelper/latest/getting-started/

I'm creating talconfig.yaml for my example cluster

Getting disk from these command:

```bash
talosctl disks -n 10.1.0.20 --insecure
talosctl disks -n 10.1.0.30 --insecure
```

Giving these results:

```bash
❯ talosctl disks -n 10.1.0.20

NODE        DEV          MODEL           SERIAL   TYPE      UUID   WWID   MODALIAS      NAME   SIZE     BUS_PATH                                                                               SUBSYSTEM          READ_ONLY   SYSTEM_DISK
10.1.0.20   /dev/sda     QEMU HARDDISK   -        SSD       -      -      scsi:t-0x00   -      69 GB    /pci0000:00/0000:00:1e.0/0000:05:04.0/0000:09:01.0/virtio2/host6/target6:0:0/6:0:0:0   /sys/class/block               *
```

Then running these command to bootstrap it

```bash
talosctl apply-config --insecure -n 10.1.0.20 -f clusterconfig/chivel-pi0.yaml
talosctl apply-config --insecure -n 10.1.0.30 -f clusterconfig/chivel-talos-worker1.yaml

talosctl bootstrap -n pi0
talosctl kubeconfig .
```
