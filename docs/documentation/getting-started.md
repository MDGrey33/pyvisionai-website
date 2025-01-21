# Getting Started with PyVisionAI

## Overview

PyVisionAI is a powerful tool that leverages Vision Language Models (VLMs) to process and analyze document content. Whether you're working with PDFs, Word documents, PowerPoint presentations, or HTML files, PyVisionAI provides a seamless experience for content extraction and description.

## Prerequisites

Before you begin, ensure you have the following installed:

- Python 3.x
- pip (Python package installer)
- Required system dependencies:
    - [LibreOffice](https://www.libreoffice.org/) (for DOCX/PPTX support)
    - [Poppler](https://poppler.freedesktop.org/) (for PDF support)
    - [Playwright](https://playwright.dev/) (for HTML support)

## Installation

1. Install PyVisionAI using pip:
   ```bash
   pip install pyvisionai
   ```

2. Set up Playwright for HTML processing:
   ```bash
   playwright install
   ```

## Basic Usage

### Command Line Interface (CLI)

Process any supported file using the command line:

```bash
pyvisionai process <path_to_your_file>
```

Example:
```bash
pyvisionai process example.pdf
```

### Python Library

You can also use PyVisionAI as a Python library in your projects:

```python
from pyvisionai import process_document

# Process a document
result = process_document("path/to/document.pdf")

# Access the extracted content
content = result.content

# Get generated descriptions
descriptions = result.descriptions
```

## Next Steps

- Learn more about [installation options](installation.md)
- Explore detailed [usage examples](usage.md)
- Join our [community](../community.md)
- Check out our [resources](../resources.md)
