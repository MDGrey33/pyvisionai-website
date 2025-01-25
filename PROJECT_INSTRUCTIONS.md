# PyVisionAI Website Project Instructions

## Project Overview
- **Website Type**: Technical Documentation
- **Framework**: MkDocs with Material theme
- **Hosting**: AWS S3 + CloudFront
- **Domain**: pyvisionai.com

## Project Structure
```
pyvisionai-website/
├── docs/               # Documentation source files
│   ├── index.md       # Homepage
│   ├── documentation/ # Technical docs
│   ├── community.md   # Community info
│   ├── resources.md   # Resources
│   └── contact.md     # Contact information
├── mkdocs.yml         # MkDocs configuration
└── deploy.sh          # Deployment script
```

## Important Notes
1. **DO NOT**:
   - Add non-existent emails
   - Add non-existent links
   - Modify CloudFront settings without testing
   - Always check the @web for links before adding them

2. **Always**:
   - Test locally with `mkdocs serve` before deployment
   - Use the deployment script for consistency
   - Verify site accessibility after deployment

## Common Tasks

### Adding New Documentation
1. Create new .md file in appropriate docs/ subdirectory
2. Update mkdocs.yml navigation if needed
3. Test locally
4. Deploy using deploy.sh

### Updating Contact Methods
- Use Discord as primary community channel
- Direct enterprise inquiries to calendar booking
- Maintain GitHub as main technical hub

### Deployment Checklist
1. Run local server: `mkdocs serve`
2. Check for warnings/errors
3. Run deployment script: `./deploy.sh`
4. Verify site accessibility

## Troubleshooting
1. **Build Warnings**:
   - Check mkdocs.yml for valid configuration
   - Verify file paths and links

2. **Deployment Issues**:
   - Verify AWS credentials
   - Check S3 bucket permissions
   - Confirm CloudFront distribution status

3. **Content Updates**:
   - Always invalidate cache after updates
   - Wait a few minutes for CloudFront propagation


## Contact
For any questions about the website infrastructure or deployment, contact Roland Abou Younes via:
- GitHub: @MDGrey33
- Calendar: https://calendar.app.google/FxCP2W8XMQnNyich8 