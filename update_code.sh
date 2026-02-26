#!/bin/bash
set -e

echo "🔄 Adding changes..."
git add .

read -p "Enter commit message: " msg
git commit -m "$msg"

echo "🚀 Pushing changes..."
git push origin main

echo "✅ Done! Dana done "

