# Nginx Reverse Proxy Setup Guide

This guide explains how to set up, configure, and troubleshoot Nginx as a reverse proxy for the Java Web App Demo running on Apache Tomcat.

## Table of Contents

- [Overview](#overview)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Running Nginx](#running-nginx)
- [Testing & Verification](#testing--verification)
- [Troubleshooting](#troubleshooting)
- [Useful Commands](#useful-commands)
- [Advanced Features](#advanced-features)

---

## Overview

### Architecture

```
Client (Browser) → Nginx (Port 80) → Tomcat (Port 8080) → Java Web App
```

### Benefits

- **Performance**: Nginx efficiently handles static content and connection pooling
- **Security**: Hide Tomcat behind Nginx, only expose ports 80/443
- **Flexibility**: Easy to add SSL, load balancing, caching, and content injection
- **Scalability**: Can proxy to multiple Tomcat instances
- **Better logging**: Centralized access logs through Nginx

---

## Prerequisites

Before you begin, ensure you have:

- **Homebrew** installed (macOS package manager)
- **Apache Tomcat** installed and running
  - Check: `brew services list | grep tomcat`
  - Install if needed: `brew install tomcat`
- **Java Web App** deployed to Tomcat
  - WAR file in: `/opt/homebrew/opt/tomcat/libexec/webapps/`

---

## Installation

### 1. Install Nginx via Homebrew

```bash
# Install Nginx
brew install nginx

# Verify installation
nginx -v
# Expected output: nginx version: nginx/x.x.x
```

### 2. Check Installation Paths

After installation, note these important directories:

```bash
# Configuration directory
/opt/homebrew/etc/nginx/

# Main configuration file
/opt/homebrew/etc/nginx/nginx.conf

# Custom server configurations
/opt/homebrew/etc/nginx/servers/

# Log files
/opt/homebrew/var/log/nginx/

# HTML root (default web root)
/opt/homebrew/var/www/
```

---

## Configuration

### 1. Review Main Configuration

The main Nginx configuration file is located at:
```
/opt/homebrew/etc/nginx/nginx.conf
```

**Important**: Ensure the default server block is not conflicting with Tomcat:

```nginx
# Check line ~36 in nginx.conf
# Should NOT use port 8080 (Tomcat's port)
server {
    listen       8080;  # ❌ This conflicts with Tomcat!
    # ...
}
```

**Fix**: Comment out or change the port:
```nginx
# Commented out to avoid conflict with Tomcat
#server {
#    listen       8080;
#    server_name  localhost;
#    # ...
#}
```

### 2. Create Custom Configuration for Java Web App

Create a new configuration file:

```bash
# Create/edit the configuration file
nano /opt/homebrew/etc/nginx/servers/java-web-app-demo-nginx.conf
```

Add the following configuration:

```nginx
server {
    listen 80;
    server_name localhost;

    # Logging
    access_log /opt/homebrew/var/log/nginx/java-web-app-access.log;
    error_log /opt/homebrew/var/log/nginx/java-web-app-error.log;

    # Root location - proxy to Tomcat
    location /java-web-app-demo/ {
        proxy_pass http://localhost:8080/java-web-app-demo/;

        # Proxy headers
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;

        # Timeout settings
        proxy_connect_timeout 60s;
        proxy_send_timeout 60s;
        proxy_read_timeout 60s;

        # WebSocket support
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";

        # IMPORTANT: Disable compression for sub_filter to work
        proxy_set_header Accept-Encoding "";

        # Inject JavaScript into <head> section (Katalon tracking)
        sub_filter '</head>' '<script defer async client-code="KA-743630-03" src="https://static.katalon.com/libs/traffic-agent/v1/traffic-agent.min.js"></script></head>';
        sub_filter_once on;
    }

    # Static content - optimized caching
    location ~ ^/java-web-app-demo/(css|js|images)/ {
        proxy_pass http://localhost:8080;
        proxy_cache_valid 200 1d;
        expires 1d;
        add_header Cache-Control "public, immutable";
    }

    # Health check endpoint
    location /health {
        access_log off;
        return 200 "healthy\n";
        add_header Content-Type text/plain;
    }
}
```

### 3. Test Configuration

Always test your configuration before applying:

```bash
# Test syntax
nginx -t

# Expected output:
# nginx: the configuration file /opt/homebrew/etc/nginx/nginx.conf syntax is ok
# nginx: configuration file /opt/homebrew/etc/nginx/nginx.conf test is successful
```

---

## Running Nginx

### Option 1: Run as Background Service (Recommended)

```bash
# Start Nginx (starts now and on system boot)
brew services start nginx

# Stop Nginx
brew services stop nginx

# Restart Nginx (useful after config changes)
brew services restart nginx

# Check status
brew services list | grep nginx
```

### Option 2: Run Manually (Foreground)

```bash
# Start Nginx in foreground
nginx

# Stop Nginx
nginx -s stop

# Graceful shutdown (wait for active connections)
nginx -s quit

# Reload configuration without downtime
nginx -s reload
```

### Starting Both Services

Ensure both Tomcat and Nginx are running:

```bash
# Start Tomcat
brew services start tomcat

# Start Nginx
brew services start nginx

# Verify both are running
brew services list | grep -E 'tomcat|nginx'
```

---

## Testing & Verification

### 1. Check Services Status

```bash
# Check if services are running
brew services list | grep -E 'tomcat|nginx'

# Expected output:
# nginx   started thinh.nguyen ~/Library/LaunchAgents/homebrew.mxcl.nginx.plist
# tomcat  started thinh.nguyen ~/Library/LaunchAgents/homebrew.mxcl.tomcat.plist
```

### 2. Check Port Binding

```bash
# Check if Nginx is listening on port 80
lsof -i :80

# Check if Tomcat is listening on port 8080
lsof -i :8080
```

### 3. Test Application Access

```bash
# Test via Nginx (port 80)
curl -I http://localhost/java-web-app-demo/

# Test direct Tomcat access (port 8080)
curl -I http://localhost:8080/java-web-app-demo/

# Check if script injection is working
curl -s http://localhost/java-web-app-demo/ | grep -A 2 "katalon"
```

### 4. Verify in Browser

1. Open browser to: **http://localhost/java-web-app-demo/**
2. Right-click → **View Page Source** (or `Cmd+U`)
3. Look for the Katalon script in the `<head>` section:
   ```html
   <script defer async client-code="KA-743630-03" src="https://static.katalon.com/libs/traffic-agent/v1/traffic-agent.min.js"></script>
   ```

### 5. Check Browser Network Tab

1. Open Developer Tools (`F12` or `Cmd+Option+I`)
2. Go to **Network** tab
3. Reload the page
4. Verify request to `traffic-agent.min.js` returns `200 OK`

---

## Troubleshooting

### Common Issues

#### 1. Port Conflict Error

**Error:**
```
[emerg] bind() to 0.0.0.0:8080 failed (48: Address already in use)
```

**Cause**: Nginx configuration is trying to use port 8080, which Tomcat is using.

**Solution**:
```bash
# Check nginx.conf for port 8080
grep -n "listen.*8080" /opt/homebrew/etc/nginx/nginx.conf

# Comment out the conflicting server block
nano /opt/homebrew/etc/nginx/nginx.conf

# Test and restart
nginx -t && brew services restart nginx
```

#### 2. Bootstrap Failed Error

**Error:**
```
Bootstrap failed: 5: Input/output error
Error: Failure while executing; `/bin/launchctl bootstrap...`
```

**Cause**: Stale launchd service or previous Nginx process still running.

**Solution**:
```bash
# Stop the service
brew services stop nginx

# Kill any remaining Nginx processes
pkill nginx

# Start again
brew services start nginx

# Verify
brew services list | grep nginx
```

#### 3. 502 Bad Gateway Error

**Cause**: Tomcat is not running or not accessible.

**Solution**:
```bash
# Check if Tomcat is running
brew services list | grep tomcat

# Start Tomcat if needed
brew services start tomcat

# Verify Tomcat is listening
lsof -i :8080

# Check Tomcat logs
tail -f /opt/homebrew/opt/tomcat/libexec/logs/catalina.out
```

#### 4. 404 Not Found Error

**Cause**: Incorrect proxy path or application not deployed.

**Solution**:
```bash
# Verify WAR file is deployed
ls -la /opt/homebrew/opt/tomcat/libexec/webapps/ | grep java-web-app

# Check if Tomcat extracted the WAR
ls -la /opt/homebrew/opt/tomcat/libexec/webapps/java-web-app-demo/

# Test direct Tomcat access
curl -I http://localhost:8080/java-web-app-demo/
```

#### 5. Permission Denied Errors

**Cause**: Nginx doesn't have permission to bind to port 80 (on some systems).

**Solution**:
```bash
# Check error logs
tail -f /opt/homebrew/var/log/nginx/error.log

# On macOS with Homebrew, this is usually not an issue
# If needed, run with sudo (not recommended for production)
sudo nginx
```

#### 6. Configuration Test Warnings

**Warning:**
```
nginx: [warn] duplicate MIME type "text/html"
```

**Cause**: `sub_filter_types text/html;` is redundant (text/html is default).

**Solution**:
```bash
# Remove the line from your config
# Change from:
sub_filter_types text/html;

# To: (just remove it)
# sub_filter_types text/html;
```

#### 7. Script Not Being Injected

**Cause**: Content is compressed or sub_filter not working.

**Solution**:
Ensure these lines are in your location block:
```nginx
# Disable compression from backend
proxy_set_header Accept-Encoding "";

# Sub_filter directive
sub_filter '</head>' '<script...></script></head>';
sub_filter_once on;
```

---

## Useful Commands

### Service Management

```bash
# Start Nginx
brew services start nginx

# Stop Nginx
brew services stop nginx

# Restart Nginx
brew services restart nginx

# Reload configuration (no downtime)
nginx -s reload

# Test configuration
nginx -t
```

### Log Management

```bash
# View access log (real-time)
tail -f /opt/homebrew/var/log/nginx/java-web-app-access.log

# View error log (real-time)
tail -f /opt/homebrew/var/log/nginx/java-web-app-error.log

# View last 100 lines of access log
tail -100 /opt/homebrew/var/log/nginx/java-web-app-access.log

# Search for errors
grep -i error /opt/homebrew/var/log/nginx/java-web-app-error.log
```

### Process Management

```bash
# Check if Nginx is running
ps aux | grep nginx | grep -v grep

# Find process using port 80
lsof -i :80

# Kill all Nginx processes (if needed)
pkill nginx

# Graceful shutdown
nginx -s quit
```

### Configuration Management

```bash
# Edit main configuration
nano /opt/homebrew/etc/nginx/nginx.conf

# Edit app-specific configuration
nano /opt/homebrew/etc/nginx/servers/java-web-app-demo-nginx.conf

# Test configuration
nginx -t

# View current configuration
nginx -T

# Reload after changes
nginx -s reload
```

### Debugging

```bash
# Test endpoint with curl
curl -v http://localhost/java-web-app-demo/

# Check response headers
curl -I http://localhost/java-web-app-demo/

# Check if script is injected
curl -s http://localhost/java-web-app-demo/ | grep katalon

# Follow all logs
tail -f /opt/homebrew/var/log/nginx/*.log

# Check Nginx version and modules
nginx -V
```

---

## Advanced Features

### 1. Load Balancing

To distribute traffic across multiple Tomcat instances:

```nginx
upstream tomcat_backend {
    server localhost:8080 weight=3;
    server localhost:8081 weight=2;
    server localhost:8082 weight=1;

    # Health check
    keepalive 32;
}

server {
    listen 80;
    server_name localhost;

    location /java-web-app-demo/ {
        proxy_pass http://tomcat_backend/java-web-app-demo/;
        # ... other proxy settings
    }
}
```

### 2. SSL/HTTPS Configuration

To enable HTTPS:

```nginx
server {
    listen 443 ssl http2;
    server_name yourdomain.com;

    ssl_certificate /path/to/certificate.crt;
    ssl_certificate_key /path/to/private.key;

    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers HIGH:!aNULL:!MD5;
    ssl_prefer_server_ciphers on;

    location /java-web-app-demo/ {
        proxy_pass http://localhost:8080/java-web-app-demo/;
        # ... other proxy settings
    }
}

# Redirect HTTP to HTTPS
server {
    listen 80;
    server_name yourdomain.com;
    return 301 https://$server_name$request_uri;
}
```

### 3. Caching

To improve performance with caching:

```nginx
# Define cache path (add to http block in nginx.conf)
proxy_cache_path /opt/homebrew/var/cache/nginx levels=1:2 keys_zone=app_cache:10m max_size=1g inactive=60m;

server {
    listen 80;
    server_name localhost;

    location /java-web-app-demo/static/ {
        proxy_pass http://localhost:8080/java-web-app-demo/static/;
        proxy_cache app_cache;
        proxy_cache_valid 200 1d;
        proxy_cache_key "$scheme$request_method$host$request_uri";
        add_header X-Cache-Status $upstream_cache_status;
    }
}
```

### 4. Rate Limiting

To prevent abuse:

```nginx
# Define rate limit zone (add to http block)
limit_req_zone $binary_remote_addr zone=app_limit:10m rate=10r/s;

server {
    listen 80;
    server_name localhost;

    location /java-web-app-demo/ {
        limit_req zone=app_limit burst=20 nodelay;
        proxy_pass http://localhost:8080/java-web-app-demo/;
        # ... other proxy settings
    }
}
```

### 5. Custom Error Pages

```nginx
server {
    listen 80;
    server_name localhost;

    error_page 502 503 504 /50x.html;
    location = /50x.html {
        root /opt/homebrew/var/www;
    }

    error_page 404 /404.html;
    location = /404.html {
        root /opt/homebrew/var/www;
    }
}
```

---

## Performance Tuning

### Optimize nginx.conf

```nginx
# Worker processes (set to number of CPU cores)
worker_processes auto;

events {
    worker_connections 1024;
    use kqueue;  # macOS optimization
}

http {
    # Gzip compression
    gzip on;
    gzip_vary on;
    gzip_min_length 1024;
    gzip_types text/plain text/css application/json application/javascript text/xml application/xml;

    # Keep-alive
    keepalive_timeout 65;
    keepalive_requests 100;

    # Buffer sizes
    client_body_buffer_size 10K;
    client_header_buffer_size 1k;
    client_max_body_size 8m;
    large_client_header_buffers 2 1k;

    # Timeouts
    client_body_timeout 12;
    client_header_timeout 12;
    send_timeout 10;
}
```

---

## Security Best Practices

1. **Hide Nginx Version**
   ```nginx
   http {
       server_tokens off;
   }
   ```

2. **Limit Request Methods**
   ```nginx
   if ($request_method !~ ^(GET|HEAD|POST)$ ) {
       return 444;
   }
   ```

3. **Block User Agents**
   ```nginx
   if ($http_user_agent ~* (bot|crawler|scanner)) {
       return 403;
   }
   ```

4. **Add Security Headers**
   ```nginx
   add_header X-Frame-Options "SAMEORIGIN" always;
   add_header X-Content-Type-Options "nosniff" always;
   add_header X-XSS-Protection "1; mode=block" always;
   add_header Referrer-Policy "no-referrer-when-downgrade" always;
   ```

---

## Additional Resources

- **Nginx Documentation**: https://nginx.org/en/docs/
- **Homebrew Nginx**: `brew info nginx`
- **Tomcat Documentation**: https://tomcat.apache.org/tomcat-11.0-doc/

---

## Summary

You now have Nginx configured as a reverse proxy for your Java Web Application with:

- Nginx listening on **port 80**
- Tomcat running on **port 8080** (backend)
- Automatic JavaScript injection via `sub_filter`
- Optimized static content delivery
- Comprehensive logging
- Health check endpoint

Access your application at: **http://localhost/java-web-app-demo/**

For issues or questions, check the troubleshooting section or review the logs.

---

**Last Updated**: 2025-11-22
