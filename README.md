# 目录

<!-- toc -->

- [一、使用教程](#%E4%B8%80%E4%BD%BF%E7%94%A8%E6%95%99%E7%A8%8B)
  * [Ubuntu](#ubuntu)
  * [ArchLinux](#archlinux)
  * [Mason](#mason)
- [二、当前nvim快捷键](#%E4%BA%8C%E5%BD%93%E5%89%8Dnvim%E5%BF%AB%E6%8D%B7%E9%94%AE)
  * [复制、粘贴、删除](#%E5%A4%8D%E5%88%B6%E7%B2%98%E8%B4%B4%E5%88%A0%E9%99%A4)
    + [复制](#%E5%A4%8D%E5%88%B6)
    + [粘贴](#%E7%B2%98%E8%B4%B4)
    + [删除](#%E5%88%A0%E9%99%A4)
  * [插入模式](#%E6%8F%92%E5%85%A5%E6%A8%A1%E5%BC%8F)
  * [代码间快速跳转](#%E4%BB%A3%E7%A0%81%E9%97%B4%E5%BF%AB%E9%80%9F%E8%B7%B3%E8%BD%AC)
  * [快速移动](#%E5%BF%AB%E9%80%9F%E7%A7%BB%E5%8A%A8)
  * [查找](#%E6%9F%A5%E6%89%BE)
  * [文件树](#%E6%96%87%E4%BB%B6%E6%A0%91)
  * [注释](#%E6%B3%A8%E9%87%8A)
  * [其他](#%E5%85%B6%E4%BB%96)
- [三、个人其他配置使用](#%E4%B8%89%E4%B8%AA%E4%BA%BA%E5%85%B6%E4%BB%96%E9%85%8D%E7%BD%AE%E4%BD%BF%E7%94%A8)
  * [3.1 cgdb和gdb的快捷键](#31-cgdb%E5%92%8Cgdb%E7%9A%84%E5%BF%AB%E6%8D%B7%E9%94%AE)
    + [cgdb](#cgdb)
    + [gdb](#gdb)
      - [断点](#%E6%96%AD%E7%82%B9)
      - [打印表达式](#%E6%89%93%E5%8D%B0%E8%A1%A8%E8%BE%BE%E5%BC%8F)
      - [查询运行信息](#%E6%9F%A5%E8%AF%A2%E8%BF%90%E8%A1%8C%E4%BF%A1%E6%81%AF)
      - [查看源代码](#%E6%9F%A5%E7%9C%8B%E6%BA%90%E4%BB%A3%E7%A0%81)
  * [3.2 lazygit快捷键](#32-lazygit%E5%BF%AB%E6%8D%B7%E9%94%AE)
  * [杂](#%E6%9D%82)

<!-- tocstop -->

# 一、使用教程

## Ubuntu
用apt包管理器的都可以用这个
```bash
git clone https://github.com/xjintong/neovimConfig.git

cd neovimConfig

sudo chmod +x install_ubuntu.sh

./install_ubuntu.sh
```
最后安装Mason的LSP，见后文。

## ArchLinux
```bash
git clone https://github.com/xjintong/neovimConfig.git

cd neovimConfig

sudo chmod +x install_arch.sh 

./install_arch.sh
```
最后安装Mason的LSP，见后文。

## Mason
然后进入nvimm的命令模式``:Mason``，下载对应语言的LSP（代码提示）。光标移动到对应的LSP，然后按 **i** 下载，按 **X** 卸载。

当前使用的**LSP**：
- clangd（c/c++)
- cmake-language-server
- docker-compose-language-server
- dockerfile-language-server
- markdown-toc
记得进入命令模式后输入**!**，表示该命令为终端命令。
![Snipaste_2023-12-12_10-35-43](https://img.xujintong.com/2023/12/12/h4k5if.webp)

- python-lsp-server

# 二、当前nvim快捷键

## 复制、粘贴、删除

### 复制

- **yy**：复制光标所在行
- **y$**：复制从光标位置到本行末尾
- **nyy**：n是要复制的行数，从当前行开始

- **:%y**：复制整个文件

### 粘贴

- **pp**：在下一行粘贴

- **p（小写）**：在当前行的下一行进行粘贴，并移动到新插入行的开头
- **P（大写）**：和小p差不多，不同的是粘贴在当前行的上一行
- **gp**：粘贴在下一行，然后跳到粘贴行的下一行的开头
- **gP**：与gp差不多，就是跳到粘贴行的上一行的开头

### 删除

- **dd**：删除当前行
- **ndd**：删除从当前行开始的n个行
- **d0**：删除光标之前到行首的字符
- **D**：删除从当前光标位置到行尾
- **x**：删除当前光标位置的字符
- **d + shift + g**：删除光标所在行到文件末尾

## 插入模式

- **i**：在当前光标前插入文本
- **I**：在当前行开始处插入文本
- **o（小写）**：在当前行的下一行插入文本
- **O（大写）**：在当前行的上一行插入文本
- **a**：在当前光标后插入文本
- **A**：在当前行最后插入文本
- **r**：对当前光标处的字符进行替换
- **R**：从当前光标处开始一直往后替换（如果替换后想回退按 Backspace）

## 代码间快速跳转
- gd：光标移动到函数名，快速跳转到函数定义
- gD：光标移动到函数名，快速跳转到函数声明


## 快速移动

- **0（零）**：跳到行首
- **$**：跳到行尾
- **gg**：跳到文件头
- **shift + g**：跳到文件末尾

- **fx**：移动到光标右侧第一个x字符，其他字符同理
- **Fx**：和上面的差不多，只是向左侧查找
- **3fx**：右侧第三个x字符

## 查找

- **/ ____**：在那个下划线输入要查找的字符

## 文件树

光标移动到在左侧文件导航那

- nvim . ：设置当前目录为根目录，打开neo-tree
- s：打开文件(竖直分割窗口打开新文件)
- S：打开文件（水平分割窗口打开新文件）
- a：创建文件/文件夹（文件夹以**/**结尾）
- A：创建文件夹
- I：文件信息
- R：修改名字
- .：更换文件树的根目录
- z：关闭所有文件夹的打开状态
- t：在当前窗口打开文件夹，并且关闭左方导航栏
- **]b**：打开了多个文件，跳到当前文件的右边文件光标位置
- **[b**：和上一个差不多，只是跳到左边的文件
- D：在当前根目录及其子目录寻找文件夹
- /：在当前根目录及其子目录中寻找文件
- q：关闭当前左边导航


## 注释
Comment.nvim插件的默认快捷方式。

- **gc2j**：这是个例子，就是注释当前行和当前行下面的2行；也可以及gc2k.....这里的注释是单行注释，在c中是``//``
- **gcc**：注释当前行j
- **gb2j**：这也是个例子，和gc2j差不多，只是向上。这里是块注释，在c中是``/* */``
- **gco**：在下面创建一个新行，开头会有注释符号
- **gcO**：在上面创建一个新行，开头会有注释符号
- **gcA**：在行尾添加注释
- **gcw**：注释单词
- **gb%**：光标移动到左括号或右括号，然后用这个可以注释括号和括号内的语句

## 其他
- **]b**：打开了多个文件，跳到当前文件的右边文件光标位置
- **[b**：和上一个差不多，只是跳到左边的文件
- <C-s>：保存文件
- <leader>fn：创建新文件
- <leader>ft：Terminal命令 (root dir)
- <leader>fT：Terminal命令 (cwd)
- <C-/>：Hide Terminal
- :file filename：将当前文件名改为filename

# 三、个人其他配置使用
## 3.1 cgdb和gdb的快捷键

### cgdb

- **F5** ：run
- **F6** ： continue  到下一个断点
- **F7** ： finish
- **F8** ： next   单步调试，不进入函数体
- **F10** ： step   单步调试，进入函数
- **ctrl-b** ：  向上翻一页
- **ctrl-f** ：   向下翻一页

### gdb

#### 断点

- **info b**：显示所有断点
- **b fn1 if a＞b**：条件断点设置
- **break func（break缩写为b）**：在函数func()的入口处设置断点，如：break cb_button
- **delete n**：删除n号断点（info b中的断点序号）
- **delete breakpoints**：删除所有断点
- **disable n**：暂停使用n号断点
- **enable n**：开启n号断点

#### 打印表达式

- **print 表达式**：简记为 p ，其中“表达式”可以是任何当前正在被测试程序的有效表达式，比如当前正在调试C语言的程序，那么“表达式”可以是任何C语言的有效表达式，包括数字，变量甚至是函数调用。

- **print a**：将显示整数 a 的值
- **print ++a**：将把 a 中的值加1,并显示出来
- **print name**：将显示字符串 name 的值
- **print gdb_test(22)**：将以整数22作为参数调用 gdb_test() 函数
- **print gdb_test(a)**：将以变量 a 作为参数调用 gdb_test() 函数
- **display 表达式**：在单步运行时将非常有用，使用display命令设置一个表达式后，它将在每次单步进行指令后，紧接着输出被设置的表达式及值。如： display a
- **watch 表达式**：设置一个监视点，一旦被监视的“表达式”的值改变，gdb将强行终止正在被调试的程序。如： watch a
- **whatis** ：查询变量或函数
- **info function**： 查询函数
- **扩展info locals**： 显示当前堆栈页的所有变量

#### 查询运行信息

- **where/bt**：当前运行的堆栈列表；
- **bt backtrace**： 显示当前调用堆栈
- **set args**： 参数:指定运行时的参数
- **show args**：查看设置好的参数
- **info program**： 来查看程序的是否在运行，进程号，被暂停的原因。

#### 查看源代码

- **list 函数名**：将显示“函数名”所在函数的源代码，如：list main

## 3.2 lazygit快捷键
- a：add所有修改
- 空格：add单个修改
- 1/2/3/4：在窗口间跳转
- c：commit
- P（大写）：push


## 杂


