# Usage Guide

## Command Line Interface

### Command Parameters

#### `file-extract` Command
```bash
file-extract [-h] -t TYPE -s SOURCE -o OUTPUT [-e EXTRACTOR] [-m MODEL] [-k API_KEY] [-v]

Required Arguments:
  -t, --type TYPE         File type to process (pdf, docx, pptx, html)
  -s, --source SOURCE     Source file or directory path
  -o, --output OUTPUT     Output directory path

Optional Arguments:
  -h, --help             Show help message and exit
  -e, --extractor TYPE   Extraction method:
                         - page_as_image: Convert pages to images (default)
                         - text_and_images: Extract text and images separately
                         Note: HTML only supports page_as_image
  -m, --model MODEL      Vision model for image description:
                         - gpt4: GPT-4 Vision (default, recommended)
                         - llama: Local Llama model
  -k, --api-key KEY      OpenAI API key (can also be set via OPENAI_API_KEY env var)
  -v, --verbose          Enable verbose logging
  -p, --prompt TEXT      Custom prompt for image description
```

#### `describe-image` Command
```bash
describe-image [-h] -s SOURCE [-m MODEL] [-k API_KEY] [-t MAX_TOKENS] [-v] [-p PROMPT]

Required Arguments:
-s, --source SOURCE    Path to image file

Optional Arguments:
-h, --help            Show help message and exit
-m, --model MODEL     Model to use (gpt4, claude, llama)
-k, --api-key KEY     API key (if not set in environment)
-t, --max-tokens N    Maximum tokens for response
-v, --verbose         Enable verbose output
-p, --prompt TEXT     Custom prompt for image description

Note: For backward compatibility:
- You can also use -i/--image instead of -s/--source
- The -u/--use-case parameter is supported but -m/--model is recommended
```

### Examples

#### File Extraction Examples
```bash
# Basic usage with defaults (page_as_image method, GPT-4 Vision)
file-extract -t pdf -s document.pdf -o output_dir
file-extract -t html -s webpage.html -o output_dir  # HTML always uses page_as_image

# Specify extraction method (not applicable for HTML)
file-extract -t docx -s document.docx -o output_dir -e text_and_images

# Use local Llama model for image description
file-extract -t pptx -s slides.pptx -o output_dir -m llama

# Process all PDFs in a directory with verbose logging
file-extract -t pdf -s input_dir -o output_dir -v

# Use custom OpenAI API key
file-extract -t pdf -s document.pdf -o output_dir -k "your-api-key"

# Use custom prompt for image descriptions
file-extract -t pdf -s document.pdf -o output_dir -p "Focus on text content and layout"
```

#### Image Description Examples
```bash
# Basic usage
describe-image -s photo.jpg

# Using specific model
describe-image -s photo.jpg -m llama

# Custom prompt
describe-image -s photo.jpg -p "List the main colors and their proportions"

# Set token limit
describe-image -s photo.jpg -t 500

# Verbose output
describe-image -s photo.jpg -v

# Custom API key
describe-image -s photo.jpg -k "your-api-key"

# Combined options
describe-image -s photo.jpg -m llama -p "Describe the lighting and shadows" -v
```

## Python Library Usage

```python
from pyvisionai import create_extractor, describe_image_openai, describe_image_ollama

# 1. Extract content from files
extractor = create_extractor("pdf")  # or "docx", "pptx", or "html"
output_path = extractor.extract("input.pdf", "output_dir")

# With specific extraction method
extractor = create_extractor("pdf", extractor_type="text_and_images")
output_path = extractor.extract("input.pdf", "output_dir")

# Extract from HTML (always uses page_as_image method)
extractor = create_extractor("html")
output_path = extractor.extract("page.html", "output_dir")

# 2. Describe images
# Using GPT-4 Vision (default, recommended)
description = describe_image_openai(
    "image.jpg",
    model="gpt-4o-mini",  # default
    api_key="your-api-key",  # optional if set in environment
    max_tokens=300,  # default
    prompt="Describe this image focusing on colors and textures"  # optional custom prompt
)

# Using local Llama model
description = describe_image_ollama(
    "image.jpg",
    model="llama3.2-vision",  # default
    prompt="List the main objects in this image"  # optional custom prompt
)
```

## Custom Prompts

PyVisionAI supports custom prompts for both file extraction and image description:

### Using Custom Prompts

1. **CLI Usage**
   ```bash
   # File extraction with custom prompt
   file-extract -t pdf -s document.pdf -o output_dir -p "Extract all text verbatim and describe any diagrams or images in detail"

   # Image description with custom prompt
   describe-image -s photo.jpg -p "List the main colors and describe the layout of elements"
   ```

2. **Library Usage**
   ```python
   # File extraction with custom prompt
   extractor = create_extractor(
       "pdf",
       extractor_type="page_as_image",
       prompt="Extract all text exactly as it appears and provide detailed descriptions of any charts or diagrams"
   )
   output_path = extractor.extract("input.pdf", "output_dir")

   # Image description with custom prompt
   description = describe_image_openai(
       "image.jpg",
       prompt="Focus on spatial relationships between objects and any text content"
   )
   ```

3. **Environment Variable**
   ```bash
   # Set default prompt via environment variable
   export FILE_EXTRACTOR_PROMPT="Extract text and describe visual elements with emphasis on layout"
   ```

### Writing Effective Prompts

1. **For Page-as-Image Method**
   - Include instructions for both text extraction and visual description
   - Example: "Extract the exact text as it appears on the page and describe any images, diagrams, or visual elements in detail"

2. **For Text-and-Images Method**
   - Focus only on image description since text is extracted separately
   - Example: "Describe the visual content, focusing on what the image represents and any visual elements it contains"

3. **For Image Description**
   - Be specific about what aspects to focus on
   - Example: "Describe the main elements, their arrangement, and any text visible in the image"

## Supported File Types

### PDF Files
- Text extraction
- Image description
- Table recognition
- Layout analysis

### Word Documents (DOCX)
- Text and formatting
- Embedded images
- Tables and lists

### PowerPoint (PPTX)
- Slide content
- Speaker notes
- Embedded media

### HTML Pages
- Text content
- Images
- Dynamic content (with JavaScript rendering)

## Best Practices

1. **Performance Optimization**
   - Process files in batches when possible
   - Use appropriate model for your needs
   - Cache results for frequently accessed documents

2. **Error Handling**
   ```python
   try:
       # Process your document
       extractor = create_extractor("pdf")
       result = extractor.extract("document.pdf", "output_dir")
   except FileNotFoundError:
       print("File not found")
   except PermissionError:
       print("Permission denied")
   except Exception as e:
       print(f"An error occurred: {e}")
   ```

3. **Resource Management**
   ```python
   # Initialize resources properly
   extractor = create_extractor("pdf")
   
   # Use appropriate configuration
   extractor = create_extractor(
       "pdf",
       extractor_type="text_and_images",
       prompt="Extract text and describe visual elements"
   )
   ```

## Examples

### Basic Extraction
```python
from pyvisionai import create_extractor

# PDF extraction with default settings (page_as_image + GPT-4 Vision)
extractor = create_extractor("pdf")
output_path = extractor.extract("input.pdf", "output/pdf")

# DOCX extraction using text_and_images method
extractor = create_extractor("docx", extractor_type="text_and_images")
output_path = extractor.extract("input.docx", "output/docx")

# PPTX extraction with custom prompt
extractor = create_extractor(
    "pptx",
    prompt="List all text content and describe any diagrams or charts"
)
output_path = extractor.extract("input.pptx", "output/pptx")

# HTML extraction (always uses page_as_image)
extractor = create_extractor("html")
output_path = extractor.extract("https://example.com", "output/html")
```

### Specialized Extraction
```python
from pyvisionai import create_extractor, describe_image_openai

# Technical documentation extraction
extractor = create_extractor(
    "pdf",
    prompt=(
        "Extract all code snippets, technical terms, and command examples. "
        "For diagrams, describe the technical architecture and components shown."
    )
)
output_path = extractor.extract("technical_doc.pdf", "output/technical")

# Business report extraction
extractor = create_extractor(
    "pptx",
    prompt=(
        "Extract key business metrics, financial figures, and trends. "
        "For charts, provide detailed analysis of the data presented."
    )
)
output_path = extractor.extract("business_report.pptx", "output/business")

# Image description with custom prompt
description = describe_image_openai(
    "image.jpg",
    prompt="Analyze the chart type, axes labels, and data trends. "
           "Provide key insights and numerical values where visible."
)
```
