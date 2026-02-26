#!/bin/bash
set -e

echo "⬇️ Pulling latest changes..."
git pull origin main

echo "🔄 Adding changes..."
git add .

read -p "Enter commit message: " msg
git commit -m "$msg"

echo "🚀 Pushing changes..."
git push origin main

echo "✅ Done!"




