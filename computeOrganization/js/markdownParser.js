// ===== js/markdownParser.js =====
// Markdown 解析和渲染工具函数

/**
 * 解析 Markdown 文本为 HTML
 */
function parseMarkdownToHtml(md) {
    // 先按行分割
    const lines = md.split('\n');
    let html = '';
    let inCodeBlock = false;
    let codeLang = '';
    let codeLines = [];
    let inTable = false;
    let tableRows = [];
    let tableAligns = [];
    let inMathBlock = false;
    let mathBlockLines = [];

    const processInline = (text) => {
        // 粗体 ** **
        text = text.replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>');
        // 反引号 `code`
        text = text.replace(/`([^`]+)`/g, '<code>$1</code>');
        // 行内数学公式 $...$（不跨行）
        text = text.replace(/\$(.+?)\$/g, '<span class="math-inline">$1</span>');
        return text;
    };

    const processLine = (line) => {
        const trimmed = line.trim();
        if (trimmed.match(/^<(video|iframe|div|table|audio|canvas|svg|object|embed)[\s>]/i)) {
            return line;  // 直接返回原始 HTML
        }

        // 标题
        if (line.startsWith('# ')) {
            return `<h1>${processInline(line.slice(2))}</h1>`;
        }
        if (line.startsWith('## ')) {
            return `<h2>${processInline(line.slice(3))}</h2>`;
        }
        if (line.startsWith('### ')) {
            return `<h3>${processInline(line.slice(4))}</h3>`;
        }
        if (line.startsWith('#### ')) {
            return `<h4>${processInline(line.slice(5))}</h4>`;
        }
        if (line.startsWith('##### ')) {
            return `<h5>${processInline(line.slice(6))}</h5>`;
        }
        // 列表项
        if (line.match(/^[\-\*]\s/)) {
            return `<li>${processInline(line.slice(2))}</li>`;
        }
        // 数字列表
        if (line.match(/^\d+\.\s/)) {
            return `<li>${processInline(line.replace(/^\d+\.\s/, ''))}</li>`;
        }
        // 引用
        if (line.startsWith('> ')) {
            return `<blockquote>${processInline(line.slice(2))}</blockquote>`;
        }
        // 分割线
        if (line.match(/^[\-\*]{3,}$/)) {
            return '<hr />';
        }
        // 空行
        if (line.trim() === '') {
            return '';
        }
        // 普通段落
        return `<p>${processInline(line)}</p>`;
    };

    let i = 0;
    while (i < lines.length) {
        const line = lines[i];

        // ===== 块级数学公式检测 $$...$$ =====
        if (line.trim().startsWith('$$') && !inMathBlock) {
            inMathBlock = true;
            mathBlockLines = [];
            // 如果 $$ 后面紧跟内容，则把 $$ 去掉后作为第一行
            const contentAfter = line.trim().slice(2);
            if (contentAfter.trim() !== '') {
                mathBlockLines.push(contentAfter);
            }
            i++;
            continue;
        }

        if (inMathBlock) {
            // 检查是否遇到结束的 $$
            if (line.trim().startsWith('$$')) {
                inMathBlock = false;
                // 如果 $$ 前面有内容（同行），则作为最后一行
                const contentBefore = line.trim().slice(0, -2);
                if (contentBefore.trim() !== '') {
                    mathBlockLines.push(contentBefore);
                }
                // 渲染数学公式块
                const mathContent = mathBlockLines.join('\n').trim();
                html += `<div class="math-block">${mathContent}</div>`;
                i++;
                continue;
            } else {
                mathBlockLines.push(line);
                i++;
                continue;
            }
        }

        // 代码块检测
        if (line.trim().startsWith('```')) {
            if (!inCodeBlock) {
                inCodeBlock = true;
                codeLang = line.trim().slice(3).trim();
                codeLines = [];
                i++;
                continue;
            } else {
                // 结束代码块
                inCodeBlock = false;
                const codeContent = codeLines.join('\n');
                const lang = codeLang || 'text';
                html += `<pre><code class="language-${lang}">${codeContent}</code></pre>`;
                i++;
                continue;
            }
        }

        if (inCodeBlock) {
            codeLines.push(line);
            i++;
            continue;
        }

        // 表格检测（简单处理：以 | 开头和结尾）
        if (line.trim().startsWith('|') && line.trim().endsWith('|')) {
            if (!inTable) {
                inTable = true;
                tableRows = [];
                tableAligns = [];
            }
            const cells = line.split('|').slice(1, -1).map(s => s.trim());
            // 检测对齐行 (包含 ---)
            if (cells.every(c => c.match(/^[\:\-]+$/))) {
                // 对齐行，暂存
                tableAligns = cells.map(c => {
                    if (c.startsWith(':') && c.endsWith(':')) return 'center';
                    if (c.endsWith(':')) return 'right';
                    if (c.startsWith(':')) return 'left';
                    return 'left';
                });
            } else {
                tableRows.push(cells);
            }
            i++;
            continue;
        }

        // 如果之前在表格中，但遇到非表格行，则输出表格
        if (inTable) {
            // 输出表格
            let tbl = '<table>';
            if (tableRows.length > 0) {
                // 第一行作为表头
                tbl += '<thead><tr>';
                tableRows[0].forEach((cell, idx) => {
                    tbl += `<th>${processInline(cell)}</th>`;
                });
                tbl += '</tr></thead><tbody>';
                for (let r = 1; r < tableRows.length; r++) {
                    tbl += '<tr>';
                    tableRows[r].forEach((cell, idx) => {
                        tbl += `<td>${processInline(cell)}</td>`;
                    });
                    tbl += '</tr>';
                }
                tbl += '</tbody>';
            }
            tbl += '</table>';
            html += tbl;
            inTable = false;
            tableRows = [];
            tableAligns = [];
            // 继续处理当前行（不递增 i）
            continue;
        }

        // 处理普通行
        const result = processLine(line);
        if (result) {
            // 如果是列表项，需要包裹 ul/ol
            if (result.startsWith('<li>')) {
                // 尝试合并连续的列表项
                let listItems = [result];
                let j = i + 1;
                while (j < lines.length && !lines[j].trim().startsWith('```') && !lines[j].trim().startsWith('|')) {
                    const nextResult = processLine(lines[j]);
                    if (nextResult && nextResult.startsWith('<li>')) {
                        listItems.push(nextResult);
                        j++;
                    } else {
                        break;
                    }
                }
                html += '<ul>' + listItems.join('') + '</ul>';
                i = j;
                continue;
            } else {
                html += result;
            }
        }
        i++;
    }

    // 处理表格未闭合
    if (inTable && tableRows.length > 0) {
        let tbl = '<table>';
        if (tableRows.length > 0) {
            tbl += '<thead><tr>';
            tableRows[0].forEach((cell) => {
                tbl += `<th>${processInline(cell)}</th>`;
            });
            tbl += '</tr></thead><tbody>';
            for (let r = 1; r < tableRows.length; r++) {
                tbl += '<tr>';
                tableRows[r].forEach((cell) => {
                    tbl += `<td>${processInline(cell)}</td>`;
                });
                tbl += '</tr>';
            }
            tbl += '</tbody>';
        }
        tbl += '</table>';
        html += tbl;
    }

    return html;
}

/**
 * 渲染笔记页面
 * @param {string} markdownContent - Markdown 内容
 * @param {string} pageTitle - 页面标题（如 'MIPS汇编'）
 */
function renderNotePage(markdownContent, pageTitle) {
    const contentDiv = document.getElementById('docContent');
    const tocList = document.getElementById('tocList');

    if (!contentDiv || !tocList) {
        console.error('渲染失败：找不到 #docContent 或 #tocList');
        return;
    }

    // 生成 HTML 内容
    const htmlContent = parseMarkdownToHtml(markdownContent);
    const wrappedContent = `
        <h1 class="main-title">${pageTitle}</h1>
        ${htmlContent}
    `;
    contentDiv.innerHTML = wrappedContent;

    // 为每个标题生成 id
    let hCounter = 0;
    contentDiv.querySelectorAll('h1, h2, h3, h4, h5').forEach(el => {
        const id = `heading-${hCounter++}`;
        el.id = id;
    });

    // 构建 TOC 列表
    const levelClassMap = {
        1: 'toc-h2',
        2: 'toc-h2',
        3: 'toc-h3',
        4: 'toc-h4',
        5: 'toc-h5'
    };

    let tocHtml = '';
    contentDiv.querySelectorAll('h1, h2, h3, h4, h5').forEach(el => {
        const level = parseInt(el.tagName[1]);
        const text = el.textContent;
        const id = el.id;
        const cls = levelClassMap[level] || 'toc-h2';
        tocHtml += `<li><a href="#${id}" class="${cls}">${text}</a></li>`;
    });
    tocList.innerHTML = tocHtml;

    // 滚动高亮
    const tocLinks = tocList.querySelectorAll('a');
    const headings = contentDiv.querySelectorAll('h1, h2, h3, h4, h5');

    function updateActiveToc() {
        let activeId = null;
        headings.forEach((h) => {
            const rect = h.getBoundingClientRect();
            if (rect.top <= 100) {
                activeId = h.id;
            }
        });
        tocLinks.forEach(a => {
            a.classList.remove('active-toc');
            if (a.getAttribute('href') === '#' + activeId) {
                a.classList.add('active-toc');
            }
        });
    }

    // 移除旧监听器，添加新监听器（防止重复绑定）
    window.removeEventListener('scroll', updateActiveToc);
    window.addEventListener('scroll', updateActiveToc);
    // 初始调用
    setTimeout(updateActiveToc, 100);
}