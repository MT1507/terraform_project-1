#!/bin/bash

set -e

echo "Choose option:"
echo "1 - Pull latest code"
echo "2 - Push local changes"
read -p "Enter choice: " choice

if [ "$choice" == "1" ]; then
    echo "⬇️ Pulling latest code..."
    git pull origin main
    echo "✅ Pull completed!"
elif [ "$choice" == "2" ]; then
    echo "🔄 Adding changes..."
    git add .
    read -p "Enter commit message: " msg
    git commit -m "$msg"
    echo "🚀 Pushing to GitHub..."
    git push origin main
    echo "✅ Push completed!"
else
    echo "❌ Invalid option"
fi
