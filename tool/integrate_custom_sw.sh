#!/bin/bash

# Flutter Conf Web - Custom Service Worker Integration Script
#
# This script builds Flutter Web and integrates the custom service worker
# for better caching and offline support.
#
# Usage:
#   ./tool/integrate_custom_sw.sh [build|serve]
#
# Commands:
#   build  - Build and integrate custom SW (default)
#   serve  - Build, integrate, and serve locally

set -e  # Exit on error

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "🚀 Flutter Conf Web - Build Script"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Change to project root
cd "$PROJECT_ROOT"

# Build Flutter Web
echo "📦 Building Flutter Web (release mode)..."
flutter build web --release --dart-define-from-file=keys.json

if [ $? -ne 0 ]; then
  echo "❌ Flutter build failed"
  exit 1
fi

echo "✅ Flutter build successful"
echo ""

# Backup original service worker
echo "💾 Backing up original service worker..."
cp build/web/flutter_service_worker.js build/web/flutter_service_worker.original.js

# Integrate custom service worker
echo "🔧 Integrating custom service worker..."
cp web/flutter_service_worker_config.js build/web/flutter_service_worker.js

echo "✅ Custom service worker integrated"
echo ""

# Copy sitemap
echo "🗺️  Copying sitemap..."
cp web/sitemap.xml build/web/sitemap.xml
echo "✅ Sitemap copied"
echo ""

# If 'serve' argument is provided, start local server
if [ "$1" == "serve" ]; then
  echo "🌐 Starting local server on http://localhost:8080"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "Press Ctrl+C to stop"
  echo ""

  # Check if Python 3 is available
  if command -v python3 &> /dev/null; then
    python3 -m http.server 8080 --directory build/web
  elif command -v python &> /dev/null; then
    python -m http.server 8080 --directory build/web
  else
    echo "❌ Python not found. Please install Python to use 'serve' mode."
    echo "Or use any other static file server:"
    echo "  npx serve build/web"
    exit 1
  fi
else
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
  echo "✅ Build complete!"
  echo ""
  echo "To test locally:"
  echo "  ./tool/integrate_custom_sw.sh serve"
  echo ""
  echo "To deploy:"
  echo "  Deploy the build/web directory to your hosting provider"
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
fi
