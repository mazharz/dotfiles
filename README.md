# How

## populate dotfiles

```bash
# make sure you're in ~/.dotfiles/
stow -t .. home
sudo stow -t /etc etc
```

## manually add dns records

Add your dns records to `./etc/NetworkManager/dnsmasq.d/local.conf` (it isn't tracked to avoid IP leaks):

```dnsmasq
server=1.1.1.1

address=/name/1.1.1.1
```
