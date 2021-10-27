# vim-jrnl

## Description

This repository provides support for `.jrnl` files, created by the [`jrnl`](https://github.com/jrnl-org/jrnl) command from within Vim & NeoVim. 

The image below shows a file with and without this plugin installed, on the left-hand and right-hand sides respectively.

![screenshot with and without plugin installed](https://user-images.githubusercontent.com/25112463/138997004-d7127510-5ae6-41d6-ba6e-d7e18f0bf558.png)

## Features

The current set of supported features includes:

* `jrnl` header lines

* `jrnl` tags (e.g.: `@tag`)

* Bullet points

* Spoiler tags

* Folding
  * Level 1 fold on every jrnl entry
  * More fold levels for more higher markdown heading levels (e.g. `### Heading 3`)
  * Another fold level for a line starting with bolded text

* Todo boxes (requires conceal)
  * `- [ ]` Empty checkbox with highlighted line
  * `- [x]` Checked box with greyed indented text
  * `- [i]` Info icon
  * `- [i]` Question icon
  * `- [*]` Star icon
  * `- [!]` High priority item
  * `- [c]` Cancelled item (greyed out with an "x" instead of a "check")
  * `- [.]` Current item (via `todo.txt`)

* Detect episode markers (e.g. s11e09), and exempt from spellcheck

* [Nerd Fonts][] 

Please feel free to suggest any new features, but be aware that features with use-cases that are too niche are unlikely to be approved.

## Installation

See a few example below, or refer to your plugin manager's documentation.

### [Packer][packer]

```lua
use 'wren/jrnl.vim'
```

### [Vundle][vundle]

```vim
Plugin 'wren/jrnl.vim'
```

### [vim-plug][plug]

```vim
Plug 'wren/jrnl.vim'
```

[Nerd Fonts]: https://www.nerdfonts.com/
[packer]: https://github.com/wbthomason/packer.nvim
[vundle]: https://github.com/gmarik/vundle
[plug]: https://github.com/junegunn/vim-plug
