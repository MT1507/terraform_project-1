#!/bin/bash

set -e

BRANCH="main"

echo "Choose option:"
echo "1 - Pull latest code"
echo "2 - Push local changes"
read -p "Enter choice: " choice

msg="v:$(date +"%Y-%m-%d_%H-%M-%S") by $(whoami)"
echo "Commit version will be: $msg"

if [ "$choice" == "1" ]; then
    echo "⬇️ Pulling latest code..."
    git pull --rebase origin $BRANCH
    echo "✅ Pull completed!"

elif [ "$choice" == "2" ]; then
    echo "⬇️ Syncing with remote..."
    git pull --rebase origin $BRANCH

    echo "🔄 Adding changes..."
    git add .

    if git diff --cached --quiet; then
        echo "⚠️ No changes to commit."
        exit 0
    fi

    git commit -m "$msg"

    echo "🚀 Pushing to GitHub..."
    git push origin $BRANCH
    echo "✅ Push completed!"

else
    echo "❌ Invalid option, Mangesh"
fi
