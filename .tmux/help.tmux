#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

show_menu() {
    $(
        tmux display-menu -T "#[align=centre fg=green]Help" -x C -y C "" \
            "Tmux Help" "t" "run -b 'source \"$CURRENT_DIR/help.tmux\" && show_menu_tmux'" \
            "Zshell Help" "z" "run -b 'source \"$CURRENT_DIR/help.tmux\" && show_menu_zsh'" \
            "fzf wild Help" "f" "run -b 'source \"$CURRENT_DIR/help.tmux\" && show_menu_fzf'" \
            "Vim Help" "v" "run -b 'source \"$CURRENT_DIR/help.tmux\" && show_menu_vim'" \
            "git Help" "g" "run -b 'source \"$CURRENT_DIR/help.tmux\" && show_menu_git'" \
            "WM Help" "w" "run -b 'source \"$CURRENT_DIR/help.tmux\" && show_menu_wm'" \
            "cgdb Help" "c" "run -b 'source \"$CURRENT_DIR/help.tmux\" && show_menu_cgdb'" \
            "command tips Help" "p" "run -b 'source \"$CURRENT_DIR/help.tmux\" && show_menu_bash_tips'"
    )
}

show_menu_tmux() {
    $(
        tmux display-menu -T "#[align=centre fg=green]Tmux Help" -x C -y C "" \
            "C-q ] 粘贴复制模式中复制的文本" "" "" \
            "C-q ! 将当前面板移动到新的窗口" "" "" \
            "C-q ; 切换到最近面板" "" "" \
            "C-q I install tmux plugin Alt+u uninstall" "" "" \
            "C-q hjkl 面板切换 HJKL 调整面板" "" "" \
            "C-q C-s C-r save/restore tmux" "" "" \
            "C-q 0~9 切换到指定窗口" "" "" \
            "C-q z 最大化当前面" "" "" \
            "C-q q show pane number " "" "" \
            "C-q R reload config" "" "" \
            "C-q t 显示时钟" "" "" \
            "tmux -S file new" "" "" \
            "tmux -S shared_file attach" "" ""
    )
}

show_menu_zsh() {
    $(
        tmux display-menu -T "#[align=centre fg=green]Zshell Help" -x C -y C "" \
            "C-h 删除前一个字符" "" "" \
            "C-u 删除光标前面内容" "" "" \
            "C-l C-a C-e C-w C-t fzf C-r history" "" "" \
            "fancy-ctrl-z copypath 复制文件目录的路径" "" "" \
            "acs show alias, wd/x/ua" "" "" \
            "C-s emoji, git-cal 日历像github" "" "" \
            "zsh -ixc : 2>&1 | grep ..." "" ""\
            "fzf: alt-c 目录 gss git stash" "" "" \
            "gd git diff ga git add gcf git checkout file" "" "" \
            "!foo 执行以 foo 开头的命令 !?foo 包含 foo" "" "" \
            "!-n 执行倒数第 n 条命令" "" "" \
            "!$ 上一条命令的最后一位参数" "" "" \
            "!^ 上一条命令的第一个参数 " "" "" \
            "!:n 得到上一条命令第 n 个参数" "" ""
    )
}

show_menu_fzf() {
    $(
        tmux display-menu -T "#[align=centre fg=green]fzf Search syntax Help" -x C -y C "" \
            "'wild exact-match" "" "" \
            "^wild 前缀匹配" "" "" \
            ".mp3\$ 后缀匹配" "" "" \
            "!wild 反向匹配不包含wild" "" ""
    )
}

show_menu_vim() {
    $(
        tmux display-menu -T "#[align=centre fg=green]Vim Help" -x C -y C "" \
            "Coc Command" "" "run -b 'source \"$CURRENT_DIR/help.tmux\" && show_menu_vim_coc'" \
            "vim tips" "" "run -b 'source \"$CURRENT_DIR/help.tmux\" && show_menu_vim_tip" \
            "vim regex help" "" ""
    )
}

show_menu_vim_coc() {
    $(
        tmux display-menu -T "#[align=centre fg=green]Coc Help" -x C -y C "" \
            "Space o CocList outline" "" "" \
            "Space s CocList symbols" "" "" \
            "Space r ranger" "" "" \
            "rf refactor" "" "" \
            ",gs git chunkinfo" "" "" \
            ",gu git chunkundo" "" "" \
            ",kc ,kb ,ki conflict" "" "" \
            "x v mode convert snip" "" ""
    )
}

show_menu_vim_tip() {
    $(
        tmux display-menu -T "#[align=centre fg=green]Vim tips Help" -x C -y C "" \
            "C-x & C-f 补全文件名" "" "" \
            "C-x & C-i 补全关键字" "" "" \
            "C-x & C-e 插入模式下向上滚屏" "" "" \
            "C-x & C-y 插入模式下向下滚屏" "" "" \
            "\"aY 存储到寄存器a" "" "" \
            ". 当前行 $ 最后一行" "" "" \
            "C-o 执行一次正常模式下的命令" "" "" \
            "% 跳转到 {} () [] 的匹配" "" "" \
            "zz 调整光标所在行到屏幕中央" "" "" \
            "zt 调整光标所在行到屏幕上部" "" "" \
            "zb 调整光标所在行到屏幕下部" "" "" \
            "H 移动到屏幕顶部, M 中间 L 底部" "" "" \
            "f或ctrl+g -- 显示文档名，是否修改，和光标位置" "" "" \
            "aw: 一词 as: 一句 ap: 一段 ab: 一块" "" "" \
            "C-o 跳转光标C-i & C-o逆转" "" "" \
            "alt+shift+hkjl windows" "" ""
    )
}

show_menu_git() {
    $(
        tmux display-menu -T "#[align=centre fg=green]git Help" -x C -y C "" \
            "git clean -n 提醒哪些文件会被删除" "" "" \
            "git clean -f <path> 删除没有track 文件, 不会删除.gitignore 文件" "" "" \
            "git branch -D name 删除分支" "" "" \
            "git checkout -b name 创建分支" "" "" \
            "git show 83fb499:path/fo/file.ext" "" "" \
            "git diff master...feature -- file" "" "" \
            "git cherry-pick A^..B pick include commit A" "" ""
    )
}

show_menu_bash_tips() {
    $(
        tmux display-menu -T "#[align=centre fg=green]Command Tips Help" -x C -y C "" \
            "mkdir -p foo/{bar,baz/{zip,zap}} foo/bar, foo/baz/zip, foo/baz/zap" "" "" \
            "mkdir -p foo/{bar,baz}/{zip,zap} foo/bar/{zip, zap}, foo/baz/{zip, zap}" "" "" \
            "mv filename.{old,new} 快速文件改名" "" "" \
            "cp file.txt{,.bak}  快速备份文件" "" "" \
            "command ls  忽略 alias 直接执行程序" "" "" \
            "ssh -t hostA ssh hostB 通过主机 A 直接 ssh 到主机 B" "" "" \
            "find ~ -mmin 60 -type f # 查找目录中60 分钟修改的文件" "" ""
    )
}

show_menu_wm() {
    $(
        tmux display-menu -T "#[align=centre fg=green]Wm Shortcut" -x C -y C "" \
            "mod + shift + h 帮助" "" "" \
            "mod + shift + a 截图" "" "" \
            "mod + shift + z 快速启动栏 dmenu" "" "" \
            "mod + shift + e 图形化文件" "" "" \
            "alt +         a 透明终端" "" "" \
            "alt +         t focusSteam" "" "" \
            "mod + 		  e	ranger" "" "" \
            "mod +		  q 关闭窗口" "" "" \
            "mod + 		  t 切换浮动和不浮动" "" "" \
            "mod + 		  - 展示临时窗口" "" "" \
            "mod + shift + - 移动到临时窗口" "" "" \
            "mod + 		+ h 横分屏" "" "" \
            "mod + 		+ v 竖分屏" "" "" \
            "mod +		+ s	切换分屏方式" "" "" \
            "mod + 		Esc 重新加载设置文件" "" "" \
            "mod + shift+Esc 重启i3" "" "" \
            "mod + Ctrl +Esc 提示重启i3" "" "" \
            "mod + shift+ 方向键 移动对应的 focus" "" "" \
            "mod + shift + 数字键 移动并转到对应" "" "" \
            "mod + Ctrl +  数字键 移动不转到" "" "" \
            "mod + shift + g 更改窗口间隔" "" "" \
            "mod + g resize" "" ""
    )
}

show_menu_cgdb() {
    $(
        tmux display-menu -T "#[align=centre fg=green]CGDB Shortcut" -x C -y C "" \
            "\- 代码窗口缩小一行 \_ 将代码窗口缩小25\% \= 将代码窗口增大一行 \+ 将代码窗口增大25\%" "" "" \
            "F1 run F2 continue F3  next F4 step F5 stepi F6 finish " "" "" \
            "F11 GDB输出的头部 F12 GDB输出的尾部" "" "" \
            "t 临时断点" "" ""
    )

}
