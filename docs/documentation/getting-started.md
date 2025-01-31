# Getting Started with PyVisionAI

## Overview

PyVisionAI is a powerful tool that leverages Vision Language Models (VLMs) to process and analyze document content. Whether you're working with PDFs, Word documents, PowerPoint presentations, or HTML files, PyVisionAI provides a seamless experience for content extraction and description.

This guide will help you get up and running with PyVisionAI quickly. We'll cover installation, basic setup, and common use cases.

## Prerequisites

Before using PyVisionAI, ensure you have:

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
   # For OpenAI Vision (recommended)
   export OPENAI_API_KEY='your-api-key'

   # For local Llama (optional)
   # First install and start Ollama
   brew install ollama    # macOS
   ollama serve
   ollama pull llama3.2-vision
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

## Quick Start

### 1. Extract Text and Images from a PDF

```python
from pyvisionai import create_extractor

# Create a PDF extractor
extractor = create_extractor("pdf")

# Extract content (will use GPT-4 Vision by default)
output_path = extractor.extract(
    "path/to/document.pdf",
    "output_directory"
)

print(f"Extracted content saved to: {output_path}")
```

### 2. Process a Word Document

```python
# Create a DOCX extractor with text_and_images method
extractor = create_extractor(
    "docx",
    extractor_type="text_and_images"
)

# Extract content
output_path = extractor.extract(
    "path/to/document.docx",
    "output_directory"
)
```

### 3. Capture and Process a Web Page

```python
# Create an HTML extractor
extractor = create_extractor("html")

# Extract content from a URL
output_path = extractor.extract(
    "https://example.com",
    "output_directory"
)
```

### 4. Describe Individual Images

```python
from pyvisionai import describe_image_openai

# Using OpenAI's Vision model
description = describe_image_openai(
    "path/to/image.jpg",
    prompt="Describe the main elements in this image"
)

print(description)
```

## Common Use Cases

### 1. Batch Processing Documents

```python
import os
from pyvisionai import create_extractor

def process_directory(input_dir: str, output_dir: str):
    # Create extractors for different file types
    extractors = {
        ".pdf": create_extractor("pdf"),
        ".docx": create_extractor("docx"),
        ".pptx": create_extractor("pptx")
    }

    for filename in os.listdir(input_dir):
        ext = os.path.splitext(filename)[1].lower()
        if ext in extractors:
            input_path = os.path.join(input_dir, filename)
            try:
                output_path = extractors[ext].extract(
                    input_path,
                    output_dir
                )
                print(f"Processed: {filename}")
            except Exception as e:
                print(f"Error processing {filename}: {e}")

# Use the function
process_directory("documents", "extracted_content")
```

### 2. Custom Image Description

```python
from pyvisionai import create_extractor

# Create extractor with custom prompt
extractor = create_extractor(
    "pdf",
    prompt="List all text elements and describe any charts or diagrams"
)

# Process document
output_path = extractor.extract("report.pdf", "output")
```

### 3. Using Local Model for Privacy

```python
# Create extractor using local Llama model
extractor = create_extractor(
    "pdf",
    model="llama",
    prompt="Extract text and describe visual elements"
)

output_path = extractor.extract("confidential.pdf", "output")
```

## Output Format

PyVisionAI generates a markdown file containing:
1. Extracted text
2. Embedded images (if using text_and_images method)
3. Image descriptions
4. Source file metadata

Example output structure:
```markdown
# Document Title

## Page 1
[Extracted text content...]

### Images
<!-- Example image path -->
[Image 1] Path: output_dir/images/page1_image1.png
Description: A bar chart showing sales data for Q1 2024...

## Page 2
[Extracted text content...]
...
```

### Command Line Interface (CLI)

Process any supported file:

```bash
# Process a single file (using default page-as-image method)
file-extract -t pdf -s path/to/file.pdf -o output_dir
file-extract -t docx -s path/to/file.docx -o output_dir
file-extract -t pptx -s path/to/file.pptx -o output_dir
file-extract -t html -s path/to/file.html -o output_dir