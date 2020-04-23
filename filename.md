[toc]
# 1. 安装插件, 设置配置
	1.把m_vimrc文件下载到用户家目录, 重命名为.vimrc
	
	2.更新vim的版本到8.2以上
			1. sudo apt-get -y install software-properties-common
			2. sudo add-apt-repository ppa:jonathonf/vim 
			3. sudo apt-get update
			4. sudo apt install vim

	3.可跳过(开启代理, 请google/baidu)
			1. 执行 sudo wget https://install.direct/go.sh
			2. sudo bash go.sh
			3. 复制config.json到/etc/v2ray/
			4. sudo systemctl restart v2ray
			
	4.然后执行
	curl -fLo〜/ .local/ share / nvim/ site / autoload / plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	
	5.如果机器上没有git, 要先安装git,sudo apt-get install git 
	
	6.打开.vimrc 执行:PlugInstall, 等待安装完成
	
	7.安装YouCompleteMe(代码补全)
			1.cd .vim/plugged/YouCompleteMe
			2.sudo git submodule update --init --recursive
			3.根据电脑版本情况, 需要下载运行YouCompleteMe的依赖,
					1.ubuntu16.04或者更高的版本:  sudo apt install build-essential cmake python3-dev
					2.其他的版本查看: https://github.com/ycm-core/YouCompleteMe
 			4.sudo python3 install.py --clangd-completer
 			5.等待安装完成, 然后C/C++的自动补全已经配置好了, 需要其他语言的请自行查找


# 2. 快捷键说明
### 编译运行

|命令|作用|
|-|-|
|F5|直接编译运行, 已经配置好C++, c, python, sh|

### 退出, 保存
|命令|作用|
|-|-|
|S|保存|
|Q|退出|

### 分割窗口
|命令|作用|
|-|-|
|sl|右边分割一个窗口|
|sh|左边分割一个窗口|
|sj|下边分割一个窗口|
|sk|上边分割一个窗口|
|sv|窗口竖直排列|
|sh|窗口水平排列|
|空格k|光标移到上面的窗口|
|空格j|光标移到下面的窗口|
|空格l|光标移到右边的窗口|
|空格h|光标移到左边的窗口|
|方向键|调整窗口大小|

### 开新窗口
|命令|作用|
|-|-|
|tk|开一个新的窗口|
|tl|到右边的窗口|
|th|到左边的窗口|

### 头文件和定义间切换
```
Cpp定义对应hpp头文件
c定义对应h头文件
```
|命令|作用|
|-|-|
|sw|在头文件和定义之间切换|

### 查看变量/函数的定义, 说明, 引用
|命令|作用|
|-|-|
|gd|查看定义|
|g/|查看说明文档|
|gt|查看类型|
|gr|查看引用|

### 书签
|命令|作用|
|-|-|
|m?|设置标签, ?为任意字符|
|m,|自动设置标签|
|m.|如果该位置有标签, 则取消, 没有则设置|
|dm-|删除标签|
|dm/|取消所有标签|
|m空格|标签间切换|
|mn|跳到下一个标签|
|mp|跳到上一个标签|


### 文件树
|命令|作用|
|-|-|
|ff|打开文件树


### 语法检查
|命令|作用|
|-|-|
|sp|跳到上一个错误或警告|
|sn|跳到下一个错误或警告|
|空格s|开启/关闭语法检查|
|空格d|查看错误或警告的详细信息|


### 文件搜索
|命令|作用|
|-|-|
|ctrl p|在当前目录打开文件搜索|
|ctrl n|打开mru搜索, 搜索最近打开过的文件|
|\<F2>|打开函数搜索, 能搜索cpp文件里的所有函数|
|\<F3>|打开buffer搜索|

### 代码注释
|命令|作用|
|-|-|
|空格cc|注释当前行|
|空格cu|撤销当前行注释|
|空格cA|行尾注释|
|空格cs|多行注释|

### 代码折叠
|命令|作用|
|-|-|
|za|折叠|
|zm|取消折叠|
|zM|所有函数叠起来|
|zR|所有折叠取消|

### 修改比较
|命令|作用|
|-|-|
|bj|和git里面的文件比较|