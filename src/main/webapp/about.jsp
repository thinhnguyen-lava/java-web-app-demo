<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About - Java Web App Demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 20px;
            font-size: 14px;
        }
        .about-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .badge-custom {
            font-size: 0.75rem;
            padding: 4px 8px;
        }
        h4 {
            color: #667eea;
            font-size: 1.25rem;
            margin-bottom: 15px;
        }
        .tech-item {
            display: flex;
            align-items: center;
            margin-bottom: 8px;
            font-size: 0.9rem;
        }
        .tech-item i {
            margin-right: 8px;
            color: #667eea;
        }
    </style>
</head>
<body>
    <div class="about-card">
        <h4><i class="bi bi-info-circle-fill"></i> About This Application</h4>
        <p>This is a comprehensive Java Web Application demo built with JSP and Servlets.</p>

        <h5 class="mt-3 mb-2" style="font-size: 1rem;">Technology Stack</h5>
        <div class="tech-item">
            <i class="bi bi-code-square"></i>
            <span><strong>Backend:</strong> Jakarta Servlets & JSP</span>
        </div>
        <div class="tech-item">
            <i class="bi bi-palette"></i>
            <span><strong>Frontend:</strong> Bootstrap 5 + Custom CSS/JS</span>
        </div>
        <div class="tech-item">
            <i class="bi bi-server"></i>
            <span><strong>Server:</strong> Apache Tomcat 10+</span>
        </div>
        <div class="tech-item">
            <i class="bi bi-box"></i>
            <span><strong>Build:</strong> Maven 3.8+</span>
        </div>

        <h5 class="mt-3 mb-2" style="font-size: 1rem;">Features</h5>
        <div class="d-flex flex-wrap gap-1">
            <span class="badge bg-primary badge-custom">Form Validation</span>
            <span class="badge bg-success badge-custom">Responsive Design</span>
            <span class="badge bg-info badge-custom">Canvas Signatures</span>
            <span class="badge bg-warning text-dark badge-custom">Real-time Feedback</span>
            <span class="badge bg-danger badge-custom">File Upload</span>
            <span class="badge bg-secondary badge-custom">Dynamic UI</span>
        </div>

        <div class="mt-3 p-2 bg-light rounded">
            <small class="text-muted">
                <i class="bi bi-github"></i> Version 1.0.0 | Built with ❤️ using Java
            </small>
        </div>
    </div>
</body>
</html>
