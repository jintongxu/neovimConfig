#!/bin/bash

echo "检查是否已安装 Neovim"

if command -v nvim &>/dev/null; then
	echo "Neovim 已经安装，无需再次安装。"
else
	echo "Neovim 未安装，开始安装过程。"

	echo "安装 Neovim"
	sudo pacman -S neovim

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
	sudo pacman -S npm
fi

if command -v unzip &>/dev/null; then
	echo "unzip已经安装，无需再次安装"
else
	echo "unzip未安装，开始安装npm"
	sudo pacman -S unzip
fi

if command -v wget &>/dev/null; then
	echo "wget已经安装，无需再次安装"
else
	echo "wget未安装，开始安装wget"
	sudo pacman -S wget
fi

echo "安装一下其他配置"
echo "安装配置gh-md-toc"
sudo wget https://raw.githubusercontent.com/ekalinin/github-markdown-toc/master/gh-md-toc -O /usr/bin/mdtoc
sudo chmod a+x /usr/bin/mdtoc

nvim
