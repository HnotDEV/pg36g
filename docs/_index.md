---
title: PostgreSQL 36计
cascade:
  type: docs
breadcrumbs: false
---

> 授人以鱼，不如授人以渔，不如授人以全自动捕鱼机。

![](/logo.png)

## 作者

[**冯若航**](https://vonng.com)，网名 [@Vonng](https://github.com/Vonng)。
[PostgreSQL 专家](https://vonng.com/pg)，[数据库老司机](https://vonng.com/db)，[云计算泥石流](https://vonng.com/cloud)。
[**Pigsty**](https://pgsty.com) 作者与创始人。
架构师，DBA，全栈工程师 @ TanTan，Alibaba，Apple。
[活跃](https://committers.top/china)[开源贡献者](https://gitstar-ranking.com/Vonng)，
[DDIA](https://ddia.pigsty.io) / [PG Internal](https://pgint.vonng.com) 中文版译者，公众号：《老冯云数》主理人，数据库 KOL。



## [上卷：应用开发](/dev)

{{< cards cols="3" >}}
    {{< card link="/ch01" title="01 扬帆起航" icon="flag" subtitle="搭建你的数据库沙箱" tag="编写中" tagType="info" >}}
    {{< card link="/ch07" title="07 明察秋毫" icon="chart-bar" subtitle="使用监控系统洞察性能与问题" tag="未发布" >}}  
    {{< card link="/ch13" title="13 经天纬地" icon="globe" subtitle="地理时序扩展插件" tag="未发布" >}}
    
    {{< card link="/ch02" title="02 盲人摸象" icon="eye" subtitle="基本概念与快速上手" tag="未发布" >}}
    {{< card link="/ch09" title="09 百花齐放" icon="color-swatch" subtitle="使用不同风味的 PG 内核分支" tag="未发布" >}}
    {{< card link="/ch14" title="14 见微知著" icon="document-search" subtitle="向量数据库与全文检索" tag="未发布" >}}
    
    {{< card link="/ch03" title="03 手到擒来" icon="hand" subtitle="用案例贯通核心工具" tag="未发布" >}}
    {{< card link="/ch08" title="08 博采众长" icon="collection" subtitle="扩展的安装，使用与管理" tag="未发布" >}}
    {{< card link="/ch15" title="15 合纵连横" icon="database" subtitle="分布式，数据分析扩展" tag="未发布" >}}
    
    {{< card link="/ch04" title="04 正本清源" icon="document-text" subtitle="选择数据类型与索引" tag="未发布" >}}
    {{< card link="/ch10" title="10 巧夺天工" icon="cog" subtitle="PostgreSQL高级特性实战" tag="未发布" >}}
    {{< card link="/ch16" title="16 纤毫毕现" icon="eye" subtitle="监控，安全，复制类扩展" tag="未发布" >}}
    
    {{< card link="/ch05" title="05 运筹帷幄" icon="calculator" subtitle="掌握查询，事务，锁" tag="未发布" >}}
    {{< card link="/ch11" title="11 他山之石" icon="briefcase" subtitle="拉起使用 PG 的企业软件" tag="未发布" >}}
    {{< card link="/ch17" title="17 言出法随" icon="code" subtitle="编程语言与存储过程" tag="未发布" >}}
    
    {{< card link="/ch06" title="06 最佳实践" icon="badge-check" subtitle="PostgreSQL开发规约" tag="未发布" >}}
    {{< card link="/ch12" title="12 一气呵成" icon="lightning-bolt" subtitle="自建 Supabase 后端全家桶" tag="未发布" >}}
    {{< card link="/ch18" title="18 万法归宗" icon="library" subtitle="一切皆用 PostgreSQL" tag="未发布" >}}
{{< /cards >}}



-------------

## [下卷：运维管理](/dba)

{{< cards cols="4" >}}
    {{< card link="/ch19" title="19 开天辟地" icon="desktop-computer" subtitle="环境置备与安装部署" tag="未发布" >}}
    {{< card link="/ch25" title="25 望闻问切" icon="eye" subtitle="监控系统与可观测性" tag="未发布" >}}
    {{< card link="/ch31" title="31 枕戈待旦" icon="bell" subtitle="报警系统与紧急处理" tag="未发布" >}}
    
    {{< card link="/ch20" title="20 未雨绸缪" icon="archive" subtitle="备份规划与容灾设计" tag="未发布" >}}
    {{< card link="/ch26" title="26 胸有成竹" icon="clipboard-check" subtitle="数据库集群管理SOP" tag="未发布" >}}
    {{< card link="/ch32" title="32 妙手回春" icon="clock" subtitle="时间点恢复与延迟从库" tag="未发布" >}}
    
    {{< card link="/ch21" title="21 狡兔三窟" icon="duplicate" subtitle="多节点与高可用集群" tag="未发布" >}}
    {{< card link="/ch27" title="27 守正出奇" icon="refresh" subtitle="模式变更与发布策略" tag="未发布" >}}
    {{< card link="/ch33" title="33 力挽狂澜" icon="exclamation-circle" subtitle="故障切换与集群拓扑" tag="未发布" >}}
    
    {{< card link="/ch22" title="22 四通八达" icon="globe-alt" subtitle="负载均衡与服务接入" tag="未发布" >}}
    {{< card link="/ch28" title="28 游刃有余" icon="link" subtitle="连接池与连接管理" tag="未发布" >}}
    {{< card link="/ch34" title="34 李代桃僵" icon="adjustments" subtitle="负载均衡与流量控制" tag="未发布" >}}
    
    {{< card link="/ch23" title="23 固若金汤" icon="lock-closed" subtitle="访问控制与权限体系" tag="未发布" >}}
    {{< card link="/ch29" title="29 除旧布新" icon="trash" subtitle="膨胀治理与垃圾回收" tag="未发布" >}}
    {{< card link="/ch35" title="35 起死回生" icon="heart" subtitle="无备份删库数据恢复" tag="未发布" >}}
    
    
    {{< card link="/ch24" title="24 纲举目张" icon="clipboard-list" subtitle="制度设计与管理体系" tag="未发布" >}}
    {{< card link="/ch30" title="30 移花接木" icon="switch-horizontal" subtitle="逻辑复制与数据迁移" tag="未发布" >}}
    {{< card link="/ch36" title="36 举一反三" icon="light-bulb" subtitle="定责分锅与复盘改进" tag="未发布" >}}
{{< /cards >}}

