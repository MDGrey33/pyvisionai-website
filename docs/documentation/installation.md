# Installation Guide

## System Requirements

### Python Environment
- Python 3.x
- pip (Python package installer)

### System Dependencies

=== "Linux (Ubuntu/Debian)"
    ```bash
    # Install LibreOffice
    sudo apt-get update
    sudo apt-get install libreoffice
    
    # Install Poppler
    sudo apt-get install poppler-utils
    
    # Install Playwright dependencies
    sudo apt-get install libnss3 libnspr4 libatk1.0-0 libatk-bridge2.0-0 libcups2 libdrm2 libxkbcommon0 libxcomposite1 libxdamage1 libxfixes3 libxrandr2 libgbm1 libasound2
    ```

=== "macOS"
    ```bash
    # Using Homebrew
    brew install libreoffice
    brew install poppler
    ```

=== "Windows"
    1. Download and install [LibreOffice](https://www.libreoffice.org/download/download/)
    2. Download and install [Poppler for Windows](http://blog.alivate.com.au/poppler-windows/)
    3. Add the installed binaries to your system PATH

## PyVisionAI Installation

1. Install using pip:
   ```bash
   pip install pyvisionai
   ```

2. Install Playwright:
   ```bash
   playwright install
   ```

## Verify Installation

Test your installation by running:
```bash
pyvisionai --version
```

## Optional Dependencies

For enhanced functionality, you can install additional packages:

```bash
pip install pyvisionai[all]  # Install all optional dependencies
```

## Troubleshooting

### Common Issues

1. **LibreOffice Not Found**
   ```bash
   # Ensure LibreOffice is in your PATH
   which libreoffice  # On Unix-like systems
   where libreoffice  # On Windows
   ```

2. **Poppler Issues**
   - Verify Poppler installation:
     ```bash
     pdfinfo --version
     ```
   - Check if Poppler binaries are in PATH

3. **Playwright Setup**
   - If you encounter browser-related issues:
     ```bash
     playwright install --force
     ```

### Getting Help

If you encounter any issues:
1. Check our [GitHub Issues](https://github.com/MDGrey33/pyvisionai/issues)
2. Join our [Community](../community.md) for support
3. Review the [Resources](../resources.md) section
