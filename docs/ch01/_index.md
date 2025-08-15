---
title: "1. 扬帆起航：搭建你的数据库沙箱"
weight: 100
math: true
breadcrumbs: false
---


## 概览

在本章中，你会学到如何创建一台属于你自己的 PostgreSQL Devbox（开发沙箱），准备好后续学习 PostgreSQL 的环境与工具。




## 前言

当老冯十年前第一次接触 PostgreSQL 的时候，我最大的感受就是想要上手 PostgreSQL 可并不简单，单纯拉起一套环境就要不少时间了。
而且当时并没有什么像样的文档与教程，手把手带我完成环境的搭建。因此，我努力回想当初的经历，尽可能还原出一个初学者的 Mindset，来编写本章内容。
所以你会发现，本章内容其实更多的是帮助初学者准备一个 Devbox 开发沙箱的环境。

关于环境准备，老冯的建议是花小钱省大麻烦 —— 买个域名和微型云服务器，能省掉你大把的时间，其实是很划算的。

- 购买 VPS： [ClawCloud 新手指南](/ch01/clawcloud)： 8$ / 月
- 购买域名： [Cloudflare 新手指南](/ch01/cloudflare)： 8$ / 年

## 准备 Linux 服务器

首先，为什么使用 Linux 服务器，而不是 macOS 或者 Windows 呢？
虽然 PostgreSQL 也可以在 macOS 和 Windows 上运行，但在实际生产环境中，PG 几乎都是清一色的运行在 Linux 服务器上。
老冯的建议是直接学习真实环境中的 PostgreSQL，免得把一些 macOS（BSD）和 Windows 上的特性/怪癖当成 PostgreSQL 的特性，然后在实战中的 Linux 上翻车，一步到位是最好的。

然后是服务器的架构，我建议新人总是使用 x86_64 架构的 Linux 服务器上手。
如果你用的是新一点的 Apple Silicon 笔记本跑虚拟机，那么跑的是 ARM64 架构的 Linux 服务器，
这倒是没太大关系，但是新人上手建议还是从 x86 开始。


## 准备一台云服务器

老冯的建议是，购买一台云服务器，最好是香港/东京区域的云服务器，这样能免掉你折腾梯子与科学上网的烦恼，
科学上网是个很重要的技能，但没必要把时间浪费在这种事情上，香港和东京的云服务器，访问延迟很低，大概 50ms 左右。

其实各家云厂商都有免费的托管套餐，如果你想薅羊毛，其实到处都是。比如阿里云 99¥/年的羊毛机，以及那种秒杀价 ¥38 的轻量应用服务器。
这里1核1G的云服务器其实就够用了，但如果你想跑的舒畅一些，我建议最小用 1C2G 的配置，2C4G 的配置会更游刃有余一些。

老冯自己的服务器是 ClawCloud （阿里云青春版），日本东京，目前体验还不错。
现在日本东京区域 2C/2G/40G 硬盘，1TB 流量，峰值带宽 1Gbps，国内访问 40ms 左右，列表价 10 美元/月（约 70 元人民币），
搜个优惠码打八折，活动价有时候能打 5 折，支持支付宝付款。
这玩意还可以用来科学上网，你也可以拿来建设自己的网站。总的来说，性价比还是很高的。

使用什么操作系统镜像？老冯的建议是 RockyLinux 9.6 或者 Ubuntu 24.04 LTS。
EL10 和 Debian 13 刚刚发布，还不太成熟，上面这两个系统的生态都比较完善，软件包版本也比较新，你可以挑一个喜欢的来用。
如果你是新手，建议从 Ubuntu 24.04 LTS 开始，因为如果你想折腾桌面 Linux 的话，Ubuntu 还是比 EL 系好用的。



## 准备一个域名

老冯的建议是，你最好准备一个域名，这个事情倒是不着急，但是如果你想从公网访问你的 数据库，Web 界面，有一个域名会方便很多。

我的建议是使用 Cloudflare，赛博菩萨提供了一系列极其慷慨的免费服务，而需要的只是每年花几美元（便宜的域名大概 4～5 美元一年，折合人民币三十来块钱一年）。
Cloudfalre 支持银联卡付款，银联信用卡可以直接用，如果你是 “国内储蓄卡”，有可能要开通 “境外支付” 才可以花美元，但这都是小问题。 

如果你实在折腾不来支付，或者必须要弄国内的环境，那么你也可以考虑阿里云的 DNS 或者腾讯云的 DNSPOD。
不过切记：在国内的域名和服务器是需要备案的，折腾这个一般划不来。




## 我就是想在笔记本上跑！

会有朋友说，俺穷！掏不起几十块的域名和服务器钱。就手头这台笔记本，别的没了！

在现在，macOS 和 Windows 下都可以很轻松的使用虚拟化创建出 Linux 环境来。
现在这个年代，早就不用你自己去折腾什么 VMWare 了，老冯的建议是下载一个 Vagrant 和 Terraform ，
这套组合在硅谷很流行，Vagrant 可以傻瓜式的替你用 IaC 的方式一键创建多台虚拟机。
而 Terraform 则可以用同样傻瓜式的方式一键创建所需的云服务器。

不过，整服务器这种事，不是本教程要介绍的重点，所以老冯现在就先不展开了，后面再补上这两个 IaC 神器的使用教程。

- TODO： [Vagrant 使用教程](https://doc.pgsty.com/zh/prepare/vagrant/)
- TODO： [Terraform 使用教程](https://doc.pgsty.com/zh/prepare/terraform/)



## SSH 登陆服务器

老实说，老冯觉得 ssh 属于程序员基础技能，默认每个程序员都应该会用。但我也确实见过很多不会用 ssh 的新手 ……

如果你用的是 Linux ，应该问不出这种问题。如果你用的是 macOS，那么只要打开 “终端” 应用，直接敲 `ssh` 命令就可以了：

```bash
ssh <user>@<ip>   
```

如果你依然觉得这个事情有困难，你可以试试云厂商云服务器的图形终端控制台，如果你觉得这个还有难度，那么本教程不适合你，先学一下 Linux 基础知识再来会比较合适。


## 使用 Pigsty 安装 PostgreSQL

接下来你可以参考这个 [教程](/ch01/pigsty) 来使用 Pigsty 一键安装 PostgreSQL 数据库。

```bash
curl https://repo.pigsty.cc/get | bash -s v3.6.1; cd ~/pigsty
./configure
./install.yml
```




## GUI 工具

- [PostgreSQL 图形客户端工具](/ch01/gui)

## 总结

- 你需要一台 Linux 服务器来运行 PostgreSQL
- 建议你购买一台 Linux 云服务器，作为学习的环境，这样可以免去很多麻烦，我建议你从 Ubuntu 24.04 开始上手。
- 你可以使用 Pigsty 一键在 Linux 上创建一个可用于企业级真实生产环境级别的 PostgreSQL 实例
- 客户端工具有很多，挑一个趁手的图形工具开始吧！





## 参考


reposync \
--repofrompath=pgdg17-rhel9-x86_64,https://download.postgresql.org/pub/repos/yum/17/redhat/rhel-9-x86_64 \
--repoid=pgdg17-rhel9-x86_64 \
--download-metadata --downloadcomps --delete --newest-only \
--download-path=/www/yum/17/redhat/rhel-9-x86_64 \
--setopt=reposync.enabled=0

reposync \
--repofrompath=pgdg17-rhel8-aarch64,https://download.postgresql.org/pub/repos/yum/17/redhat/rhel-8-aarch64 \
--repoid=pgdg17-rhel8-aarch64 \
--download-metadata --downloadcomps --delete --newest-only \
--download-path=/www/yum/17/redhat/rhel-8-aarch64 \
--setopt=reposync.enabled=0