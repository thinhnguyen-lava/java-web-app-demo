#!/bin/bash

# Java Web App Demo - Build and Deploy Script
# This script cleans, rebuilds, and deploys the application to Tomcat

echo "========================================="
echo "Java Web App Demo - Build & Deploy"
echo "========================================="
echo ""

# Set colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
PROJECT_DIR="/Users/thinh.nguyen/Projects/java-web-app-demo"
TOMCAT_WEBAPPS="/opt/homebrew/opt/tomcat/libexec/webapps"
TOMCAT_BIN="/opt/homebrew/opt/tomcat/bin/catalina"
WAR_FILE="java-web-app-demo.war"

# Step 1: Clean and Build
echo -e "${BLUE}[1/4] Cleaning and building project...${NC}"
cd "$PROJECT_DIR" || exit 1

mvn clean package

if [ $? -ne 0 ]; then
    echo -e "${RED}Build failed! Please check the errors above.${NC}"
    exit 1
fi

echo -e "${GREEN}Build successful!${NC}"
echo ""

# Step 2: Stop existing Tomcat if running
echo -e "${BLUE}[2/4] Checking for running Tomcat instance...${NC}"
TOMCAT_PID=$(lsof -ti :8080)

if [ ! -z "$TOMCAT_PID" ]; then
    echo -e "${YELLOW}Tomcat is running on port 8080 (PID: $TOMCAT_PID)${NC}"
    echo "Stopping Tomcat..."
    kill $TOMCAT_PID
    sleep 2
    echo -e "${GREEN}Tomcat stopped.${NC}"
else
    echo "No Tomcat instance running on port 8080."
fi
echo ""

# Step 3: Deploy WAR file
echo -e "${BLUE}[3/4] Deploying application to Tomcat...${NC}"

# Remove old deployment
if [ -d "$TOMCAT_WEBAPPS/java-web-app-demo" ]; then
    echo "Removing old deployment directory..."
    rm -rf "$TOMCAT_WEBAPPS/java-web-app-demo"
fi

if [ -f "$TOMCAT_WEBAPPS/$WAR_FILE" ]; then
    echo "Removing old WAR file..."
    rm -f "$TOMCAT_WEBAPPS/$WAR_FILE"
fi

# Copy new WAR file
echo "Copying new WAR file to Tomcat webapps..."
cp "$PROJECT_DIR/target/$WAR_FILE" "$TOMCAT_WEBAPPS/"

if [ $? -ne 0 ]; then
    echo -e "${RED}Failed to copy WAR file!${NC}"
    exit 1
fi

echo -e "${GREEN}WAR file deployed successfully!${NC}"
echo ""

# Step 4: Start Tomcat
echo -e "${BLUE}[4/4] Starting Tomcat...${NC}"
echo -e "${YELLOW}Tomcat will start in the foreground. Press Ctrl+C to stop.${NC}"
echo ""
echo -e "${GREEN}Access your application at: http://localhost:8080/java-web-app-demo/${NC}"
echo ""
echo "========================================="
echo ""

# Start Tomcat
$TOMCAT_BIN run
