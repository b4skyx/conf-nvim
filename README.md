![Banner](https://user-images.githubusercontent.com/55960554/128978364-8cc6768c-cdc1-4e07-93e4-6ac7b4289730.png)

---

A simple configuration for neovim > 0.5 suiting my personal taste. While its purpose is to provides me with the resources to replicate my setup on any machine, it may be used as a reference to build your own setups.

### Features:

- Major config is in lua
- Async and ondemand loading of plugins
- Using vim-plug for plugin management. Forked to allow loading plugins on events such as Cursorhold

I use coc-nvim instead of built in lsp. Nvim lsp is a minimal solution but as of yet it lacks control over the parts of lsp you want to display. I can't make it show me the error codes.

Configs for both lsp and coc-nvim are present just incase.

### Structure

The folder heirarchy is as follows

```
├── autoload
├── init.vim
├── lua
│   ├── colorscheme.lua
│   ├── keymappings.lua
│   ├── settings.lua
│   ├── config-folders/
│   └── init.lua
├── plugin
└── syntax
```

`autoload` contains the vim autocmds as there is no proper method to define autocmds in lua yet.
<br>
The init.vim is initially loaded which loads the lua/init.lua at the end.

```vim
" Make nvim load the lua directory
lua << EOF
require("init")
EOF
```

The init file imports the configuration for plugins as required.

### Preview

![main](https://user-images.githubusercontent.com/55960554/128986734-98803e87-d4aa-4bf5-b87a-c8af870b686b.png)
![compact](https://user-images.githubusercontent.com/55960554/128987602-6026a8ce-77a3-40b8-8aff-9963a6abd565.png)
---
