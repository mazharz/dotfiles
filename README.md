# How

```bash
# make sure you're in ~/.dotfiles/
$ sudo stow -t / .
```

## Note

The "/home/m47h4r/bin/brightness" script which modifies system files needs special permissions to be able to do so.
In order for it to work, one must give it 755 and +s permissions, then add this line to visudo:

m47h4r ALL=(root) NOPASSWD: /home/m47h4r/bin/brightness
