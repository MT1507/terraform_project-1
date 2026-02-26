#!/bin/bash

## this is script for installing ngnix 

echo "welcome to ngnix"

sudo apt update -y
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo systemctl status nginx


echo "Creating file..."

cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Mangesh DevOps Server</title>
</head>
<body style="background-color: black; color: white; text-align: center;">
    <h1>🚀 Welcome to Mangesh EC2 Nginx Server</h1>
    <p>Server is running successfully!</p>
</body>
</html>

EOF

echo "File created successfully"
