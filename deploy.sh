#!/bin/bash

# Exit on error
set -e

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "❌ AWS CLI is not installed. Please install it first."
    exit 1
fi

# Check if we're logged into AWS
if ! aws sts get-caller-identity &> /dev/null; then
    echo "❌ Not logged into AWS. Please configure AWS credentials."
    exit 1
fi

# Check if mkdocs is installed
if ! command -v mkdocs &> /dev/null; then
    echo "❌ mkdocs is not installed. Please install it first."
    exit 1
fi

echo "🔍 Running pre-flight checks..."
# Test S3 bucket access
if ! aws s3 ls s3://pyvisionai.com &> /dev/null; then
    echo "❌ Cannot access S3 bucket pyvisionai.com"
    exit 1
fi

# Test CloudFront distribution access
if ! aws cloudfront get-distribution --id E1W63AHMR2E53P &> /dev/null; then
    echo "❌ Cannot access CloudFront distribution"
    exit 1
fi

echo "🏗️  Building site..."
if ! mkdocs build; then
    echo "❌ Site build failed"
    exit 1
fi

# Check if build generated files
if [ ! -d "site" ] || [ -z "$(ls -A site)" ]; then
    echo "❌ Build directory is empty"
    exit 1
fi

echo "📂 Syncing to S3..."
if ! aws s3 sync site/ s3://pyvisionai.com --delete; then
    echo "❌ S3 sync failed"
    exit 1
fi

echo "🔄 Invalidating CloudFront cache..."
if ! aws cloudfront create-invalidation --distribution-id E1W63AHMR2E53P --paths "/*"; then
    echo "❌ CloudFront invalidation failed"
    exit 1
fi

# Verify the site is accessible
echo "🌐 Verifying site accessibility..."
if ! curl -s -f -o /dev/null https://pyvisionai.com; then
    echo "⚠️  Warning: Site is not accessible at https://pyvisionai.com"
    echo "Please check manually in a few minutes."
else
    echo "✅ Site is accessible at https://pyvisionai.com"
fi

echo "✅ Deployment complete!" 