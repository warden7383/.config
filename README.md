# Warden7383's personal nvim config
This is my personal nvim config that is personalized for my needs.<br>
## Requirements:
- [neovim nightly](https://github.com/neovim/neovim/releases/)
- [rg(rip grep)](https://github.com/BurntSushi/ripgrep)
- [fd(finder)](https://github.com/sharkdp/fd)
- 
- a nerd font (I'm using jetbrains mono nerd font)
- terminal of your choice<br>

Usage:
`git clone https://github.com/warden7383/.config/`
> [!TIP]
> Run a ```:checkhealth``` to see what else you need
##### Eye Candy
\[Insert eye candy here\]<br>
### Todo(features):
- highlights
- learn vim-fugitive, inc-rename, muren.nvim, telescope-file-browser, nvim-spectre, lazygit(maybe?)
### Fixes:
- bufResize:
    - original split size not being restored unless its resize method is called and the windows are 
    manually resized.
    - ToggleDiagnostics + ToggleTerm(together) causes window size restore issues
