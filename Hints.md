---
title: "Hints"
output:
  html_document:
    toc: true
    fig_caption: true
    css: styles.css
---

# Hints (for Linux)

## Console
Personal console style and shortcuts are stored in `~/.bashrc`

To reload your style use: `. ~/.bashrc`



## Dragable Script

1. Create a scriptfile PATH_TO_SCRIPT_FILE with the following contents:
```bash
#!/bin/bash
FILE=$1
#doSomething with $FILE
```
2. Create a `MyName.desktop` file
```
[Desktop Entry]
Name=MyName
Exec=PATH_TO_SCRIPT_FILE %U
Type=Application
```

3. Do `chmod +x PATH_TO_SCRIPT_FILE`

