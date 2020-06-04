ls



-l：长格式
		-:普通文件(f)
		d:目录文件
		b:块设备文件(block)
		c:字符设备文件(character)
		l:符号链接文件(symbolic link file)
		p:命令管道(pipe)
		s:套接字文件(socket)

		文件权限：9位，每3位一组，每组：rwx读写执行，没有权限就用-表示
	
		文件硬链接的次数
		文件属主(owner)
		文件的属组(group)
		文件大小(size)，默认单位是字节
		时间戳(timestamp)，最近一次被修改的时间
			访问:access
			修改:modify。文件内容发生改变。
			改变:change。metadata，元数据，文件属性。
	
	-h：human readable，做单位转换
	-a:显示以.开头的隐藏文件
		.当前目录
		..当前目录的上一级目录
	-A:显示所有文件，但不显示.和..
	-d:显示目录自身属性
	
	-i:索引节点号
		index node, inode
	-r:逆序显示
	-R:递归(recursive)显示

cd:change directory
	不加参数，回到家目录，home directory
	cd ~USERNAME：进入指定用户的家目录
	cd -:在当前目录和前一次所在目录之前来回切换

命令类型：
	内置命令(shell内置)
	外部命令：在文件系统的某个路径下有一个与命令名称相应的可执行文件
	
环境变量：命名的内存空间
	变量赋值
	path:使用冒号分割的路径
	o(1):衡量程序执行效率的标准，无论队列多长，执行效率一样
	
	
type:显示指定属于哪种类型
date:时间管理
Linux:rtc，real time clock
	硬件时钟
	系统时钟
	
ntp:网络时间协议

获得命令的使用帮助：
内部命令：
	help COMMAND
外部命令：
	COMMAND --help
命令手册：manual
man COMMAND：一般对外部命令
whatis COMMAND：查看命令所在章节
分章节：常见章节有8个
	1.用户命令(/bin, /usr/bin, /usr/local/bin)
	2.系统调用
	3.库用户
	4.特殊文件(设备文件)
	5.文件格式(配置文件的语法)
	6.游戏
	7.杂项：miscellaneous
	8.管理命令(/sbin, /usr/sbin, /usr/local/sbin)

<>：必须给定内容
[]:可省略
|:多选一
{}：分组，没有特殊意义

man:
	name:命令名称及功能简要说明
	synopsis：用法说明，包括可用选项
	description：命令功能的详尽说明，可能高包括每一个选项的意义
	options:说明每一个选项的意义
	files：此命令相关的配置文件
	bugs:
	examples：使用示例
	see also:另外参照
翻屏：
	向后翻屏：space
	向前翻屏：b
	向下翻行：enter
	向上翻行：k
	
查找：
	/keyword：自前向后
	?keyword：自后向前
	n:下一个
	N:前一个
	根据/和？的n N方向不一样
	q:退出

hwclock -w把系统时间写入硬件时间
hwclock -s把硬件时间写入系统时间

在线文档：
info COMMAND
文档 /usr/share/doc

cal:calender日历

echo默认打印换行符
printf默认不打印换行符

file命令及其用法：

Windows:PE可移植文件
Linux:ELF可执行可连接文件

文件系统：
rootfs:根文件系统，对于每个文件，都只能从根文件系统访问。

FHS:文件系统层级标准
	/boot:系统启动相关文件，如内核、initrd、以及grub(bootloader)
	/dev:设备文件
			块设备：随机设备，可以实现随机访问的设备，数据块
			字符设备：线性设备，可以实现线性访问的设备，按字符为单位
			设备号：主设备号（major）和次和设备号（minor）
	/etc:配置文件
	/home：用户的家目录，每一个用户的家目录通常默认为/home/USERNAME
	/root:管理员的家目录
	/lib:库文件
		静态库：.a
		动态库：.dll,.so(shared object)
		内核模块文件（/lib/modules）
	/media:挂载点目录，移动设备
	/mnt：挂载点目录，额外的临时文件系统
	/misc：杂项
	/opt:可选目录，第三方程序的安装目录
	/proc:伪文件系统，内核映射文件
	/sys:伪文件系统，跟硬件设备相关的属性映射文件，如硬盘
	/tmp:临时文件
	/var:可变化的文件
	/bin:可执行文件，用户命令
	/sbin:管理命令
	
	/usr:universal shared read-only
		/usr/bin
		/usr/sbin
		/usr/lib
		
		/usr/local:第三方程序的安装目录
			/usr/local/bin
			/usr/local/sbin
			/usr/local/lib
命名规则：
	1.长度不能超过255个字符
	2.不能使用/当文件名
	3.严格区分大小写
	
相对路径：
绝对路径：

文件管理
	
目录管理
	ls
	cd
	pwd
	mkdir:创建空目录，路径的最后一个节点才是我们要创建的目录
		-p:自动创建
		-v:verbose详细信息
		mkdir -pv /mnt/test/{x/m,y}
	命令行展开：
		{a,b}_{c,d} 可以创建a_c,a_d,b_c,b_d
		就像(a+b)*(c+d)
		
	rmdir(remove directory):删除空目录(只能删除空目录)
		-p:自动删除父目录
	tree:查看目录树
	文件的创建和删除
		touch:可用来创建文件，但主要目的是为了修改时间戳的
			-c:不创建文件
			-a:修改访问时间
			-m:修改修改时间
			-t:指定时间
		创建文件可以使用文件编辑器
			nano:
		rm:删除文件
			-i:给提示
			-f:强行删除
			-r:递归删除
	复制和移动文件
	cp:copy
		SRC DEST
		一个文件到一个文件
		多个文件到一个目录
		不允许多个文件复制到一个文件
		不允许一个文件同时复制多份
		目标是一个目录，将保存源文件的名字
		目标是一个文件，将保存为该文件的名字
		如果源是多个，目标一定是目录
		默认情况下不复制目录
		-r/-R 递归复制一个目录
		-p:复制后的文件保留源文件的属组，属主
		-a:保留源文件的所有属性，归档复制，常用于备份
		复制链接，默认复制链接链接的源文件
		-P:保持链接文件
		-i:
		
	mv SRC DEST
		-f:强制目录存在
		-t:目标，再写源
	install:复制文件指定属性
		-d:创建目录，-d DIRECTORY...
		SRC DEST:复制文件，默认复制过去是有执行权限的
		-m:指定权限
		-t:指定目标，再指定源
		源只能是文件
		
	stat:显示文件或文件系统的状态信息

发行版：
	Fedora, Redhat(Centos), SUSE, Debian(Ubuntu, Mint), Gentoo, LFS(Linux From Scratch)

对系统的操作一般是对其配置文件进行修改
文本处理：cat, more, less, head, tail, cut, sort, uniq, grep

查看文本：
	cat、tac、more、less、head、tail
	
	cat:链接并显示
		-n：显示行号
		-E：显示行结束符
		
	tac:反向显示
	
	分屏显示：
	more:回车一行一行翻，b一屏翻，缺点：翻到最后就直接退出了
	less：到最后不会直接退出，按q才退出
	
	head:查看文件的前n行
	tail:查看文件的后n行，默认十行
		-f:查看文件尾部，不退出，等待显示后续追加至此文件的新内容

文本处理：
	cut,join,sed,awk
	
	cut:
		-d:指定分隔符，默认空格
		-f:指定要显示的字段，
			-f 1,3
			-f 1-3
	文本排序：
		sort：默认按位的ascii排序，升序
			-n:数值排序
			-r:降序
			-t:字段分隔符
			-k:以哪个字段为关键字排序
			-u:相同的行只显示一次
			-f:不区分大小写
		在sort和uniq中，只有相邻且相同的行才被认为相同的行，不相邻但相同，被认为不同行
		uniq:
			-c:显示某行重复的次数
			-d:只显示重复的行
	文本统计：wc(word count
		wc:
			-l:只显示行数
			-c:字节数
			-m:字符数
			-L:最长的一行包含的字符数
	字符处理命令：
		tr:转换或删除字符
			tr charset1 charset2
			无法指定文件，需要进行输入重定向
			替换大写：
				tr 'a-z' 'A-Z'
			-d:删除出现在字符集中的所有字符
bash及其特性：
	shell:外壳
	GUI:Gnome,KDE,Xfce
	CLI:sh,csh,ksh,bash,tcsh,ksh,zsh
linux允许一个用户登录多次，shell都是独立的
进程：在每个进程看来，当前主机上只存在内核和当前进程
进程是程序的副本，进程是程序执行的实例


用户工作环境：
bash:
	#
	$
	1.命令历史，命令补全
	2.管道、重定向
	3.命令别名
	4.命令行编辑
	5.命令行展开
	6.文件名通配
	7.变量
	8.编程
	
	命令行编辑：
		命令光标跳转：
			ctrl+a:到行首
			ctrl+e:当行尾
			ctrl+d:
			ctrl+u:删除光标至行首的内容
			ctrl+k:删除光标至行尾的内容
			ctrl+l:清屏
	命令历史：
		history:查看命令历史
			-c:清空命令历史
			-d:删除指定位置的命令
				-d 510 3：从510行删去三个命令
			-w:保存命令历史至历史文件，在用户的家目录的.bash_history隐藏文件中
		
		使用技巧：
			!n:执行命令历史中第n条命令
			!-n:执行命令历史中的倒数第n条命令
			!!:执行上一条命令
			!string:执行命令历史中以指定字符串开头的命令
			!$:引用前一个命令的最后一个参数
			esc,.:效果同上
			alt+.:效果同上，远程终端不支持
	命令补全：
		前提：path环境变量配置正常，唯一标识命令，若不唯一，可以双敲tab键显示所有该字符串开头的命令
		
		路径补全：和命令补全相似，但补全机制不一样
		
	命令别名：
		alias CMDALIAS='COMMAND [options] [arguments]'
		若命令中间有空格，要用引号
		命令别名只在当前的shell的生命周期有效
		若要永久有效，需要写入bash的配置文件
		撤销别名：
			unalias CMDALIAS
		使用命令本身，\COMMAND
	命令替换：$(COMMAND) 反引号`COMMAND`,反引号是波浪号底下的
		把命令中某个子命令替换为其执行结果的过程
		cmd1 [] [] $(cmd2)
		touch /file$(date +%F-%H-%M-%S)
	bash支持的引号：
	``:命令替换
	"":弱引用，可以实现变量替换
	'':强引用，不完成变量替换
	
	文件名通配：globbing
	*:匹配任意长度的任意字符
	?:匹配任意单个字符
	[]:匹配指定范围内的任意单个字符
		[abc],[a-m],[a-zA-Z],[0-9]
	[^]:匹配指定范围外的任意单个字符
	[:space:]:空白字符
	[:punct:]:标点符号
	[:lower:]:小写字母
	[:upper:]:大写字母
	[:alpha:]:大小写字母
	[:digit:]:数字
	[:alnum:]:数字和大小写字母


​	

	环境变量：
		path:命令搜索路径
		HISTSIZE:命令历史大小，默认是1000条


​			
​		
shell：
​	子shell，可以用pstree查看
​	退出当前shell:exit
​	父子之间不一定有关联关系
​	
控制信号：
​	ctrl+c
​	shift+pageup/down:翻屏

运行程序
设备管理
软件管理
进程管理
网络管理

用户、组、权限
安全上下文(secure context)
权限：
	r,w,x
	文件:
		r:可读，可以使用类似cat等命令查看文件
		w:可写，可以编辑或删除此文件
		x:可执行，exacutable,可以再命令提示符下当作命令提交给内核运行
	目录:
		r:可以对此目执行ls以列出内部的所有文件
		w:可以在此目录创建文件
		x:可以使用cd切换进此目录，也可以使用ls -l查看内部文件的详细信息
	rwx:
		r--:只读
		r-x:读和执行
		---:无权限
	0 000,---:无权限
	1 001,--x:执行
	2 010,-w-:写
	3 011,-wx:写和执行
	4 100,r--:只读
	5 101,r-x:读执行
	6 110,rw-:读写
	7 111,rwx:读写执行

用户：uid, /etc/passwd
组：gid, /etc/group

影子口令： /etc/shadow
组： /etc/gshadow

用户类别：
	管理员：uid:0
	普通用户：uid:1-65535
		系统用户:uid:1-499,不允许登录
		一般用户:uid:500-60000
用户组类别：
	基本组：用户的默认组
	附加组：额外组，默认组以外的其他组
	私有组（创建用户时，如果没有为其指定所属的组，系统会创建一个与用户名同名的组，为私有组）
	管理员组：
	普通组：
		系统组：
		一般组：


account:登录名
password:密码
uid:用户id
gid:基本组id
comment:注释
home dir:用户家目录
shell:用户的默认shell



/etc/shadow
	account:登录名
	encrypted password:加密的密码
	用户名；密码；最近一次修改密码的时间；最短使用期限；最长使用期限；警告时间；非活动时间；过期时间

加密方法：
	对称加密：加密和解密使用同一个密码
	公钥加密：每个密码都成对出现，一个为私钥(secret key)，一个为公钥(public key)
	单向加密：散列加密，提取数据特征码
		1.雪崩效应：初始条件的微小变化，会引起结果的巨大改变
		2.定长输出：
			md5:Message Digest,128位定长输出
			sha1:Secure Hash Algorithm,160位定长输出

用户管理：
	useradd USERNAME
	groupadd GRPNAME
	useradd, userdel, usermod, passwd, chsh, finger, id, chage
	
		useradd [options] USERNAME
			-u uid 
			-g gid(基本组)
			-G GID...(额外组)
			-c "COMMENT"
			-d /path/to/somewhere
			-s /etc/shells/???
				/etc/shells:指定了当前系统可用的安全shell
			-m -k
环境变量：
	PATH
	HISTSIZE
	SHELL
组管理：
	groupadd, groupdel, groupmod, gpasswd
权限管理：
	chown, chgrp, chmod, umask

解析：名称解析
————————————————
版权声明：本文为CSDN博主「Christopher_L1n」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
原文链接：https://blog.csdn.net/Christopher_L1n/java/article/details/71517291