# dotfiles
.bashrc, .tmux.conf, .gitconfig, etc

this repo uses [gnu stow](https://www.gnu.org/software/stow/)

## use

```bash
# from dotfiles clone root
stow --dir $PWD --target $HOME --dotfiles .
```

## blog posts

- [Split Monolithic YAML File by Kubernetes Kind](https://charlesthomas.dev/blog/split-monolithic-yaml-file-by-kubernetes-kind-2024-10-04/)
  - `bin/split-by-kind`
- [when alias isn't enough: $@](https://charlesthomas.dev/blog/when-alias-isnt-enough-@-2022-11-20/)
  - `bin/d`
  - `bin/g`
  - `bin/kc`
  - `examples/demo-args`
- [Lightning Fast Code Search in the Terminal](https://charlesthomas.dev/blog/lightning-fast-code-search-in-the-terminal-2023-11-08/)
  - `bin/finf`
  - `bin/range`
  - `bin/vf`
  - `bin/cf`

## contents

### bin

- `d`
  - do `docker` things
- `cf`
  - pipe the output of `grep` or `bin/finf` to it to open the file in VS Code at the specified line
- `finf`
  - find-in-file
  - chains together `ripgrep`, `fzf`, `bat`, and `bin/range`
- `g`
  - do `git` things
- `kc`
  - do `kubectl` things
- `range`
  - for displaying nice previews with `bin/finf`
- `vf`
  - pipe the output of `grep` or `bin/finf` to it to open the file in `vim` at the specified line

### examples

- `demo-args`
  - demonstrate bash argument variables like `$1` and `$#`

