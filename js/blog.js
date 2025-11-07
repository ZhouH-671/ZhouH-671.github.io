// js/blog.js - 博客功能主文件（重构版）
class BlogManager {
    constructor() {
        this.config = {
            emptyMessages: {
                'all': '📝 No articles published yet, stay tuned!',
                'tech': '💻 No articles in JavaScript category',
                'life': '🌿 No articles in Daily life category', 
                'learning': '📖 No articles in Math category',
                'Linear-Algebra': '📐 No articles in Linear Algebra category',
                'math-analysis': '∫ No articles in Math Analysis category',
                'Discrete-Mathematics': '🔢 No articles in Discrete Mathematics category'
            },
            categoryNames: {
                'all': 'All',
                'tech': 'JavaScript',
                'life': 'Daily Life',
                'learning': 'Math',
                'Linear-Algebra': 'Linear Algebra',
                'math-analysis': 'Math Analysis',
                'Discrete-Mathematics': 'Discrete Mathematics'
            },
            mathCategories: ['learning', 'Linear-Algebra', 'math-analysis', 'Discrete-Mathematics']
        };
        
        this.elements = {};
        this.articles = [];
        
        this.init();
    }

    init() {
        this.cacheElements();
        this.bindEvents();
        this.loadArticles();
        this.showCategory('all');
    }

    cacheElements() {
        this.elements = {
            categoryBtns: document.querySelectorAll('.category-btn'),
            articlesContainer: document.querySelector('.articles-container'),
            mathSubcategories: document.getElementById('math-subcategories'),
            subcategoryBtns: document.querySelectorAll('.subcategory-btn')
        };
    }

    bindEvents() {
        // 主分类点击事件
        this.elements.categoryBtns.forEach(btn => {
            btn.addEventListener('click', (e) => this.handleCategoryClick(e));
        });

        // 子分类点击事件
        this.elements.subcategoryBtns.forEach(btn => {
            btn.addEventListener('click', (e) => this.handleSubcategoryClick(e));
        });
    }

    handleCategoryClick(event) {
        const button = event.currentTarget;
        const category = button.getAttribute('data-category');
        
        this.setActiveCategory(button);
        
        if (category === 'learning') {
            this.showMathSubcategories();
            this.showMathCategoryWithSubcategories();
        } else {
            this.hideMathSubcategories();
            this.clearSubcategorySelection();
            this.showCategory(category);
        }
    }

    handleSubcategoryClick(event) {
        const button = event.currentTarget;
        const category = button.getAttribute('data-category');
        
        this.setActiveSubcategory(button);
        this.showCategory(category);
    }

    setActiveCategory(activeButton) {
        this.elements.categoryBtns.forEach(btn => btn.classList.remove('active'));
        activeButton.classList.add('active');
    }

    setActiveSubcategory(activeButton) {
        this.elements.subcategoryBtns.forEach(btn => btn.classList.remove('active'));
        activeButton.classList.add('active');
    }

    showMathSubcategories() {
        this.elements.mathSubcategories.classList.remove('hidden');
    }

    hideMathSubcategories() {
        this.elements.mathSubcategories.classList.add('hidden');
    }

    clearSubcategorySelection() {
        this.elements.subcategoryBtns.forEach(btn => btn.classList.remove('active'));
    }

    showMathCategoryWithSubcategories() {
        this.hideAllArticleLists();
        
        const mathContainer = this.getOrCreateArticleContainer('learning');
        mathContainer.innerHTML = '';

        // 收集所有数学相关分类的文章
        this.config.mathCategories.forEach(mathCategory => {
            const categoryList = document.getElementById(`${mathCategory}-articles`);
            if (categoryList && categoryList.innerHTML !== '') {
                const articles = categoryList.querySelectorAll('.article-item');
                articles.forEach(article => {
                    mathContainer.appendChild(article.cloneNode(true));
                });
            }
        });

        // 如果没有文章，显示空状态
        if (mathContainer.innerHTML === '') {
            mathContainer.innerHTML = this.createEmptyState('learning');
        }

        mathContainer.classList.remove('hidden');
    }

    showCategory(category) {
        const categoryList = this.getOrCreateArticleContainer(category);
        
        this.hideAllArticleLists();
        categoryList.classList.remove('hidden');
    }

    getOrCreateArticleContainer(category) {
        let categoryList = document.getElementById(`${category}-articles`);
        
        if (!categoryList) {
            categoryList = this.createArticleContainer(category);
        }
        
        return categoryList;
    }

    createArticleContainer(category) {
        const categoryList = document.createElement('div');
        categoryList.id = `${category}-articles`;
        categoryList.className = 'articles-list';
        
        const emptyState = this.createEmptyState(category);
        categoryList.innerHTML = emptyState;
        
        this.elements.articlesContainer.appendChild(categoryList);
        return categoryList;
    }

    createEmptyState(category) {
        return `
            <div class="no-articles">
                <p>${this.config.emptyMessages[category]}</p>
            </div>
        `;
    }

    hideAllArticleLists() {
        document.querySelectorAll('.articles-list').forEach(list => {
            list.classList.add('hidden');
        });
    }

    // 文章管理方法
    addArticle(articleData) {
        const article = {
            ...articleData,
            id: this.generateArticleId(articleData.title)
        };
        
        this.articles.push(article);
        
        const articleHTML = this.createArticleHTML(article);
        this.addArticleToCategory(article.category, articleHTML);
        this.addArticleToCategory('all', articleHTML);

        // 如果是数学子分类，也添加到数学主分类
        if (this.config.mathCategories.includes(article.category) && article.category !== 'learning') {
            this.addArticleToCategory('learning', articleHTML);
        }
    }

    createArticleHTML(article) {
        return `
            <div class="article-item">
                ${article.coverImage ? `<img src="${article.coverImage}" alt="${article.title}" class="article-cover">` : ''}
                <div class="article-content">
                    <a href="${article.link}" class="article-title">${article.title}</a>
                    <div class="article-meta">
                        <span class="article-date">${article.date}</span>
                        <span class="article-category">${this.getCategoryName(article.category)}</span>
                    </div>
                </div>
            </div>
        `;
    }

    addArticleToCategory(category, articleHTML) {
        const categoryList = this.getOrCreateArticleContainer(category);
        const noArticlesDiv = categoryList.querySelector('.no-articles');
        
        if (noArticlesDiv) {
            noArticlesDiv.remove();
        }
        
        categoryList.innerHTML += articleHTML;
    }

    getCategoryName(category) {
        return this.config.categoryNames[category] || category;
    }

    generateArticleId(title) {
        return title.toLowerCase().replace(/[^a-z0-9]/g, '-');
    }

    loadArticles() {
        // 预定义文章数据
        const initialArticles = [
            {
                title: '渐行渐远',
                category: 'life',
                date: '2025-11-05',
                link: 'articles/DriftAway.html',
                coverImage: 'images/article_covers/旅行者一号.jpeg'
            }
            // 可以在这里添加更多文章
        ];

        initialArticles.forEach(article => this.addArticle(article));
    }

    // 公共方法 - 可以从外部添加文章
    addNewArticle(articleData) {
        this.addArticle(articleData);
    }

    // 公共方法 - 获取文章统计
    getArticleStats() {
        const stats = {};
        this.config.mathCategories.forEach(cat => {
            stats[cat] = this.articles.filter(article => article.category === cat).length;
        });
        return stats;
    }
}

// 初始化博客管理器
document.addEventListener('DOMContentLoaded', function() {
    window.blogManager = new BlogManager();
});