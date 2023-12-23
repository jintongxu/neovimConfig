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
fi

# 检查是否存在 ~/.config 文件夹
if [ -d "$config_folder" ]; then
	echo "$config_folder already exists. Changing directory to $config_folder"
else
	echo "Create $config_folder and changing directory to it"
	mkdir -p "$config_folder"
	cd "$config_folder"
	echo "$config_folder create successfully."
fi

while true; do
	echo "你是作者本人使用吗？（y/n)"
	read choice

	if [ "$choice" == "y" ]; then
		cd ~/.config
		git clone git@github.com:xjintong/neovimConfig.git
		mv neovimConfig nvim
		break
	elif [ "$choice" = "n" ]; then
		cd ~/.config
		git clone https://github.com/xjintong/neovimConfig.git
		mv neovimConfig nvim
		break
	else
		echo "Invalid choice. Please enter 'y' or 'n'."
	fi
done

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

sudo pacman -S ripgrep

nvim
