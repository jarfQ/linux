# 常用端口号





端口号---具有网络功能的应用软件的标识号。注意，端口号是不固定的，即可以由用户手工可以分配（当然，一般在软件编写时就已经定义）。当然，有很多应用软件有公认的默认的端口，比如FTP：20和21，HTTP：80，TELNET：23等等，这里就不一一列举了。一个软件可以拥有多个端口号，这证明这个软件拥有不止一个网络功能。

0-1023是公认端口号，即已经公认定义或为将要公认定义的软件保留的，而1024-65535是并没有公共定义的端口号，用户可以自己定义这些端口的作用。

那么端口号到底有什么作用呢？请大家继续往下看。

当一台电脑启动了一个可以让远程其他电脑访问的程序，那么它就要开启至少一个端口号来让外界访问。我们可以把没有开启端口号的电脑看作是一个密封的房间，密封的房间当然不可能接受外界的访问，所以当系统开启了一个可以让外界访问的程序后它自然需要在房间上开一个窗口来接受来自外界的访问，这个窗口就是端口。

那么为什么要给端口编号来区分它们呢，既然一个程序开了一个端口，那么不是外部信息都可以通过这个开启的端口来访问了吗？答案是不可以。为什么呢？因为数据是用端口号来通知传输层协议送给哪个软件来处理的，数据是没有智慧的，如果很多的程序共用一个端口来接受数据的话，那么当外界的一个数据包送来后传输层就不知道该送给哪一个软件来处理，这样势必将导致混乱。

上一次提到提到在一个经过OSI第四层传输层封装的数据段的第四层报头里包含两个端口号，既源端口号和目的端口号，目的端口号的作用上面已经介绍了，下面让我们了解一下原端口号吧。

源端口号一般是由系统自己动态生成的一个从1024-65535的号码，当一台计算机A通过网络访问计算机B时，如果它需要对方返回数据的话，它也会随机创建一个大于1023的端口，告诉B返回数据时把数据送到自己的哪个端口，然后软件开始侦听这个端口，等待数据返回。而B收到数据后会读取数据包的源端口号和目的端口号，然后记录下来，当软件创建了要返回的数据后就把原来数据包中的原端口号作为目的端口号，而把自己的端口号作为原端口号，也就是说把收到的数据包中的原和目的反过来，然后再送回A，A再重复这个过程如此反复直到数据传输完成。当数据全部传输完A就把源端口释放出来，所以同一个软件每次传输数据时不一定是同一个源端口号。

21/tcp FTP 文件传输协议

22/tcp SSH 安全登录、文件传送(SCP)和端口重定向

23/tcp Telnet 不安全的文本传送

25/tcp SMTP Simple Mail Transfer Protocol (E-mail)

69/udp TFTP Trivial File Transfer Protocol

79/tcp finger Finger

80/tcp HTTP 超文本传送协议 (WWW)

88/tcp Kerberos Authenticating agent

110/tcp POP3 Post Office Protocol (E-mail)

113/tcp ident old identification server system

119/tcp NNTP used for usenet newsgroups

220/tcp IMAP3

443/tcp HTTPS used for securely transferring web pages

端口：0

服务：Reserved

说明：通常用于分析操作系统。这一方法能够工作是因为在一些系统中“0”是无效端口，当你试图使用通常的闭合端口连接它时将产生不同的结果。一种典型的扫描，使用IP地址为0.0.0.0，设置ACK位并在以太网层广播。

端口：1

服务：tcpmux

说明：这显示有人在寻找SGI  Irix机器。Irix是实现tcpmux的主要提供者，默认情况下tcpmux在这种系统中被打开。Irix机器在发布是含有几个默认的无密码的帐户，如：IP、GUEST UUCP、NUUCP、DEMOS  、TUTOR、DIAG、OUTOFBOX等。许多管理员在安装后忘记删除这些帐户。因此HACKER在INTERNET上搜索tcpmux并利用这些帐户。

端口：7

服务：Echo

说明：能看到许多人搜索Fraggle放大器时，发送到X.X.X.0和X.X.X.255的信息。

端口：19

服务：Character Generator

说明：这是一种仅仅发送字符的服务。UDP版本将会在收到UDP包后回应含有垃圾字符的包。TCP连接时会发送含有垃圾字符的数据流直到连接关闭。HACKER利用IP欺骗可以发动DoS攻击。伪造两个chargen服务器之间的UDP包。同样Fraggle DoS攻击向目标地址的这个端口广播一个带有伪造受害者IP的数据包，受害者为了回应这些数据而过载。

端口：21

服务：FTP

说明：FTP服务器所开放的端口，用于上传、下载。最常见的攻击者用于寻找打开anonymous的FTP服务器的方法。这些服务器带有可读写的目录。木马Doly Trojan、Fore、Invisible FTP、WebEx、WinCrash和Blade Runner所开放的端口。

端口：22

服务：Ssh

说明：PcAnywhere建立的TCP和这一端口的连接可能是为了寻找ssh。这一服务有许多弱点，如果配置成特定的模式，许多使用RSAREF库的版本就会有不少的漏洞存在。

端口：23

服务：Telnet

说明：远程登录，**者在搜索远程登录UNIX的服务。大多数情况下扫描这一端口是为了找到机器运行的操作系统。还有使用其他技术，**者也会找到密码。木马Tiny Telnet Server就开放这个端口。

端口：25

服务：SMTP

说明：SMTP服务器所开放的端口，用于发送邮件。**者寻找SMTP服务器是为了传递他们的SPAM。**者的帐户被关闭，他们需要连接到高带宽的E-MAIL服务器上，将简单的信息传递到不同的地址。木马Antigen、Email Password Sender、Haebu Coceda、Shtrilitz Stealth、WinPC、WinSpy都开放这个端口。

端口：31

服务：MSG Authentication

说明：木马Master Paradise、Hackers Paradise开放此端口。

端口：42

服务：WINS Replication

说明：WINS复制

端口：53

服务：Domain Name Server（DNS）

说明：DNS服务器所开放的端口，**者可能是试图进行区域传递（TCP），欺骗DNS（UDP）或隐藏其他的通信。因此防火墙常常过滤或记录此端口。

端口：67

服务：Bootstrap Protocol Server

说明：通过DSL和Cable  modem的防火墙常会看见大量发送到广播地址255.255.255.255的数据。这些机器在向DHCP服务器请求一个地址。HACKER常进入它们，分配一个地址把自己作为局部路由器而发起大量中间人（man-in-middle）攻击。客户端向68端口广播请求配置，服务器向67端口广播回应请求。这种回应使用广播是因为客户端还不知道可以发送的IP地址。

端口：69

服务：Trival File Transfer

说明：许多服务器与bootp一起提供这项服务，便于从系统下载启动代码。但是它们常常由于错误配置而使**者能从系统中窃取任何 文件。它们也可用于系统写入文件。

端口：79

服务：Finger Server

说明：**者用于获得用户信息，查询操作系统，探测已知的缓冲区溢出错误，回应从自己机器到其他机器Finger扫描。

端口：80

服务：HTTP

说明：用于网页浏览。木马Executor开放此端口。

端口：99

服务：gram Relay

说明：后门程序ncx99开放此端口。

端口：102

服务：Message transfer agent(MTA)-X.400 over TCP/IP

说明：消息传输代理。

端口：109

服务：Post Office Protocol -Version3

说明：POP3服务器开放此端口，用于接收邮件，客户端访问服务器端的邮件服务。POP3服务有许多公认的弱点。关于用户名和密码交 换缓冲区溢出的弱点至少有20个，这意味着**者可以在真正登陆前进入系统。成功登陆后还有其他缓冲区溢出错误。

端口：110

服务：SUN公司的RPC服务所有端口

说明：常见RPC服务有rpc.mountd、NFS、rpc.statd、rpc.csmd、rpc.ttybd、amd等

端口：113

服务：Authentication Service

说明：这是一个许多计算机上运行的协议，用于鉴别TCP连接的用户。使用标准的这种服务可以获得许多计算机的信息。但是它可作为许多服务的记录器，尤其是FTP、POP、IMAP、SMTP和IRC等服务。通常如果有许多客户通过防火墙访问这些服务，将会看到许多这个端口的连接请求。记住，如果阻断这个端口客户端会感觉到在防火墙另一边与E-MAIL服务器的缓慢连接。许多防火墙支持TCP连接的阻断过程中发回RST。这将会停止缓慢的连接。

端口：119

服务：Network News Transfer Protocol

说明：NEWS新闻组传输协议，承载USENET通信。这个端口的连接通常是人们在寻找USENET服务器。多数ISP限制，只有他们的客户才能访问他们的新闻组服务器。打开新闻组服务器将允许发/读任何人的帖子，访问被限制的新闻组服务器，匿名发帖或发送SPAM。

端口：135

服务：Location Service

说明：Microsoft在这个端口运行DCE RPC end-point mapper为它的DCOM服务。这与UNIX  111端口的功能很相似。使用DCOM和RPC的服务利用计算机上的end-point  mapper注册它们的位置。远端客户连接到计算机时，它们查找end-point  mapper找到服务的位置。HACKER扫描计算机的这个端口是为了找到这个计算机上运行Exchange  Server吗？什么版本？还有些DOS攻击直接针对这个端口。

端口：137、138、139

服务：NETBIOS Name Service

说明：其中137、138是UDP端口，当通过网上邻居传输文件时用这个端口。而139端口：通过这个端口进入的连接试图获得NetBIOS/SMB服务。这个协议被用于windows文件和打印机共享和SAMBA。还有WINS Regisrtation也用它。

端口：143

服务：Interim Mail Access Protocol v2

说明：和POP3的安全问题一样，许多IMAP服务器存在有缓冲区溢出漏洞。记住：一种LINUX蠕虫（admv0rm）会通过这个端口繁殖，因此许多这个端口的扫描来自不知情的已经被感染的用户。当REDHAT在他们的LINUX发布版本中默认允许IMAP后，这些漏洞变的很流行。这一端口还被用于IMAP2，但并不流行。

端口：161

服务：SNMP

说明：SNMP允许远程管理设备。所有配置和运行信息的储存在数据库中，通过SNMP可获得这些信息。许多管理员的错误配置将被暴露在Internet。Cackers将试图使用默认的密码public、private访问系统。他们可能会试验所有可能的组合。SNMP包可能会被错误的指向用户的网络。

端口：177

服务：X Display Manager Control Protocol

说明：许多**者通过它访问X-windows操作台，它同时需要打开6000端口。

端口：389

服务：LDAP、ILS

说明：轻型目录访问协议和NetMeeting Internet Locator Server共用这一端口。

端口：443

服务：Https

说明：网页浏览端口，能提供加密和通过安全端口传输的另一种HTTP。

端口：456

服务：[NULL]

说明：木马HACKERS PARADISE开放此端口。

端口：513

服务：Login,remote login

说明：是从使用cable modem或DSL登陆到子网中的UNIX计算机发出的广播。这些人为**者进入他们的系统提供了信息。

端口：544

服务：[NULL]

说明：kerberos kshell

端口：548

服务：Macintosh,File Services(AFP/IP)

说明：Macintosh,文件服务。

端口：553

服务：CORBA IIOP （UDP）

说明：使用cable modem、DSL或VLAN将会看到这个端口的广播。CORBA是一种面向对象的RPC系统。**者可以利用这些信息进入系统。

端口：555

服务：DSF

说明：木马PhAse1.0、Stealth Spy、IniKiller开放此端口。

端口：568

服务：Membership DPA

说明：成员资格 DPA。

端口：569

服务：Membership MSN

说明：成员资格 MSN。

端口：635

服务：mountd

说明：Linux的mountd  Bug。这是扫描的一个流行BUG。大多数对这个端口的扫描是基于UDP的，但是基于TCP的mountd有所增加（mountd同时运行于两个端口）。记住mountd可运行于任何端口（到底是哪个端口，需要在端口111做portmap查询），只是Linux默认端口是635，就像NFS通常运行于2049端口。

端口：636

服务：LDAP

说明：SSL（Secure Sockets layer）

端口：666

服务：Doom Id Software

说明：木马Attack FTP、Satanz Backdoor开放此端口

端口：993

服务：IMAP

说明：SSL（Secure Sockets layer）

端口：1001、1011

服务：[NULL]

说明：木马Silencer、WebEx开放1001端口。木马Doly Trojan开放1011端口。