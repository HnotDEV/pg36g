---
title: "Pigsty 快速上手 PG"
weight: 140
math: true
breadcrumbs: false
---

---------

## 如何学习 PG？

有许多人都问过老冯这个问题，我应该如何学习 PostgreSQL？从哪里上手？
老冯认为，学习 PostgreSQL 的最好方式就是 Learn by doing —— 通过实践来学习，而不是通过死看书 / PPT。

那么，什么样的实践才是最适合上手 PostgreSQL 的呢？实话说直到今天，
老冯依然没看到一个让我觉得做的好的教程，这也是老冯写这本教程的原因 —— 我想给初学者提供一个符合直觉，符合认知习惯的上手学习教程。

老冯的建议是，你先不要去急着看什么 PG 文档和书，先拉起真实一套生产环境中的单机 PostgreSQL，
观察它，使用它，用它解决一个小而美的具体实战问题，这比吭哧吭哧傻看多少书都要有用。

这就是 Pigsty 能够发挥作用的地方，这是老冯编写的一套开源 PostgreSQL RDS 方案，在北欧风格的创业公司 —— 探探中管理了 25000 核 vCPU 的数据库。
但它竟然也能完整运行在一台 1C1G 的虚拟机上！所以，我们有许多的研发同事也使用它作为自己的开发沙箱 —— 开发环境，测试环境，生产环境全部统一使用一套方案，
带有 PostgreSQL，完整的监控系统， Linux 配置调优，几百个扩展插件，帮你配置好的 Nginx 和 Docker 环境，可选的 MinIO 对象存储，Redis，等等等等……

听上去很复杂对吧？但老冯得意的一点就是，除了打两行字儿，你不需要什么其他的知识就能把它跑起来 —— 
甚至都不需要用到 Docker，让我们来看看 Pigsty 是如何在光屁股的 Linux 裸机上做到这一点的：



## 快速上手

聊了这么多前戏，现在你的手头应该有一个 Linux VPS 了吧？如果没有，可以参考 [这个教程](/ch01/clawcloud)

ssh 登陆上你的服务器，然后执行以下命令：

```bash
curl https://repo.pigsty.cc/get | bash -s v3.6.1; cd ~/pigsty
./configure
./install.yml
```

嘿，大概几分钟后，你就有了一个开箱即用的 PostgreSQL 开发沙箱了！让我们来看看这个箱子里到底有什么？

完整安装教程： https://doc.pgsty.com/zh/install/start

安装视频：https://asciinema.org/a/731199

哇！真的有好多东西啊！但别的先仍一边，最核心的东西就是这个 PostgreSQL 数据库了！它默认监听本地的 `5432` 端口。


## 访问数据库

现在，让我们来试一下，退出你的 ssh 连接重新登陆上来，敲一个 `p`，神奇的事情就发生了！你通过 PostgreSQL 自带的命令行工具 `psql` 连接上了数据库！

```bash
root@s879132:~# p
psql (17.6 (Ubuntu 17.6-1.pgdg24.04+1))
Type "help" for help.

# 现在你可以输入 SQL 语句了！
postgres=#
```

让我们执行一条 SQL：

```bash
postgres=# SELECT version(); 

                                                              version
-----------------------------------------------------------------------------------------------------------------------------------
 PostgreSQL 17.6 (Ubuntu 17.6-1.pgdg24.04+1) on x86_64-pc-linux-gnu, compiled by gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0, 64-bit
```

如果输出结果太长，`psql` 会使用分页器显示，你可以使用 `q` 键退出分页器。

> [!Note] 按下 `Ctrl + C ` 可以中断当前的查询，再按下 `Ctrl + D` 退出 `psql` 命令行工具。

当然，如果你不熟悉命令行工具，也许会感到陌生与害怕，没关系，我们可以先用一个 [图形化的客户端工具](/ch01/gui) 来操作数据库。
并且在第二章介绍几个核心命令行工具的基础使用方法。


## 数据库连接串

你是如何连接上数据库的呢？其实不论是 PG 自带的 `psql`，还是图形客户端工具，想要访问数据库，都需要一些连接参数
通常需要你输入 Host, Port, User, Password, Database 这五个关键信息！

- Host： 数据库主机的域名或者 IP 地址
- Port： PostgreSQL 的端口，默认是 5432
- User： PostgreSQL 的用户名，在 Pigsty 中，默认的超级管理员用户名是 `dbuser_dba`
- Pass： PostgreSQL 用户密码，在 Pigsty 中，默认的超级管理员密码是 `DBUser.DBA`
- Database： 你要连接的数据库名称，在 Pigsty 单机默认模板中，默认的数据库名称是 `meta`。

绝大多数客户端也接受另外一种 URL 形式的参数，也就是把上面五个要素组合起来，拼成一个 `PGURL`：
这个 URL 的形式是： `postgresql://<username>:<password>@<host>:<port>/<dbname>`，
比如，你这台数据库的默认超级管理员用户（如果没改密码），连接串就长成这样：

```bash
postgresql://dbuser_dba:DBUser.DBA@10.10.10.10:5432/meta
```

- `username`: `dbuser_dba`
- `password`: `DBUser.DBA`
- `host`: `10.10.10.10`（你可能要换成你自己的 IP，但如果是本机，可以用 127.0.0.1）
- `port`: `5432` （可以省略）
- `dbname`: `meta`


当然，不要忘了把这里的密码换成你自己的密码

> [!WARNING] 什么？你跟我说没改过？不要心存侥幸，裸奔云服务器分分钟让你见识赛博世界的险恶 ;-）
>
> 在你往这台 VPS 放任何重要的东西之前，请务必阅读安全加固部分的教程！服务器被黑了，老冯可不负责！



## 用安全加固的方式重新安装一遍

上面那个安装教程很简单对不对？但全是默认参数，你的服务器可以被黑客轻松爆菊。最不济，你要把这几个密码给改了！

```bash
grafana_admin_password: pigsty
pg_admin_password: DBUser.DBA
pg_monitor_password: DBUser.Monitor
pg_replication_password: DBUser.Replicator
patroni_password: Patroni.API
haproxy_admin_password: pigsty
minio_secret_key: minioadmin
```

然后重新执行一遍 

```bash
./pgsql-rm.yml   # 嘿，把之前的 PG 给卸载了，危险操作
./install.yml    # 重新执行完整安装
```

完整的安全配置教程，可以参考文档：https://doc.pgsty.com/zh/config/security/

> [!NOTE] 请记得把 IP 地址，密码换成你自己的！




