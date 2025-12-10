<style>
.definition {
    color: #1890ff;
    font-family: "楷体", "STKaiti", serif;
    font-weight: bold;
    background-color: #f0f8ff;
    padding: 4px 8px;
    border-left: 3px solid #1890ff;
    margin: 8px 0;
}

.conclusion {
    color: #52c41a;
    font-family: "宋体", "SimSun", serif;
    font-weight: bold;
    background-color: #f6ffed;
    padding: 4px 8px;
    border-left: 3px solid #52c41a;
    margin: 8px 0;
}

.problem {
    color: #fa541c;
    font-family: "黑体", "SimHei", sans-serif;
    font-weight: bold;
    background-color: #fff2e8;
    padding: 4px 8px;
    border-left: 3px solid #fa541c;
    margin: 8px 0;
}
</style>

<script type="text/javascript"id="MathJax-script" async
        src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-svg.js">
</script>

# 第一章 概率论的基本概念

## 随机试验

## 样本空间；随机事件

## 频率与概率

## 等可能概型(古典概型)

## 条件概率

## 独立性

## 小结

---

&emsp;&emsp;随机试验的全部可能结果组成的集合 $S$ 称为样本空间。样本空间 $S$ 的子集称为事件，当且仅当这一子集中的一个样本点出现时，称这一事件发生。事件是一个集合，因而事件的关系与事件的运算自然按照集合论中集合之间的关系和集合的运算来处理。集合间的关系和集合的运算，读者是熟悉的，重要的是要知道它们在概率论中的含义。

&emsp;&emsp;在一次实验中，一个事件(除必然事件与不可能事件外)可能发生也可能不发生，其发生的可能性的大小是客观存在的，事件发生的概率以及它的稳定性，表明能用一个数来表征事件在一次实验中发生的可能性的大小。我们从频率的稳定性及频率的性质得到启发和抽象，给出了概率的定义。我们定义了一个集合(事件)的函数 $P(·)$ ，它满足三条基本性质：

1. 非负性
2. 规范性
3. 可列可加性

这一函数的函数值 $P(A)$ 就定义为事件 $A$ 概率。

&emsp;&emsp;概率的定义只给出了概率必须满足的三条基本性质，并未对事件 $A$ 的概率 $P(A)$ 给定一个具体的数。只在古典概型的情况，对于每个事件 $A$ 给出了概率 $P(A) = k/n$ 。一般，我们可以进行大量的重复实验，得到事件 $A$ 的频率，而以频率作为 $P(A)$ 的近似值，或者根据频率的性质分析，得到 $P(A)$ 的取值。

&emsp;&emsp;在古典概型中，我们证明了条件概率的公式

$$
P(B|A) = \frac{P(A \cap B)}{P(A)}, \quad P(A) > 0. \tag{5.2}
$$

在一般的情况，上式作为条件概率的定义。固定 $A$ ，条件概率 $P(·|A)$ 据具有概率定义中的三条基本性质，因而条件概率是一种概率。

&emsp;&emsp;有两种计算条件概率 $P(B|A)$ 的方法：(1)按条件概率的含义，直接求出 $P(B|A)$ 。注意到，在求 $P(B|A)$ 时已知事件 $A$ 已发生，样本空间 $S$ 中所有不属于 $A$ 的样本点都被排除，原有的样本空间 $S$ 缩减成为 $S' = A$ 。在缩减了的样本空间 $S' = A$ 中计算事件 $B$ 的概率就得到 $P(B|A)$ 。(2)在 $S$ 中计算 $P(AB)$ 及 $P(A)$ ，再按(5.2)式求得 $P(B|A)$。

&emsp;&emsp;将(5.2)式写成

$$
P(A \cap B) = P(B|A)P(A), \quad P(A) > 0. \tag{5.3}
$$

这就是乘法公式。我们常按上述第一种方法求出条件概率，从而按(5.3)可求得 $P(AB)$ 。

&emsp;&emsp;事件的独立性是概率论中一个非常重要的概念。概率论与数理统计中的很多很多内容都是在独立的前提下讨论的。应该注意到，在实际应用中，对于事件的独立性，我们往往不是根据定义来验证而是根据实际意义来加以判断的。根据实际背景判断事件的独立性，往往并不困难。