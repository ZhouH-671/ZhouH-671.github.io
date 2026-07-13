// ===== commonNav.js =====
// 公共导航栏生成脚本

/**
 * 渲染导航栏
 * @param {string} activePage - 当前激活的页面标识: 'home' | 'mips' | ...
 * @param {string} base - 到项目根目录的相对路径（例如 './' 或 '../../../../'）
 */
function renderNav(activePage = 'home', base = './') {
    const nav = document.createElement('nav');
    nav.className = 'top-nav';

    const navItems = [
        { id: 'home', label: '🏠 首页', href: base + 'index.html' },
        { id: 'logisim', label: 'Logisim', alert: 'Logisim教程暂未开放，敬请期待！' },
        { id: 'verilog', label: 'Verilog', alert: 'Verilog教程暂未开放，敬请期待！' },
        { id: 'mips', label: 'MIPS', href: base + 'note/pre/MIPS汇编/MIPS汇编.html' },
        { id: 'p0', label: 'P0', alert: 'P0实验教程暂未开放，敬请期待！' },
        { id: 'p1', label: 'P1', alert: 'P1实验教程暂未开放，敬请期待！' },
        { id: 'p2', label: 'P2', alert: 'P2实验教程暂未开放，敬请期待！' },
        { id: 'p3', label: 'P3', alert: 'P3实验教程暂未开放，敬请期待！' },
        { id: 'p4', label: 'P4', alert: 'P4实验教程暂未开放，敬请期待！' },
        { id: 'p5', label: 'P5', alert: 'P5实验教程暂未开放，敬请期待！' },
        { id: 'p6', label: 'P6', alert: 'P6实验教程暂未开放，敬请期待！' },
        { id: 'p7', label: 'P7', alert: 'P7实验教程暂未开放，敬请期待！' },
        { id: 'sim', label: '仿真工具', alert: '仿真工具教程暂未开放，敬请期待！' },
    ];

    // 品牌 Logo
    const brand = document.createElement('div');
    brand.className = 'nav-brand';
    brand.innerHTML = `<span class="brand-icon">⚙️</span><span>计算机组成 · 实验</span>`;
    nav.appendChild(brand);

    // 导航链接
    const links = document.createElement('div');
    links.className = 'nav-links';

    navItems.forEach(item => {
        const a = document.createElement('a');
        a.textContent = item.label;

        if (item.id === activePage) {
            a.className = 'active';
        }

        if (item.href) {
            a.href = item.href;
        } else if (item.alert) {
            a.href = 'javascript:void(0)';
            a.onclick = () => alert(item.alert);
        }

        links.appendChild(a);
    });

    // 辅助文字
    const sub = document.createElement('span');
    sub.className = 'nav-sub';
    sub.textContent = '| 教程导航';
    links.appendChild(sub);

    nav.appendChild(links);
    return nav;
}

// 自动挂载：如果页面有 #nav-container 则自动渲染
document.addEventListener('DOMContentLoaded', function() {
    const container = document.getElementById('nav-container');
    if (container) {
        const active = container.dataset.active || 'home';
        // 优先使用 data-base 属性，如果没有则默认为 './'
        const base = container.dataset.base || './';
        container.appendChild(renderNav(active, base));
    }
});