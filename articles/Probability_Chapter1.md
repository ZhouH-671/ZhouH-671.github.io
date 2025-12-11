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

&emsp;&emsp;有一类现象在一定条件下必然发生，这类现象称为<span class ="definition">确定性现象</span>。在大量重复实验或观察中所呈现出的固有规律性，就是我们以后所说的<span class="definition">统计规律性</span>。在个别实验中其结果呈现出不确定性，在大量重复实验中其结果又具有统计规律性的现象，我们称之为<span class="definition">随机现象</span>。

## 随机试验

&emsp;&emsp;在概率论中，我们将具有以下三个特点的试验称为<span class="definition">随机试验</span>：

- 可以在相同的条件下重复进行；
- 每次实验的可能结果不止一个，并且能事先明确试验的所有可能结果；
- 进行一次实验之前不能确定哪一个结果会出现。

## 样本空间；随机事件

### 一、样本空间

&emsp;&emsp;我们将随机试验$E$的所有可能结果组成的集合称为$E$的<span class="definition">样本空间</span>，记为$S$。样本空间的元素，即$E$的每个结果，称为<span class="definition">样本点</span>。

### 二、随机事件

&emsp;&emsp;一般，我们称实验$E$的样本空间$S$的子集为$E$的<span class="definition">随机事件</span>，简称<span class="definition">事件</span>。在每一次实验中，当且仅当这一子集中的一个样本点出现时，称这一<span class="definition">事件发生</span>。

&emsp;&emsp;特别的，由一个样本点组成的单点集，称为<span class="definition">基本事件</span>。在每次实验总是发生的事件称为<span class="definition">必然事件</span>。在每次实验都不发生的事件称为<span class="definition">不可能事件</span>。

### 三、事件间的关系与事件的运算

&emsp;&emsp;事件是一个集合，因而事件间的关系与时间的运算就按照集合论中集合之间的关系和集合的运算来处理。设试验$E$的样本空间为$S$，而$A, B, A_{k}(k = 1, 2, ...)$是$S$的子集。

1. 若$A \subseteq B$，则称事件$B$包含事件$A$。事件$A$发生必然导致事件$B$发生。若$A \subseteq B$且$B \subseteq A$，即$A = B$，则称事件$A$和事件$B$相等。
2. 事件$A \cup B = \{x \mid x \in A 或 x \in B\}$称为事件$A$与事件$B$的<span class="definition">和事件</span>。类似的，称$\bigcup_{k=1}^n A_k$为$n$个事件$A_1, A_2, ..., A_n$的和事件。
3. 事件$A \cap B = \{x \mid x \in A 且 x \in B\}$称为事件$A$和事件$B$的<span class="definition">积事件</span>。类似的，称$\bigcap_{k=1}^n A_k$为$n$个事件$A_1, A_2, ..., A_n$的积事件。
4. 事件$A-B = \{x \mid x \in A 且 x \notin B\}$称为事件$A$和事件$B$的<span class="definition">差事件</span>。
5. 若$A \cap B = \varnothing$，则称事件$A$和事件$B$是<span class="definition">互不相容</span>的，或<span class="definition">互斥</span>的。
6. 若$A \cap B = \varnothing$且$A \cup B = S$，则称事件$A$和事件$B$是<span class="definition">互为逆事件</span>的，或<span class="definition">对立</span>的。

## 频率与概率

### 一、频率

&emsp;&emsp;在相同的条件下，进行了$n$次实验。在这$n$次实验中，事件$A$发生的次数$n_A$称为事件$A$发生的<span class="definition">频数</span>。比值$\frac{n_A}{n}$称为事件$A$发生的<span class="definition">频率</span>。由定义，易见频率具有下述基本性质：

- $0 \leq f_n(A) \leq 1$；
- $f_n(S) = 1$；
- 若$A_1, A_2, ... , A_k$是两两互不相容的事件，则

$$
f_n(A_1 \cup A_2 \cup ... \cup A_k) = f_n(A_1) + f_n(A_2) + ... + f_n(A_k)
$$

&emsp;&emsp;大量实验证实，当重复试验的次数逐渐增大时，频率呈现出稳定性，逐渐稳定于某个常数。

### 二、概率

&emsp;&emsp;设$E$是随机试验，$S$是他的样本空间，对于$E$的每一个事件$A$赋予一个实数，记为$P(A)$，称为事件$A的<span class="definition">概率</span>，如果集合函数$P(·)$满足下列条件：

1. **非负性**：对于每一个事件$A$，有$P(A) \geq 0$；
2. **规范性**：对于必然事件$S$，有$P(S) = 1$；
3. **可列可加性**：设$A_1, A_2, ...$是两两互不相容的事件，即对于$A_iA_j = \varnothing, i \neq j, i, j = 1, 2, ...$，有

$$
P(A_1 \cup A_2 \cup ...) = P(A_1) + P(A_2) + ...
$$

&emsp;&emsp;可以证明当$n \to \infty$时频率$f_n(A)$在一定意义下接近于概率$P(A)$。

&emsp;&emsp;由概率的定义，可以推得概率的一些重要性质。

## 等可能概型(古典概型)

&emsp;&emsp;具有以下两个特点的试验称为<span class="definition">等可能概型</span>：

- 试验的样本空间只包含有限个元素；
- 试验中每个基本事件发生的可能性相同。

&emsp;&emsp;设试验的样本空间为$S=\{e_1, e_2, ... , e_n\}$，由于在试验中每个基本事件发生的可能性相等，既有

$$
P(\{e_1\}) = P(\{e_2\}) = ... = P(\{e_n\}).
$$

又由于基本事件是两两互不相容的，于是

$$
P(\{e_i\}) = \frac{1}{n}, i = 1, 2, ..., n.
$$

若事件$A$包含$k$个基本事件，即$A=\{e_{i_1}\} \cup \{e_{i_2}\} \cup ... \cup \{e_{i_k}\}$，这里$i_1, i_2, ..., i_k$是$1, 2, ... , n$中某$k$个不同的数，则有

$$
P(A) = \sum_{j=1}^{k} P(\{e_{i_j}\}) = \frac{k}{n}
$$

## 条件概率

### 一、条件概率

&emsp;&emsp;条件概率是概率论中的一个重要而实用的概念。所考虑的是事件$A$已发生的条件下事件$B$发生的概率。

&emsp;&emsp;设$A, B$ 是两个事件，且$P(A) > 0$，称

$$
P(B|A) = \frac{AB}{A}
$$

为在事件$A$发生的条件下事件$B$发生的<span class="definition">条件概率</span>。不难验证，条件概率$P(·|A)$符合概率定义中的三个条件。

### 二、乘法定理

&emsp;&emsp;由条件概率的定义，立即可得下述<span class="definition">乘法定理</span>。

&emsp;&emsp;设$P(A) > 0$，则有

$$
P(AB) = P(B|A)P(A).
$$

上式不难推广到多个事件的积事件的情况。

### 全概率公式和贝叶斯公式

&emsp;&emsp;设$S$为试验$E$的样本空间，$B_1, B_2, ..., B_n$为$E$的一组事件。若

- $B_iB_j = \varnothing, i \neq j, i, j = 1, 2, ...$;
- $B_1 \cup B_2 \cup ... \cup B_n = S$,

则称$B_1, B_2, ..., B_n$为样本空间$S$的一个<span class="definition">划分</span>。若有$P(B_i) > 0 (i = 1, 2, ..., n)$，则

$$
P(A) = \sum_{i=1}^n P(A | B_i)P(B_i)
$$

上式称为<span class="definition">全概率公式</span>。若有$P(A) > 0$，则

$$
P(B_i | A) = \frac{P(A | B_i)P(B_i)}{\sum_{j=1}^n P(A | B_j)P(B_j)}, i = 1, 2, ..., n
$$

上式称为<span class="definition">贝叶斯公式</span>。

## 独立性

&emsp;&emsp;设$A, B$是两事件，如果满足等式

$$
P(AB) = P(A)P(B),
$$

则称事件$A$和事件$B$<span class="definition">相互独立</span>。如果$P(A) > 0$，若$A, B$相互独立，则$P(B | A) = P(B)$，反之亦然。

一般，设$A_1, A_2, ..., A_n$是$n(n \geq 2)$个事件，如果对其中任意$k(k = 2, 3, ..., n)$个事件的积事件的概率都等于各事件概率之积，则称事件$A_1, A_2, ..., A_n$<span class="definition">相互独立</span>。

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