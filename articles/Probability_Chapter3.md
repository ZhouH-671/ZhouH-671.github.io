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

<h1 align="center">第三章 多维随机变量及其分布</h1>

<h2 align="center">二维随机变量</h2>

### 一、二维随机变量和分布函数

&emsp;&emsp;一般，设E是一个随机试验，它的样本空间是$S={e}$，设$X=X{e}$和$Y=Y{e}$是定义在S上的随机变量，由它们构成的一个向量$(X, Y)$，叫做<span class="definition">二维随机向量</span>或<span class="definition">二维随机变量</span>。

&emsp;&emsp;设 $(X, Y)$ 是二维随机变量，对于任意实数$x, y$，二元函数：

$$
F(x, y) = P{(X \leq x) \cap (Y \leq y)} \overset{\text{记作}} {=} p(X \leq x, Y \leq y)
$$

称为二维随机变量 $(X, Y)$ 的<span class="definition">分布函数</span>，或称为随机变量X和Y的<span class="definition">联合分布函数</span>。

&emsp;&emsp;容易算出随机点 $(X, Y)$ 落在矩形域 $\{ (x,y)| x_1 < x \leq x_2, y_1 < y \leq y_2\}$ 的概率为

$$
P \{ x_1 < X \leq x_2, y_1 < Y \leq y_2\} = F(x_2, y_2) - F(x_1, y_2) - f(x_2, y_1) + F(x_1, y_1)
$$

&emsp;&emsp;分布函数 $F(x, y)$ 具有以下的基本性质：

1. $F(x, y)$ 是变量X和Y的不减函数；
2. $0 \leq F(x, y) \leq 1$ 且
<div align="center">
对于任意固定的 $y$ ，$F(-\infty, y) = 0$,<br>
对于任意固定的 $x$ , $F(x, -\infty) = 0$,<br>
$F(-\infty, -\infty) = 0, F(+\infty, +\infty) = 1$.
</div>

3. $F(x+0, y) = F(x, y), F(x, y+0) = F(x, y)$， 即 $F(x, y)$ 关于 $x$ 右连续，关于 $y$ 也右连续。
4. 对于任意 $(x_1, y_1), (x_2, y_2), x_1 < x_2, y_1 < y_2$，下述不等式成立：

$$
F(x_2, y_2) - F(x_1, y_2) - f(x_2, y_1) + F(x_1, y_1) \geq 0
$$

也就是概率的非负性。

### 二、离散型随机变量

&emsp;&emsp;如果二维随机变量 $(X,Y)$ 全部可能取到的值是有限对或可列无限多对，则称 $(X, Y)$ 是<span class="definition">离散型随机变量</span>。

&emsp;&emsp;设二维离散型随机变量 $(X, Y)$ 全部可能取的值为 $(x_i, y_i), i, j = 1,2,...$ ，记 $P\{ X=x_i, Y=y_i \} = p_{ij}, i,j=1,2,...$，则由概率的定义有

$$
p_{ij} \geq 0, \sum_{i=1}^{\infty} \sum_{j=1}^{\infty} = 1.
$$

&emsp;&emsp;我们称 $P\{ X=x_i, Y=y_i \} = p_{ij}, i,j=1,2,...$ 为二维离散型随机变量 $(X,Y)$ 的<span class="definition">分布律</span>，或随机变量 $X$ 和 $Y$ 的<span class="definition">联合分布律</span>。

&emsp;&emsp;将 $(X, Y)$ 看成一个随机点的坐标，则离散型随机变量 $X$ 和 $Y$ 的联合分布函数为

$$
F(x, y) = \sum_{x_i \leq x} \sum_{y_i \leq y} p_{ij}.
$$

### 三、连续型随机变量

&emsp;&emsp;与一维随机变量相似，对于二维随机变量 $(X, Y)$ 的分布函数 $F(x, y)$ ，如果存在非负的函数 $f(x, y)$ 使对任意 $x,y$ 有

$$
F(x, y) = \int_{-\infty}^{y} \int_{-\infty}^{x} f(u, v) dudv,
$$

则称 $(X, Y)$ 是<span class="definition">连续型二位随机变量</span>，函数 $f(x,y)$ 称为二维随机变量 $(X, Y)$ 的概率密度，或称为随机变量 $X$ 和 $Y$ 的<span class="definition">联合概率密度</span>。

&emsp;&emsp;按照定义，概率密度 $f(x, y)$ 具有如下定义：

1. $f(x, y) \geq 0$ ;
2. $\int_{-\infty}^{\infty} \int_{-\infty}^{\infty} f(x, y)dxdy = F(\infty, \infty) = 1$
3. 设 $G$ 是 $xOy$ 平面上的区域，点 $(x,y)$ 落在 $G$ 内的概率为

$$
P\{ (X, Y) \in G\} = \iint_G f(x,y)dxdy
$$

4. 若 $f(x,y)$ 在点 $(x,y)$ 连续，则有

$$
\frac{\partial^2 F(x, y)}{\partial x \partial y} = f(x, y)
$$

### 四、n维随机变量

&emsp;&emsp;以上关于二维随机变量的讨论，不难推广到 $n(n > 2)$ 维随机变量的情况。一般，设 $E$ 是一个随机试验，他的样本空间是 $S = \{ e \} $ ，设 $X_1 =  X_1\{e\}, X_2 =  X_2\{e\}, ..., X_n =  X_n\{e\}$ 是定义在 $S$ 上的随机变量，由他们构成的一个 $n$ 维向量 $(X_1, X_2, ...,   X_n)$ 叫做<span class="definition">n维随机变量</span>。它的分布函数定义也类似。

<h2 align="center">边缘分布</h2>

&emsp;&emsp;二维随机变量 $(X, Y)$ 作为一个整体，具有分布函数 $F(x, y)$ ，而 $X$ 和 $Y$ 都是随机变量，各自也有分布函数，将它们分别记为$F_X(x), F_Y(y)$，依次称为随机变量 $(X, Y)$ 关于 $X$ 和关于 $Y$ 的<span>边缘分布函数</span>。有：

$$
F_X(x) = P\{ X \leq x, Y \leq \infty\} = F(x, \infty)
$$

即 $F_X(x) = F(x, \infty)$ 。同理 $F_Y(y) = F(\infty, y)$ 。对于离散型随机变量，有

$$
F_X(x) = F(x, \infty) = \sum_{x_i \leq x} \sum_{j=1}^{\infty} p_{ij}.
$$

则 $X$ 的分布律为

$$

$$

<h2 align="center">条件分布</h2>

<h2 align="center">相互独立的随机变量</h2>

<h2 align="center">两个随机变量的函数的分布</h2>

<h2 align="center">小结</h2>

---

&emsp;&emsp;将一维随机变量的概念加以扩充，就得到多维随机变量，我们着重讨论了二维随机变量，和一维随机变量一样，我们定义二维随机变量$(X, Y)$的分布函数

$$
F(x,y) = P(X \leq x, Y \leq y), -\infty < x < \infty, -\infty < y < \infty
$$

对于离散型随机变量$(X, Y)$定义了分布律

$$
P(X = x_i, Y = y_j) = p_{ij}, i = 1, 2, \cdots, j = 1, 2, \cdots, \sum_{i=1} ^ {\infty} \sum_{j=1} ^ {\infty} p_{ij} = 1.
$$

对于连续型随机变量$(X, Y)$定义了概率密度$f(x, y)(f(x, y) \geq 0)$

$$
F(x, y) = \int_{-\infty} ^ {x} \int_{-\infty} ^ {y} f(x, y) dxdy, \quad \forall x, y.
$$

&emsp;&emsp;二维随机变量的分布律与概率密度的性质与一维的相似。特别，对于二维连续型随机变量，有公式

$$
P\{ (x, y) \in G \} = \iint \limits_G f(x, y) dxdy,
$$

其中，G是平面上的某区域(它是一维连续型变量的公式$P(a < X \leq b) = \int_a^b f(x)dx$的扩充)。这一公式常用来求随机变量的不等式成立的概率，例如

$$
P(Y \leq X) = P \{ (X, Y) \in G \} = \iint \limits_G f(x, y) dxdy,
$$

其中，G为半平面$y \leq x$。

&emsp;&emsp;在研究二维变量$(X, Y)$时，除了讨论上述与一维变量类似的内容外，还要讨论以下的新内容：边缘分布、条件分布、随机变量的独立性等。

&emsp;&emsp;注意到，对于$(X, Y)$的分布可以确定关于X、关于Y的边缘分布。反之，由关于X、关于Y的边缘分布一般是不能确定$(X, Y)$的分布的。只有当X、Y相互独立时，由两边缘分布能确定$(X, Y)$的分布。

&emsp;&emsp;随机变量的独立性是随机事件独立性的扩充。我们也常利用问题的实际意义去判断两个随机变量的独立性。例如，若X，Y分别代表两个工厂生产的显像管的寿命，我们可以认为X、Y是相互独立的。

&emsp;&emsp;我们还讨论了$Z = X + Y, \quad Z = Y / X, \quad M = max\{ X, Y \}, \quad N = min\{ X,Y \}$的分布的求法(设$(X, Y)$的分布已知)。

&emsp;&emsp;本章在进行各种问题的计算时，要用到二重积分或用到二元函数固定其中一个变量对另一个变量的积分。此时千万要搞清楚积分变量的变化范围。题目做错，往往是由于在进行积分运算时，将有关的积分区间或积分区域搞错了。在做题时，画出有关函数的定义域的图形。对于正确确定积分上下限肯定是有帮助的。另外，所求得的边缘密度、条件密度或$Z = X + Y$的密度等，往往是分段函数，正确写出分段函数的表达式当然是必须的。
