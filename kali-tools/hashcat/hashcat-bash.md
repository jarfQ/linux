# Hashcat

------

## 0x01、Install



Features：

+   World's fastest password cracker
+   World's first and only in-kernel rule engine
+   Free
+   Open-Source (MIT License)

## 0x02、Usage

### 常用参数

```shell
-a              指定要使用的破解模式，其值参考后面对参数。“-a 0”字典攻击，“-a 1” 组合攻击；“-a 3”掩码攻击。
-m              指定要破解的hash类型，如果不指定类型，则默认是MD5
-o              指定破解成功后的hash及所对应的明文密码的存放位置,可以用它把破解成功的hash写到指定的文件中
--force         忽略破解过程中的警告信息,跑单条hash可能需要加上此选项
--show          显示已经破解的hash及该hash所对应的明文
--username      忽略hash文件中的指定的用户名,在破解linux系统用户密码hash可能会用到
--remove        删除已被破解成功的hash
--increment     启用增量破解模式,你可以利用此模式让hashcat在指定的密码长度范围内执行破解过程
--increment-min  密码最小长度,后面直接等于一个整数即可,配置increment模式一起使用
--increment-max  密码最大长度,同上
--outfile-format 指定破解结果的输出格式id,默认是3

-r       使用自定义破解规则
```

### 掩码设置

```text
l | abcdefghijklmnopqrstuvwxyz          纯小写字母
u | ABCDEFGHIJKLMNOPQRSTUVWXYZ          纯大写字母
d | 0123456789                  纯数字
h | 0123456789abcdef                常见小写子目录和数字
H | 0123456789ABCDEF                常见大写字母和数字
s |  !"#$%&'()*+,-./:;<=>?@[\]^_`{|}~       特殊字符
a | ?l?u?d?s                    键盘上所有可见的字符
b | 0x00 - 0xff                 可能是用来匹配像空格这种密码的
```

### 掩码实例

```text
八位数字密码：?d?d?d?d?d?d?d?d
八位未知密码：?a?a?a?a?a?a?a?a
前四位为大写字母，后面四位为数字：?u?u?u?u?d?d?d?d
前四位为数字或者是小写字母，后四位为大写字母或者数字：?h?h?h?h?H?H?H?H
前三个字符未知，中间为admin，后三位未知：?a?a?aadmin?a?a?a
6-8位数字密码：--increment --increment-min 6 --increment-max 8 ?l?l?l?l?l?l?l?l
6-8位数字+小写字母密码：--increment --increment-min 6 --increment-max 8 ?h?h?h?h?h?h?h?h
```

## 0x03、Example

```bash
# 爆破 8 位数字的 MD5（2 秒）
hashcat -a 3 -m 0 --force ed2b1f468c5f915f3f1cf75d7068baae "?d?d?d?d?d?d?d?d"

# 爆破 1-8 位数字的 MD5
hashcat -a 3 -m 0 --force 4488cec2aea535179e085367d8a17d75 --increment --increment-min 1 --increment-max 8 "?d?d?d?d?d?d?d?d"

# 爆破 8 位小写字母的 MD5（11分钟）
hashcat -a 3 -m 0 --force 80d41e1777e11df88fa2a02508112a6c "?l?l?l?l?l?l?l?l"

# 利用字典爆破
hashcat -a 0 ede900ac1424436b55dc3c9f20cb97a8 password.txt -o result.txt

# 批量爆破 hash.txt
hashcat -a 0 hash.txt password.txt -o result.txt

# 字典 + 字典组合
hashcat -a 1 25f9e794323b453885f5181f1b624d0b pwd1.txt pwd2.txt

# 字典 + 掩码组合
hashcat -a 6 9dc9d5ed5031367d42543763423c24ee password.txt "?l?l?l?l?l"

# 爆破 mysql 密码(6 秒)
select host,user,authentication_string from mysql.user;
hashcat -a 0 -m 300 --force 81F5E21E35407D884A6CD4A731AEBFB6AF209E1B ~/pwd

# 爆破 mssql 密码
hashcat -a 3 -m 132 --force 0x01008c8006c224f71f6bf0036f78d863c3c4ff53f8c3c48edafb "?l?l?l?l?l?d?d?d"

# 爆破 unix 密码（MAC 下需要把 $ 加上反斜杠）
hashcat -a 0 -m 1800 --force "\$6\$u8S/M3kJ.aDI3y.q\$T6ACJn30kC48eGBUJMtF3JIp.Th0lKNAQz8s//T6q/kTqJsdHBuK1TStSaS2pRMKcYJ5CqqNfSbKCt68vghO6." ~/pwd

# 爆破 Windows 密码
NT-hash:
hashcat -a 3 -m 1000 209C6174DA490CAEB422F3FA5A7AE634 "?l?l?l?l?l"
LM-hash:
hashcat -a 3 -m 3000 --force F0D412BD764FFE81AAD3B435B51404EE "?l?l?l?l?l"

# 爆破 wordpress 密码 
# 具体加密脚本在./wp-includes/class-phpass.php的HashPassword函数
hashcat -a 3 -m 400 --force "\$P\$BYEYcHEj3vDhV1lwGBv6rpxurKOEWY/" "?d?d?d?d?d?d"

# 爆破 discuz 密码（md5(md5($pass).$salt)）
hashcat -a 3 -m 2611 --force 14e1b600b1fd579f47433b88e8d85291: "?d?d?d?d?d?d"

# Kali 查看所有的 *2john
ls /sbin/*john

# 爆破 rar 密码(注意模式是 rar5 还是 RAR3-hp)
rar2john 1.rar
hashcat -a 3 -m 13000 --force "\$rar5\$16\$639e9ce8344c680da12e8bdd4346a6a3\$15\$a2b056a21a9836d8d48c2844d171b73d\$8\$04a52d2224ad082e" "?d?d?d?d?d?d"

# 爆破 zip 密码
zip2john.exe 1.zip
hashcat -a 3 -m 13600 "\$zip2\$*0*3*0*554bb43ff71cb0cac76326f292119dfd*ff23*5*24b28885ee*d4fe362bb1e91319ab53*\$/zip2\$" --force "?d?d?d?d?d?d"

# 爆破 office 密码
python /usr/share/john/office2john.py 11.docx
hashcat -a 3 -m 9600 "\$office\$*2013*100000*256*16*e4a3eb62e8d3576f861f9eded75e0525*9eeb35f0849a7800d48113440b4bbb9c*577f8d8b2e1c5f60fed76e62327b38d28f25230f6c7dfd66588d9ca8097aabb9" --force "?d?d?d?d?d?d"

# 破解 WiFi 密码
# 首先先把我们的握手包转化为 hccapx 格式，现在最新版的 hashcat 只支持 hccapx 格式了，以前的 hccap 格式已经不支持了[hashcat cap2hccapx - advanced password recovery](https://hashcat.net/cap2hccapx/)
hashcat -a 3 -m 2500 1.hccapx 1391040?d?d?d?d

# 查看已经破解的密码
hashcat hash --show
```