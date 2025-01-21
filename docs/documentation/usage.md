# Usage Guide

## Command Line Interface

### Basic Commands

Process any supported document:
```bash
pyvisionai process <file_path>
```

### Advanced Options

```bash
# Process with specific VLM model
pyvisionai process --model gpt4-vision <file_path>

# Save output to specific format
pyvisionai process --output markdown <file_path>

# Process multiple files
pyvisionai process file1.pdf file2.docx file3.pptx

# Process with custom configuration
pyvisionai process --config config.yaml <file_path>
```

## Python Library Usage

### Basic Document Processing

```python
from pyvisionai import process_document

# Process a single document
result = process_document("document.pdf")
print(result.content)

# Process with specific model
result = process_document("document.pdf", model="gpt4-vision")

# Access different parts of the result
print(result.text)  # Extracted text
print(result.descriptions)  # Generated descriptions
print(result.metadata)  # Document metadata
```

### Batch Processing

```python
from pyvisionai import batch_process

# Process multiple documents
files = ["doc1.pdf", "doc2.docx", "doc3.pptx"]
results = batch_process(files)

for result in results:
    print(f"File: {result.filename}")
    print(f"Content: {result.content}")
```

### Custom Configuration

```python
from pyvisionai import Config, process_document

# Create custom configuration
config = Config(
    model="gpt4-vision",
    output_format="markdown",
    include_metadata=True,
    max_tokens=1000
)

# Process with custom config
result = process_document("document.pdf", config=config)
```

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
   from pyvisionai import process_document, PyVisionAIError
   
   try:
       result = process_document("document.pdf")
   except PyVisionAIError as e:
       print(f"Error processing document: {e}")
   ```

3. **Resource Management**
   ```python
   from pyvisionai import PyVisionAI
   
   with PyVisionAI() as processor:
       result = processor.process("document.pdf")
   ```

## Examples

### Extract Text with Layout Preservation
```python
from pyvisionai import process_document

result = process_document(
    "document.pdf",
    preserve_layout=True,
    include_formatting=True
)
```

### Generate Image Descriptions
```python
from pyvisionai import process_images

result = process_images(
    "document.pdf",
    description_style="detailed",
    max_images=10
)
```

### Export to Different Formats
```python
from pyvisionai import process_document

# Export to Markdown
result = process_document("document.pdf", output="markdown")

# Export to JSON
result = process_document("document.pdf", output="json")

# Export to HTML
result = process_document("document.pdf", output="html")
```
