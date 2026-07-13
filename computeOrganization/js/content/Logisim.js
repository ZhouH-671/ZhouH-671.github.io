// ==================== Logisim.md内容 ====================
const markdownContent = `
# Logisim

内容正在完善，敬请期待！

## 欢迎来到Logisim的世界

### 内容概览与学习指南

#### 为什么要学习Logisim？

在我们现代冯诺依曼架构的计算机中，**CPU**是最重要的部件，而在你的脑海中，CPU会是什么样子呢？

有的同学也许会脱口而出**酷睿，奔腾**。有的同学可能会想象出一块密密麻麻布线的**集成芯片**。有的同学也可能通过我们之前对汇编的学习认识到CPU就是一个**指令集的执行器**。

也有的同学喜欢玩我的世界，看到过这么一张图：

<div>
    <img src="./image/4.1.1.1.png" alt="Minecraft CPU" style="max-width: 100%;">
</div>

这是在Minecraft中使用红石电路搭建的一个8位CPU，这样的庞然大物甚至可以让人心生恐惧。（你可以试着在学习完相关知识后自己在Minecraft中搭建一个）

不难发现，我们对**CPU**的认识可以有多个视角，商品上的、实体上的、功能上的等等，如果回想本课程教学目标，就知道我们希望大家能过最终具备开发CPU的能力，因此，我们需要以一个**开发者的视角**去审视CPU。

对于开发者来说，这个视角必须能够展现出CPU的内部结构，而不是把一切打包在一块代码或者芯片里。并且，它也不能像Minecraft那样繁复地展示所有细节，让人只见树木不见森林。因此，我们还需要能够看到CPU的层次结构。

为此，我们选择了Logisim。Logisim是一款非常优秀的用于数字电路设计与仿真的教育软件。它提供了丰富的电路库与元件的抽象表示，生成的电路图也比较美观，还提供了时序逻的模拟功能，能够让我们对CPU的结构和运行情况有更直观的理解，并且在开发一些小电路时还有一些其他辅助功能。

<div>
    <img src="./image/4.1.1.2.png" alt="Main of CPU 16bits" style="max-width: 100%;">
</div>

所以明确一点，Logisim是我们开发的辅助工具，一个漂亮的草稿本，是我们**观察CPU**的好帮手！

#### 我们能从这里学到什么？

整个教程的内容分为5块：

- Logisim 门电路
- Logisim 组合电路
- Logisim 时序电路
- Logisim 仿真与调试
- 应用与挑战

这五块内容循序渐进，目的是让大家能够体会这种**从零构建（Build from Sratch）**的思路。这种思路与本课程规划时一脉相承的，即从最小的部件开始自底向上开发，从而了解整个复杂系统的结构（注意：这是在各类工程项目实际开发中是常见的模式之一）。我们希望在整个教程结束之后，你能够在Logisim中开发一个单周期CPU，虽然这个CPU非常简单，但会使你具备对CPU架构的基础性认识，并且能使你成为一个**观察更敏锐的开发者**！

关于各章节的内容，**Logisim门电路**主要是讲解逻辑门等最基础元件在Logisim中的使用；**Logisim组合电路**进一步讲授那些较复杂部件的功能与设计，并希望大家能够掌握组合逻辑电路设计的方法；**Logisim时序逻辑**讲解时序逻辑有关的部分，其中状态机的设计与思想将贯穿整个课程；**Logisim仿真与调试**则主要讲解如何使用Logisim进行仿真和调试，其中包含有仿真与调试的基本方法与技巧。至于走向**应用于挑战**，这个部分重要讲解了一些课程应用相关的原件和一些Logisim的实用技巧与减轻工作量的黑魔法。

#### 我们该怎样学习？

Logisim部分与理论课数字电路部分练习较为紧密，大家可以阅读《数字设计和计算机体系结构》中数字电路知识后同步学习。比较需要注意的几点是：

- 完成组合逻辑部分会对理论课学习有一定好处；
- 完成时序逻辑部分需要比较多的时间设计相关电路
- 应用与挑战部分是可选部分，未配备相应的quiz

除了应用于挑战部分外，我们为课程内容配备了相应的测试（quiz），并使用自行搭建的测试平台测试相关电路设计。完成相应的quiz在Logisim学习中非常重要，请大家务必重视。欢迎在讨论区讨论任何相关问题。

### logisim简介

#### Logisim工具简介

<video width="100%" controls style="max-width: 100%;"><source src="./video/Logisim_toolsintroduction.mp4" type="video/mp4">您的浏览器不支持 HTML5 视频播放。</video>

Logisim使用图形用户接口，设计并仿真数字电路，包含基础库（基础门电路，存储器，多路选择器等简单器件）。

Logisim具有以下特点：

- 开源
- 可在任意支持Java5及以上版本的机器上运行
- 画图接口基于直观的工具栏
- 电路可以存为文件，也可以GIF格式导出或打印输出
- 允许层次化的电路设计，子电路调用
- 包含众多内置电路器件
- 内置组合逻辑分析模块，支持在电路、真值表和表达式之间转换

### logisim下载说明及相关资料

#### logisim官方文档

Logisim官网：<a href="https://cburch.com/logisim/" target="_blank">cburch.com/logisim/</a>

该链接存在一定的几率被DNS劫持至非法网站，正确的截图如下：

<div>
    <img src="./image/logisim.png" alt="Logisim官网" style="width: 100%; max-width: 100%;">
</div>

由于launch4j版本问题，推荐大家在官网下载时下载<a href="./resource/logisim-generic-2.7.1.jar" download>jar包版本</a>，同时这里提供了<a href="./resource/logisim-win-2.7.1.exe" download>exe版本</a>。

如果官网无法打开，可以通过北航云盘下载：<a href="https://bhpan.buaa.edu.cn/link/AAE06D244D1DD4486EB9CACDF74DD61CB1" target="_blank">Logisim 2.7.1</a>

以下是Logisim官网文档：

- Beginner's tutorial: <a href="https://cburch.com/logisim/docs/2.7/en/html/guide/tutorial/index.html" target="_blank">新手教程</a>
- The Guide to Being a Logisim User: <a href="https://cburch.com/logisim/docs/2.7/en/html/guide/index.html" target="_blank">User Guide</a>
- Library Reference: <a href="https://cburch.com/logisim/docs/2.7/en/html/libs/index.html" target="_blank">Logisim 指南</a>

#### 参考书目

- 《Digital Design Principles and Practices》John F.Wankrly.
- 《数字设计——原理与实践》机械工业出版社,第1，2，3，4，6，7，8章
- 《数字设计和计算机体系结构》机械工业出版社
- 《Digital Design and Computer Architecture>David Money Harris, Sara L. Harris.第1，2，3，5章

## logisim门电路

### logisim门电路第一步

### 常见门电路

### Tunnel

### Probe

### 探索Logisim库

### 搭建swap电路

## logisim组合电路

### 子电路

### Wire Bundles

### 组合电路初步练习

### 多路选择器、译码器和多路分配器

### 应用中的多路选择器、译码器和多路分配器

### 利用logisim进行组合逻辑分析

### 分析复杂电路

### 排序电路

## logisim时序电路

### SR锁存器

### 时序电路相关部件

### Memory

### 寄存器详解

### 有限状态机

### 状态机浅析

### $2^{n} mod 5$

### 斐波那契数列

## logisim仿真与调试

### logisim调试

### Step Simulation

### 子电路的调试

### ROM与RAM的使用

## 应用与挑战

### Logging

### Logisim设计指南

### Logisim属性栏相关含义介绍

### Logisim自动化方法概览

### Logisim自动化测试概览
`;