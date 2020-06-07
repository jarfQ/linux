# shell 笔记



## 一.变量

变量命名同一般编程语言规则：



```shell
#!/bin/bash
for i in $(ls /bin);
do echo ${i}; # {}为可选
done

# 遍历打印/bin目录下的文件名
```



使用一个定义过的变量，只要在变量名前面加美元符号

```shell
name="1001k"
echo $name
```



unset删除变量：

```shell
#!/bin/bash
type="mysql,c,rust,c++,python"
unset type
echo $type

# 以上执行没有任何输出
```



运行shell时会存在三种变量：

1.  **局部变量** 局部变量在脚本或命令中定义，仅在当前shell实例中有效，其他shell启动的程序不能访问局部变量
1.  **环境变量** 所有的程序，包括shell启动的程序，都能访问环境变量，有些程序需要环境变量来保证其正常运行。必要的时候shell脚本也可以定义环境变量
1.  **shell变量** shell变量由shell程序设置的特殊变量。shell变量中有一部分是环境变量，有一部分是局部变量，这些环境保证了shell的正常运行









































































