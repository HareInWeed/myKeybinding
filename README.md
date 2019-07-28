# my keybinding

My personal AutoHotKey script, provide some keyboard shortcuts for daily use

## Features

- Basic emacs keybinding, including:
  
  - arrow key: `C-p`, `C-n`, `C-f`, `C-b`
  - forward & backward char: `M-b`, `M-f`
  - home & end: `C-a`, `C-e`
  - deleting text: `C-D`, `M-d`, `M-DEL`, `C-k`
  - Copy, Paste, Undo: `C-/`, `C-y`
  
  **Notice**: 
  1. All the `C` which stands for `Ctrl` in emacs, are remapped to `CapsLock`. So using this script will cause the original functionality of `CapsLock` disabled
  2. All the `M` which stands for meta key in emacs, are remapped to `Left Alt` only
  3. These shortcuts are implemented by remapping them to commonly used shortcuts with similar functionality in Windows. So they may not works as you expect in every circumstance in Windows

- Using `CapsLock + =` to enter equation mode while change the input method at the same time in Office. Could be really useful if you are using an non-english input method in Office and need to enter tons of equations among non-english characters.

- Some hot strings for Units in Office in Chinese
  
  ```AutoHotKey
  ::%cm:: 厘米
  ::%mm:: 毫米
  ::%pd:: 磅
  ::%inch:: 英寸
  ::%word:: 字符
  ::%pt:: 十二点活字
  ```

## Limitations

Since Meta Key is map to `Left Alt`, conflicts sometimes do occur. You may need to change the keybinding of some software in order to solve the conflicts.
