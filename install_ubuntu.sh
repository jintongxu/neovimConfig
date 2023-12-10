#!/bin/bash

echo "检查是否已安装 Neovim"

if command -v nvim &>/dev/null; then
	echo "Neovim 已经安装，无需再次安装。"
else
	echo "Neovim 未安装，开始安装过程。"

	echo "增加 Neovim 的 PPA 仓库"
	sudo add-apt-repository ppa:neovim-ppa/unstable

	echo "更新软件包"
	sudo apt update

	echo "安装 Neovim"
	sudo apt install neovim

	echo "Neovim 安装完成。"
fi

echo "进行neovim配置"
nvim_config_folder="$HOME/.config/nvim"

# 检查是否存在 ~/.config/nvim 文件夹
if [ -d "$nvim_config_folder" ]; then
	echo "Deleting $nvim_config_folder"
	rm -rf "$nvim_config_folder"
	echo "$nvim_config_folder deleted successfully."
else
	echo "$nvim_config_folder does not exist. Create new"
fi

# 检查是否存在 ~/.config 文件夹
if [ -d "$config_folder" ]; then
	echo "$config_folder already exists. Changing directory to $config_folder"
else
	echo "Creating $config_folder and changing directory to it"
	mkdir -p "$config_folder"
	echo "$config_folder created successfully."
fi

git clone https://github.com/xjintong/neovimConfig.git ~/.config/nvim

echo "安装一些依赖"

if command -v npm &>/dev/null; then
	echo "npm已经安装，无需再次安装"
else
	echo "npm未安装，开始安装npm"
	sudo apt install npm
fi

if command -v unzip &>/dev/null; then
	echo "unzip已经安装，无需再次安装"
else
	echo "unzip未安装，开始安装npm"
	sudo apt install unzip
fi

nvim
