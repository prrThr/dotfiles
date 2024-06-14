## This config uses Lazy.nvim as the plugin manager
```
nvim/
├── init.lua
├── lazy-lock.json
├── lua/
│   ├── keybinds.lua
│   ├── vim-options.lua
│   └── plugins/
│       ├── barbar.lua
│       ├── neoscroll.lua
│       ├── telescope.lua
│       ├── toggleterm.lua
│       └── ...
```   
---
- **nvim/init.lua**<br>
Main configuration file that initializes Lazy.nvim, sets global NeoVim options, and loads plugins and key mappings.

- **nvim/lazy-lock.json**<br>
File that tracks the versions of plugins installed by Lazy.nvim. Each plugin is listed with its branch and specific commit.

- **nvim/lua/vim-options.lua**<br>
File that sets NeoVim configuration options.

- **nvim/lua/keybinds.lua**<br>
File that defines key mappings for various functionalities and plugins.

- **nvim/lua/plugins**<br>
This directory contains specific configurations for each plugin. Each file in the 'plugins' directory configures one or more plugins.
