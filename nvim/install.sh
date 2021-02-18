#!/usr/bin/env bash

config_root="$HOME/.config/nvim"
config_root_copy="$HOME/.config/nvim_backup"

project_root=$(cd "$(dirname "$0")";pwd)

# 备份config
if [ ! -d "config_root"]; then
	mkdir -p $config_root;
	cd $config_root;
else
	mv $config_root $config_root_copy
	echo "你的 $config_root 已经被备份到 $config_root_copy "
fi

# 创建软连接
ln -s $project_root $config_root

# 安装vim-plug
curl -fLo $config_root/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
