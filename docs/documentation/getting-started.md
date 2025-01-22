# Getting Started with PyVisionAI

## Overview

PyVisionAI is a powerful tool that leverages Vision Language Models (VLMs) to process and analyze document content. Whether you're working with PDFs, Word documents, PowerPoint presentations, or HTML files, PyVisionAI provides a seamless experience for content extraction and description.

## Prerequisites

Before you begin, ensure you have:

- Python 3.8 or higher
- Operating system: Windows, macOS, or Linux
- Disk space: At least 1GB free space (more if using local Llama model)
- Required system dependencies:
    ```bash
    # macOS (using Homebrew)
    brew install --cask libreoffice  # Required for DOCX/PPTX processing
    brew install poppler             # Required for PDF processing
    pip install playwright          # Required for HTML processing
    playwright install              # Install browser dependencies

    # Ubuntu/Debian
    sudo apt-get update
    sudo apt-get install -y libreoffice  # Required for DOCX/PPTX processing
    sudo apt-get install -y poppler-utils # Required for PDF processing
    pip install playwright               # Required for HTML processing
    playwright install                   # Install browser dependencies

    # Windows
    # Download and install:
    # - LibreOffice: https://www.libreoffice.org/download/download/
    # - Poppler: http://blog.alivate.com.au/poppler-windows/
    # Add poppler's bin directory to your system PATH
    pip install playwright
    playwright install
    ```

## Installation

1. Install PyVisionAI using pip:
   ```bash
   pip install pyvisionai
   ```

2. Set up environment variables:
   ```bash
   # Required for OpenAI Vision (if using cloud description)
   export OPENAI_API_KEY='your-api-key'

   # Optional: Ollama host (if using local description)
   export OLLAMA_HOST='http://localhost:11434'
   ```

## Directory Structure

PyVisionAI uses the following directory structure by default:
```
content/
├── source/      # Default input directory for files to process
├── extracted/   # Default output directory for processed files
└── log/         # Directory for log files and benchmarks
```

You can either:
1. Create them manually:
   ```bash
   mkdir -p content/source content/extracted content/log
   ```
2. Override them with custom paths:
   ```bash
   # Specify custom input and output directories
   file-extract -t pdf -s /path/to/inputs -o /path/to/outputs

   # Process a single file with custom output
   file-extract -t pdf -s ~/documents/file.pdf -o ~/results
   ```

## Basic Usage

### Command Line Interface (CLI)

Process any supported file:

```bash
# Process a single file (using default page-as-image method)
file-extract -t pdf -s path/to/file.pdf -o output_dir
file-extract -t docx -s path/to/file.docx -o output_dir
file-extract -t pptx -s path/to/file.pptx -o output_dir
file-extract -t html -s path/to/file.html -o output_dir

# Process with specific extractor
file-extract -t pdf -s input.pdf -o output_dir -e text_and_images

# Process all files in a directory
file-extract -t pdf -s input_dir -o output_dir
```

## Next Steps

- Learn more about [installation options](installation.md)
- Explore detailed [usage examples](usage.md)
- Join our [community](../community.md)
- Check out our [resources](../resources.md)
