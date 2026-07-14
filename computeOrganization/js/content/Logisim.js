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

Logisim官网：<a href="https://cburch.com/logisim/" target="_blank">Logisim官网</a>

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

<video width="100%" controls style="max-width: 100%;"><source src="./video/Logisim_gatecircuit.mp4" type="video/mp4">您的浏览器不支持 HTML5 视频播放。</video>

以下是Logisim的界面的相关的介绍：

<div>
    <img src='./image/logisim_2_1.png'alt="Logisim界面"width="100%">
</div>

总结：

1. Logisim提供图形界面，以鼠标拖拽的形式可以新建部件以及进行部件间连线。
2. 也可通过快捷键\`Ctrl+D\`增加一个所选择的部件。
3. 对于内置部件库中的部件功能，大家可以自行探索，理解其相应的属性含义。

接下来让我们先进行一下元件浏览吧。

下面是Logisim中Wiring（线路）组件

<div>
    <img src='./image/logisim_2_1_wiring.png'alt="Logisim Wiring"width="100%">
</div>

Gates（逻辑门）组件

<div>
    <img src='./image/logisim_2_1_Gates.png'alt="Logisim Gates"width="100%">
</div>

Plexers（复用器）组件

<div>
    <img src='./image/logisim_2_1_Plexers.png'alt="Logisim Plexers"width="100%">
</div>

Arithmetic（运算器）组件

<div>
    <img src='./image/logisim_2_1_Airthmetic.jpg'alt="Logisim Airthmetic"width="100%">
</div>

Memory（存储）组件

<div>
    <img src='./image/logisim_2_1_Memory.png'alt="Logisim Memory"width="100%">
</div>

Input/Output（输入/输出）组件

<div>
    <img src='./image/logisim_2_1_IO.png'alt="Logisim IO"width="100%">
</div>

Base（基本）组件

<div>
    <img src='./image/logisim_2_1_Base.png'alt="Logisim Base"width="100%">
</div>

相信在了解了每种元件的中文名称后，你已经对元件的功能有了基本的了解，可能有的原件名称比较抽象，别着急，我们后面会慢慢讲解。

### 常见门电路

#### 识别逻辑门元件

数字电路中最基础的内容就是逻辑电路门，在我们学习计算机组成原理的相关章节和使用Logisim中，需要攻克的第一个难关就是认识逻辑电路门的功能。

普通的电路门比如与门、或门、非门想必大家已经熟悉了。

但还有一些电路门，也许大家在之前见的不是太多，可是在我们之后的学习中也会发挥重大作用，也有必要进行熟悉。

下图是某种电路门的Logisim中的图示，请你查阅相关资料后，写出他的真值表。

<div>
    <img src='./image/3.2.2.1.png'alt="异或门"width="100%">
</div>

|A|B|Y|
|---|---|---|
|0|0|0|
|0|1|1|
|1|0|1|
|1|1|0|

#### 完成加法器

在数字电路中，加法器是一种用于执行加法运算的数字电路元件，是构成电子计算机核心微处理器（CPU）中算术逻辑单元（ALU）的基础。在这些数字电路系统中，加法器主要负责计算地址、索引等数据。除此之外，加法器也是其它一些硬件，例如二进制数乘法器的重要组成部分。

尽管可以为不同计算系统设计专门的加法器，但是由于数字电路通常以二进制为基础，因此二进制加法其在实际应用中最为普遍。在数字电路中，二进制的减法可以通过加一个负数来间接完成。为了使负数的计算能够直接用加法器来完成，计算中的负数可以使用补码（2's complement）来表示，具体的细节可以参考数字电路相关的书籍。

今天，我们先来完成二进制加法器中最简单的一位全加器，请你选择正确的元件，填入下图中电路中的空缺部分。

<div>
    <img src='./image/4.2.1.2choice.png'alt="全加器"width="100%">
</div>

全加器的表达式为：\`S = A ^ B ^ Cin; Cout = A & B | Cin & (A ^ B);\`（\`^\`为异或，\`&\`为与，\`|\`为或）。其中，\`A\`，\`B\`为要相加的数，\`Cin\`为进位输入；\`S\`为和，\`Cout\`是进位输出。

### Tunnel

在此后了解一下几种常见的元器件。

<video width="100%" controls style="max-width: 100%;"><source src="./video/Logisim_tunnel.mp4" type="video/mp4">您的浏览器不支持 HTML5 视频播放。</video>

TUnnel部件是在整个Logisim实验中简化电路布线复杂度效果最好的一个部件，可以让你在纷繁复杂的接线中解脱出来，让你能够更加专心的关注于各个部件的设计，而不被复杂的接线所打扰。Tunnel名为隧道，即它可以将标签相同Tunnel之间的数据，通过一个不可见的“隧道”进行传输，在使用过程中，可以连接数据的输入端和输出端，使得数据可以方便简单的传输。

注：Tunnel需要增加标签一区分不同的数据。并且每个标签只允许有一个输入，输出的数量不做限制，但是在有较多Tunnel部件的时候，要特别留意标签的名字，防止出现错误。

### Probe

<video width="100%" controls style="max-width: 100%;"><source src="./video/Logisim_probe.mp4" type='video/mp4'>您的浏览器不支持 HTML5 视频播放。</video>

Probe作为一个显示线路数据值的部件，可以对多位宽数据进行实时监控。简而言之，就是可以直接显示接线的数值，并且不影响整个电路的运行。

熟练掌握Probe部件，可以方便大家对电路进行实时监控，做到分部件测试的效果。

### 探索Logisim库

回答本题前，请先阅读Logisim的[Library Reference](https://cburch.com/logisim/docs/2.7/en/html/libs/index.html)参考文档，并可以借助之后的教程属性栏相关含义介绍中的部分内容，熟悉Wiring，Gates和Arithmetic三个内置库中的器件，然后根据以下小题的描述，选出对应的器件。

（这里是一些练习题，本网站暂未收录）

### 搭建swap电路

现在需要你使用基础的门电路搭建这样一个电路，当输入\`S\`为\`0\`（低电平）是，输出\`O1\`等于输入\`I1\`，输出\`O2\`等于输入\`I2\`，当输入\`S\`为\`1\`（高电平）时，则交换两输出，即输出\`O2\`等于输入\`I1\`，输出\`O1\`等于输入\`I2\`。我们给它取名叫做swap电路。

#### 提交要求

**用Logisim完成swap电路并提交**：

- **文件内模块名**：\`swap\`
- 输入：\`I1\`（1 bit）、\`I2\`（1 bit）、\`S\`（1 bit）
- 输出：\`O1\`（1 bit）、\`O2\`（1 bit）
- **注意：请从门级电路开始搭建，切勿使用Plexers类元件**
- **测试电路图（我们将使用下方的电路对你搭建的电路进行测试，测试的原理是将下图的swap模块替换为你提交文件中的swap模块，随后测试机回仿真运行下图中的电路图，记录其输出并与正确的输出进行对比）**

<div>
    <img src='./image/4.2.3.1.png'alt="评测机" width="100%">
</div>

- **注意：请保证模块的appearance与下图完全一致，否则可能造成评测错误**（查看模块appearance方法：在Logisim中打开相应模块后点击左上角 <img src="./image/appearance%20(1).png" alt="appearance" style="width:32px;height:32px;vertical-align:middle;"> 按钮）

<div>
    <img src='./image/swap_appearance.png'alt="Swap Appearance"width="100%">
</div>

## logisim组合电路

### 子电路

<video width="100%" controls style="max-width: 100%;"><source src="./video/Logisim_subcircuit.mp4" type='video/mp4'>您的浏览器不支持 HTML5 视频播放。</video>

#### 子电路使用流程

1. 创建子电路：通过Project栏下的Add Circuit；
2. 添加子电路内容：子电路布线；
3. 设置子电路外观：更改外观时，可对端口增加文字说明，提高可读性

<div>
    <img src='./image/logisim_3_1_1.png'alt="外观编辑页面"width="100%">
</div>

4. 引用子电路：使用3中设置的外观进行连接电路，封装子电路，使电路更加模块化，从而提升电路的可读性和可维护性。

### Wire Bundles

<video width="100%" controls style="max-width: 100%;"><source src="./video/Logisim_wirebundles.mp4" type='video/mp4'>您的浏览器不支持 HTML5 视频播放。</video>

下图表示不同的接线颜色所表示的含义：

<div>
    <img src='./image/logisim_3_2.png'alt="Wire Colors"width="100%">
</div>

对于一个完整且正确的电路，是以深绿色，浅绿色，黑色接线构成，绿色接线可以通过深浅直接判断出取值，而黑色接线，并不能直接反映出取值，这里建议大家使用Wiring库中的Probe元器件，可以对多位数据实时显示监控。

特别的，在构建大型的电路时，大量界接线交叉将直接影响观察，在Wiring库中存在着可简化布线的原件Tunnel，请大家自行查阅Library Reference参考文档并学习。

### 组合电路初步练习

（这是一些练习题，本网站暂未收录）

### 多路选择器、译码器和多路分配器

#### 多路选择器

在组合电路中，多路选择器（Mutiplexer，简称MUX）是非常重要的一类部件，他们在组合电路中扮演着非常重要的角色。下图是一个典型的Logisim中的多路选择器，左侧是多个输入，右侧是相应的输出，通过底部（黑色）的选择信号，对输入的信号选择后输出，另外一个端口是部件的使能端，当其为高电平（为1）时，整个部件使能工作。

<div>
    <img src='./image/4.3.2.1.png'alt="MUX"width="30%">
</div>

MUX最为重要的功能就是从多个输入信号中选择一个作为输出，在我们外来的CPU设计种，我们需要设置很多的MUX来使得CPU中的数据通路能够处理复杂的指令集。

在具体的使用中，当选中MUX时，需要关注左下角的Selection: Mutiplexer界面，其中可以对数据位宽，选择位宽，是否有使能端等可以进行相关设置，可以在实际搭建中灵活运用。

<div>
    <img src='./image/4.3.2.2.png'alt="Selection Mutiplexer"width="50%">
</div>

#### 多路分配器

多路分配器和多路选择器功能恰好相反，即能够将一个数据数据，根据需要传送到多个输出端的任何一个输出端。

<div>
    <img src='./image/4.3.2.3.png'alt="DMX"width="30%">
</div>

其有与多路选择器十分类似的Selection界面，这些可以在实际使用中进行设置。

<div>
    <img src='./image/4.3.2.4.png'alt="Selection Demultiplexer"width="50%">
</div>

#### 译码器

译码器和多路选择器类似，同样是组合电路中非常重要的部件，如下图，右侧是多个输出，底部是黑色的选择信号与使能端，译码器最大的功能在于将二进制编码转换为相应的独热码，如101的3位二进制编码作为输入就会被转换成00100000的8位独热码作为输出，因而该元件得名译码器。

<div>
    <img src='./image/4.3.2.5.png'alt="Ded"width="30%">
</div>

同样，在具体使用中选中时，同样有相应的Selection界面，其中对选择位宽，使能相关均可以设置。

<div>
    <img src='./image/4.3.2.6.png'alt="Delection Decoder"width="50%">
</div>

我们可以发现，译码器与多路选择器不同之处有两点：

1. 除选择信号外，多路选择器是多输入，单输出，输出取决于选择信号，译码器则是无输入，多输出，输出模式仅取决于选择信号。
2. 译码器输出位宽每个信号仅一位，多路选择器可以有多位。

因此在之后的组合电路设计中，我们需要仔细思考，在合适的地方使用合适的部件。相关属性的详细介绍请参考Logisim属性栏相关含义介绍。

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