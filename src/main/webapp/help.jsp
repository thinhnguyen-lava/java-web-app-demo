<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help - Form Instructions</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    <style>
        body {
            background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            padding: 20px;
            font-size: 14px;
        }
        .help-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        h4 {
            color: #f5576c;
            font-size: 1.25rem;
            margin-bottom: 15px;
        }
        .help-item {
            margin-bottom: 12px;
            padding-left: 8px;
            border-left: 3px solid #f5576c;
            font-size: 0.9rem;
        }
        .help-item strong {
            color: #333;
        }
        .tip-box {
            background: #fff3cd;
            border-left: 4px solid #ffc107;
            padding: 10px;
            margin-top: 15px;
            border-radius: 4px;
            font-size: 0.85rem;
        }
        .tip-box i {
            color: #ffc107;
        }
    </style>
</head>
<body>
    <div class="help-card">
        <h4><i class="bi bi-question-circle-fill"></i> Form Help & Instructions</h4>

        <div class="help-item">
            <strong><i class="bi bi-check-circle"></i> Required Fields:</strong>
            <p class="mb-1 small">All fields marked with <span class="text-danger">*</span> must be completed before submission.</p>
        </div>

        <div class="help-item">
            <strong><i class="bi bi-envelope"></i> Email:</strong>
            <p class="mb-1 small">Must be a valid email format (e.g., user@example.com)</p>
        </div>

        <div class="help-item">
            <strong><i class="bi bi-key"></i> Password:</strong>
            <p class="mb-1 small">Minimum 6 characters required for security</p>
        </div>

        <div class="help-item">
            <strong><i class="bi bi-pencil"></i> Signature Canvas:</strong>
            <p class="mb-1 small">Use your mouse or touch to draw your signature. Click "Clear" to start over.</p>
        </div>

        <div class="help-item">
            <strong><i class="bi bi-chat-left-text"></i> Comments:</strong>
            <p class="mb-1 small">Maximum 500 characters. Counter shows remaining characters.</p>
        </div>

        <div class="tip-box">
            <i class="bi bi-lightbulb-fill"></i> <strong>Tip:</strong>
            All form data is validated both on the client-side (instant feedback) and server-side (secure validation) before submission.
        </div>

        <div class="mt-3 text-center">
            <small class="text-muted"><i class="bi bi-info-circle"></i> Need more help? Check the form tooltips.</small>
        </div>
    </div>
</body>
</html>
