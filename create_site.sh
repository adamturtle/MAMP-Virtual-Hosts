#!/bin/bash

# Allow backspace
stty erase ^H

# Ask for site name
echo "Enter the site name (eg Test Site):";
read projectName;

# Ask for document root
echo "Enter the document root (relative to 'htdocs'):";
read documentRoot;

# Ask for domain name
echo "Enter local domain: (eg. local.test.com)";
read domain;

# Add vhost
echo "

# $projectName
<VirtualHost *:80>
DocumentRoot /Applications/MAMP/htdocs/$documentRoot
ServerName $domain
</VirtualHost>" >> /Applications/MAMP/conf/apache/httpd-vhosts.conf;
echo "
127.0.0.1	$domain" >> /etc/hosts;
	
# Restart MAMP
/Applications/MAMP/Library/bin/apachectl restart;

echo "Added virtual host!";