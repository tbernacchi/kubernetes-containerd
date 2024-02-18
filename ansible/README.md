# kubeadm cluster v1.27.0

Ansible playbook to deploy a kubeadm kubernetes cluster.

## Version (update) 

```bash
ansible [core 2.16.3] 
Python 3.8.10
```

## Update 18/02/2024  

* master to apiserver on hosts file;
* containerd arm64;
* containerd.service file;
* crictl linux-arm64;
* include_tasks (Ansible 2.16.3);
* packages vars - kubelet kubeadm kubectl;
* master role on setup.yml does not check the `Ready` state anymore; 
* kubeadm init using {{ ansible_eth1.ipv4.address }} interface instead of eth0;
* kubeadm init wait to finish increase to 40s;
* Remove template file /var/lib/kubelet/config.yaml;
* Setup CNI Calico rather than Weave

## Usage
You have to be able to reach port 22 (SSH) and resolve the hosts, in this case I've put all my hosts on  ```/etc/hosts```;

```bash
ansible -i hosts all -m ping
```

```bash
ansible-playbook -i hosts main.yml --limit cluster --tags "alltogether"
ansible-playbook -i hosts main.yml --limit apiserver --tags "apiserver"
```

Need to double-check the nodes/workers yet:

```bash
ansible-playbook -i hosts main.yml --limit nodes --tags "nodes"
```

## License
[MIT](https://choosealicense.com/licenses/mit/)
