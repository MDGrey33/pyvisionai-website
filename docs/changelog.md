# Changelog

All notable changes to PyVisionAI will be documented here. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [0.2.7] - 2024-03-22

### Added
- Added retry mechanism for handling transient failures:
  - Implemented RetryManager with configurable strategies
  - Added support for exponential, linear, and constant backoff
  - Added comprehensive logging for retry attempts
  - Added proper error handling and delay management

### Changed
- Improved error handling in model selection:
  - Enhanced connection error handling for API calls
  - Added graceful fallback when default model is unavailable
  - Improved error messages with detailed failure context
- Enhanced test coverage:
  - Added tests for retry mechanism with various strategies
  - Added tests for model fallback scenarios
  - Added mocked API tests for connection failures

### Fixed
- Fixed model selection to properly handle connection failures
- Fixed retry delays to prevent excessive wait times
- Fixed logging to capture all retry and fallback attempts

## [0.2.6] - 2024-01-25

### Added
- Implemented Model Factory pattern for vision models:
  - Added VisionModel base class with abstract methods
  - Added ModelFactory for centralized model management
  - Added concrete implementations for GPT4 and Llama models
  - Added comprehensive logging for model lifecycle
  - Added configuration validation for each model type

### Changed
- Refactored model initialization to use factory pattern
- Improved error handling in model creation and validation
- Standardized model interface across all implementations
- Enhanced logging with model-specific context

### Documentation
- Added docstrings for new model classes
- Updated logging documentation
- Added model factory usage examples

## [0.2.5] - 2024-01-21

### Added
- Implemented comprehensive logging across all extractors:
  - Added structured logging for PDF processing stages
  - Added progress tracking for DOCX file conversions
  - Added detailed logging for PPTX slide extraction
  - Added HTML processing status logging

### Changed
- Standardized logging patterns across all extractors
- Replaced print statements with proper logger calls
- Added logging initialization in all core modules
- Standardized log message format and levels

### Improved
- Enhanced benchmark testing reliability
- Added performance metrics logging
- Improved test independence from environment

## [0.2.4] - 2024-03-21

### Changed
- Implemented parallel processing for DOCX extraction
- Added concurrent processing of paragraphs and images
- Improved performance through ThreadPoolExecutor
- ~72% reduction in processing time (189s → 53s)

## [0.2.3] - 2024-03-20

### Changed
- Implemented parallel processing for PDF extraction
- Improved performance by ~68% (4min → 1.3min on 27-page PDF)

## [0.2.2] - 2024-03-20

### Added
- Support for custom prompts in image description
- Added support for custom prompts in file extraction

## [0.2.1] - 2024-03-19

### Added
- Support for HTML file extraction using Playwright
- Capability to handle interactive HTML pages
- HTML to image conversion for consistent results

## [0.2.0] - 2024-01-07

### Fixed
- Fixed PDF image extraction black image issue ([#11](https://github.com/MDGrey33/pyvisionai/issues/11))
- Added proper color space handling
- Improved error handling and logging

### Changed
- Improved image extraction reliability
- Implemented parallel processing
- Enhanced error reporting
- Updated documentation

## [0.1.1] - 2024-01-07

### Added
- Initial release with PDF, DOCX, and PPTX support
- Text and image extraction capabilities
- Image description using Vision LLMs
- Command-line interface 