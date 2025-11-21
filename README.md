# Java Web Application Demo

A demonstration Java web application showcasing various web UI components built with JSP/Servlets and Bootstrap 5, deployable on Apache Tomcat.

## Features

This demo application includes:

### UI Components Demonstrated
- **Text Input Fields**: Text, Email, Password, Number, Tel, Date, URL
- **Dropdown Menus**: Country and Occupation selectors
- **Radio Buttons**: Gender and Experience Level selection
- **Checkboxes**: Multiple Programming Languages selection
- **Toggle Switches**: Newsletter, Notifications, Dark Mode preferences
- **Range Slider**: Satisfaction level (1-10)
- **Text Area**: Comments section with character counter
- **File Upload**: Resume/CV upload field
- **Color Picker**: Favorite color selection
- **Buttons**: Submit and Reset buttons

### Technical Features
- Server-side validation in Java Servlet
- Client-side validation with JavaScript
- Responsive design with Bootstrap 5
- Form data processing and display
- Clean, modern UI with custom CSS
- Interactive elements with real-time feedback

## Prerequisites

Before you begin, ensure you have the following installed:

- **Java Development Kit (JDK)**: Version 11 or higher
  - Check: `java -version`
- **Apache Maven**: Version 3.6 or higher
  - Check: `mvn -version`
- **Apache Tomcat**: Version 9.x or 10.x
  - Download from: https://tomcat.apache.org/

## Project Structure

```
java-web-app-demo/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/example/demo/servlets/
│       │       └── FormServlet.java          # Handles form submission
│       └── webapp/
│           ├── WEB-INF/
│           │   └── web.xml                   # Web application configuration
│           ├── css/
│           │   └── style.css                 # Custom styles
│           ├── js/
│           │   └── script.js                 # Client-side JavaScript
│           ├── index.jsp                     # Main form page
│           └── result.jsp                    # Results display page
├── pom.xml                                   # Maven configuration
└── README.md                                 # This file
```

## Building the Application

### Option 1: Build WAR file with Maven

```bash
# Navigate to project directory
cd java-web-app-demo

# Clean and build the project
mvn clean package

# The WAR file will be created at: target/java-web-app-demo.war
```

### Option 2: Quick Build

```bash
# One-line build command
mvn clean package -DskipTests
```

## Deploying to Apache Tomcat

### Method 1: Manual Deployment (Recommended for Demo)

1. **Build the WAR file** (see above)

2. **Locate your Tomcat installation**
   - Example: `/opt/tomcat/` or `C:\Program Files\Apache\Tomcat`

3. **Copy WAR file to Tomcat webapps directory**
   ```bash
   cp target/java-web-app-demo.war /path/to/tomcat/webapps/
   ```

4. **Start Tomcat**
   ```bash
   # Linux/Mac
   /path/to/tomcat/bin/startup.sh

   # Windows
   C:\path\to\tomcat\bin\startup.bat
   ```

5. **Access the application**
   - Open browser: http://localhost:8080/java-web-app-demo/
   - The application should load the main form page

### Method 2: Using Tomcat Manager (Web Interface)

1. **Access Tomcat Manager**
   - Navigate to: http://localhost:8080/manager/html
   - Login with Tomcat credentials (configured in `tomcat-users.xml`)

2. **Deploy WAR file**
   - Scroll to "WAR file to deploy"
   - Click "Choose File" and select `target/java-web-app-demo.war`
   - Click "Deploy"

3. **Access the application**
   - Click on `/java-web-app-demo` in the applications list

### Method 3: Maven Tomcat Plugin (Development)

Add this plugin to your `pom.xml`:

```xml
<plugin>
    <groupId>org.apache.tomcat.maven</groupId>
    <artifactId>tomcat7-maven-plugin</artifactId>
    <version>2.2</version>
    <configuration>
        <url>http://localhost:8080/manager/text</url>
        <server>TomcatServer</server>
        <path>/java-web-app-demo</path>
    </configuration>
</plugin>
```

Then deploy with:
```bash
mvn tomcat7:deploy
```

## Accessing the Application

Once deployed, access the application at:

- **Main Form Page**: http://localhost:8080/java-web-app-demo/
- **Direct to index**: http://localhost:8080/java-web-app-demo/index.jsp

**Note**: If Tomcat is running on a different port, replace `8080` with your configured port.

## Using the Application

1. **Fill out the form** with various input fields
2. **Click Submit** to process the form
3. **View results** on the results page showing all submitted data
4. **Click "Back to Form"** to submit again with different data

## Stopping Tomcat

```bash
# Linux/Mac
/path/to/tomcat/bin/shutdown.sh

# Windows
C:\path\to\tomcat\bin\shutdown.bat
```

## About Tomcat
### Installed via Homebrew:
- Tomcat Version: 11.0.14
- Installation Path: /opt/homebrew/Cellar/tomcat/11.0.14/
- Symlink Path: /opt/homebrew/opt/tomcat/

### Important Directories

- Configuration files: /opt/homebrew/etc/tomcat/
- Webapps folder (deploy your WAR files here): /opt/homebrew/opt/tomcat/libexec/webapps/
- Logs: /opt/homebrew/opt/tomcat/libexec/logs/
- Binaries: /opt/homebrew/opt/tomcat/bin/

## Start/Stop Tomcat
### Option 1: Run as a Background Service (Recommended)

Start Tomcat (starts now and automatically on login):
brew services start tomcat

Stop Tomcat:
brew services stop tomcat

Restart Tomcat:
brew services restart tomcat

Check Tomcat status:
brew services list | grep tomcat

### Option 2: Run Manually (Foreground)

Start Tomcat:
/opt/homebrew/opt/tomcat/bin/catalina run

Stop Tomcat: Press Ctrl+C in the terminal

## Troubleshooting

### Port 8080 Already in Use
```bash
# Find process using port 8080
lsof -i :8080  # Mac/Linux
netstat -ano | findstr :8080  # Windows

# Change Tomcat port in: tomcat/conf/server.xml
# Look for: <Connector port="8080" protocol="HTTP/1.1"
# Change to: <Connector port="8081" protocol="HTTP/1.1"
```

### Application Not Deploying
- Check Tomcat logs: `tomcat/logs/catalina.out`
- Verify Java version compatibility
- Ensure no spaces in file paths
- Check write permissions on webapps directory

### 404 Error
- Verify WAR file is in webapps directory
- Check if Tomcat extracted the WAR (should see a folder named `java-web-app-demo`)
- Restart Tomcat
- Check URL: http://localhost:8080/java-web-app-demo/ (with trailing slash)

### Form Submission Issues
- Check browser console for JavaScript errors
- Verify servlet mapping in `web.xml`
- Check Tomcat logs for servlet errors

## Development

### Running in Development Mode

For rapid development, you can use an IDE like IntelliJ IDEA or Eclipse:

1. **IntelliJ IDEA**:
   - Go to Run > Edit Configurations
   - Add new "Tomcat Server" configuration
   - Deploy `java-web-app-demo:war exploded` artifact
   - Run/Debug as needed

2. **Eclipse**:
   - Right-click project > Run As > Run on Server
   - Select Tomcat server
   - Eclipse will handle deployment

### Hot Reload

For quick changes without redeployment:
- JSP changes: Just refresh browser
- Java changes: Requires rebuild and redeploy
- CSS/JS changes: Clear browser cache or hard refresh (Ctrl+F5)

## Technology Stack

- **Java**: 11+
- **Servlet API**: 4.0.1
- **JSP API**: 2.3.3
- **JSTL**: 1.2
- **Bootstrap**: 5.3.0
- **Bootstrap Icons**: 1.10.0
- **Build Tool**: Maven 3.8+
- **Server**: Apache Tomcat 9.x/10.x

## Browser Compatibility

Tested and working on:
- Chrome 90+
- Firefox 88+
- Safari 14+
- Edge 90+

## License

This is a demonstration project for educational purposes.

## Support

For issues or questions:
- Check the troubleshooting section above
- Review Tomcat logs in `tomcat/logs/`
- Verify all prerequisites are properly installed

---

**Built with JSP/Servlets & Bootstrap 5**
