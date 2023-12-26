#!/bin/bash

# 检查是否存在 add-apt-repository 命令
if ! command -v add-apt-repository &>/dev/null; then
	echo "add-apt-repository command not found. try to install software-properties-common"

	# 尝试安装 software-properties-common 并更新
	if command -v apt &>/dev/null; then
		sudo apt update
		sudo apt install -y software-properties-common
		echo "software-properties-common installed successfully."
	else
		echo "apt command not found. Please install software-properties-common manually and run sudo apt update."
		exit 1
	fi
else
	echo "add-apt-repository command is available."
fi

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

config_folder="$HOME/.config"

# 检查是否存在 ~/.config 文件夹
if [ -d "$config_folder" ]; then
	echo "$config_folder already exists. Changing directory to $config_folder"
else
	echo "Creating $config_folder and changing directory to it"
	mkdir -p "$config_folder"
	echo "$config_folder created successfully."
fi

cd ~/.config

while true; do
	echo "你是作者本人使用吗？（y/n)"
	read choice

	if [ "$choice" == "y" ]; then
		cd ~/.config
		git clone git@github.com:jintongxu/neovimConfig.git
		mv neovimConfig nvim
		break
	elif [ "$choice" = "n" ]; then
		cd ~/.config
		git clone https://github.com/jintongxu/neovimConfig.git
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
	sudo apt install npm
fi

if command -v unzip &>/dev/null; then
	echo "unzip已经安装，无需再次安装"
else
	echo "unzip未安装，开始安装npm"
	sudo apt install unzip
fi

if command -v wget &>/dev/null; then
	echo "wget已经安装，无需再次安装"
else
	echo "wget未安装，开始安装wget"
	sudo apt install wget
fi

if command -v curl &>/dev/null; then
	echo "curl已经安装，无需再次安装"
else
	echo "curl未安装，开始安装curl"
	sudo apt install curl
fi

echo "安装lazygit"
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

sudo apt install ripgrep
nvim
