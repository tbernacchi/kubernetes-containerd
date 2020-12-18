# Ansible

Ansible to automate the deploy of our cluster.

## Version

```bash
ansible 2.10.3
Python 3.7.3
```
## Usage
You have to be able to reach port 22 (SSH) and resolve the hosts, in this case I put it in my ```/etc/hosts```;

```bash
ansible -i hosts all -m ping
```


```bash
ansible-playbook -i hosts main.yml --limit cluster --tags "alltogether"
ansible-playbook -i hosts main.yml --limit master --tags "master"
ansible-playbook -i hosts main.yml --limit nodes --tags "nodes"
```

## License
[MIT](https://choosealicense.com/licenses/mit/)
