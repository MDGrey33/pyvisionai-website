// Wait for the document to be ready
document.addEventListener('DOMContentLoaded', function() {
    // Add copy button text customization
    document.querySelectorAll('.md-clipboard').forEach(function(button) {
        button.setAttribute('data-clipboard-text', 'Copy to clipboard');
    });

    // Add smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth'
            });
        });
    });

    // Handle external links
    document.querySelectorAll('a').forEach(link => {
        const href = link.getAttribute('href');
        // Check if it's an external link (starts with http and not our domain)
        if (href && href.startsWith('http') && 
            !href.includes('pyvisionai.dev') && 
            !href.includes('127.0.0.1') &&
            !link.closest('.md-header') && // Exclude header navigation
            !link.closest('.md-tabs') && // Exclude tab navigation
            !link.closest('.md-nav')) { // Exclude sidebar navigation
            link.setAttribute('target', '_blank');
            link.setAttribute('rel', 'noopener noreferrer');
            if (!link.classList.contains('md-button')) {
                const icon = document.createElement('span');
                icon.className = 'external-link-icon';
                icon.innerHTML = ' ↗';
                link.appendChild(icon);
            }
        }
    });

    // Add version selector handler
    const versionSelector = document.querySelector('#version-selector');
    if (versionSelector) {
        versionSelector.addEventListener('change', function() {
            window.location.href = this.value;
        });
    });

    // Add code block line highlighting
    document.querySelectorAll('pre code').forEach((block) => {
        const lines = block.innerHTML.split('\n');
        const highlightedLines = lines.map((line, index) => {
            if (line.trim().startsWith('# highlight')) {
                return `<span class="highlighted-line">${line}</span>`;
            }
            return line;
        });
        block.innerHTML = highlightedLines.join('\n');
    });
}); 