<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form Submission Result - Java Web App Demo</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">

    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-dark bg-success">
        <div class="container-fluid">
            <span class="navbar-brand mb-0 h1">
                <i class="bi bi-check-circle"></i> Java Web App Demo - Results
            </span>
        </div>
    </nav>

    <div class="container my-5">
        <div class="row">
            <div class="col-lg-10 mx-auto">

                <!-- Success Alert -->
                <div class="alert alert-success alert-dismissible fade show shadow-sm" role="alert">
                    <h4 class="alert-heading">
                        <i class="bi bi-check-circle-fill"></i> Form Submitted Successfully!
                    </h4>
                    <p class="mb-0">Your form has been processed. Below is a summary of the information you provided.</p>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>

                <!-- Personal Information Card -->
                <div class="card shadow mb-4">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0"><i class="bi bi-person-circle"></i> Personal Information</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <strong><i class="bi bi-person"></i> Full Name:</strong>
                                <p class="ms-4">${fullName}</p>
                            </div>
                            <div class="col-md-6 mb-3">
                                <strong><i class="bi bi-envelope"></i> Email:</strong>
                                <p class="ms-4">${email}</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <strong><i class="bi bi-lock"></i> Password:</strong>
                                <p class="ms-4">${password}</p>
                            </div>
                            <div class="col-md-6 mb-3">
                                <strong><i class="bi bi-calendar-event"></i> Age:</strong>
                                <p class="ms-4">${age}</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <strong><i class="bi bi-telephone"></i> Phone:</strong>
                                <p class="ms-4">${phone}</p>
                            </div>
                            <div class="col-md-6 mb-3">
                                <strong><i class="bi bi-calendar3"></i> Birth Date:</strong>
                                <p class="ms-4">${birthdate}</p>
                            </div>
                        </div>
                        <div class="mb-3">
                            <strong><i class="bi bi-globe"></i> Website:</strong>
                            <p class="ms-4">
                                <c:choose>
                                    <c:when test="${website != 'Not provided' && website != null}">
                                        <a href="${website}" target="_blank">${website}</a>
                                    </c:when>
                                    <c:otherwise>
                                        ${website}
                                    </c:otherwise>
                                </c:choose>
                            </p>
                        </div>
                    </div>
                </div>

                <!-- Location & Occupation Card -->
                <div class="card shadow mb-4">
                    <div class="card-header bg-info text-white">
                        <h5 class="mb-0"><i class="bi bi-geo-alt"></i> Location & Occupation</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <strong><i class="bi bi-flag"></i> Country:</strong>
                                <p class="ms-4">${country}</p>
                            </div>
                            <div class="col-md-6 mb-3">
                                <strong><i class="bi bi-briefcase"></i> Occupation:</strong>
                                <p class="ms-4">${occupation}</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Demographics & Experience Card -->
                <div class="card shadow mb-4">
                    <div class="card-header bg-warning text-dark">
                        <h5 class="mb-0"><i class="bi bi-bar-chart"></i> Demographics & Experience</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <strong><i class="bi bi-gender-ambiguous"></i> Gender:</strong>
                                <p class="ms-4">
                                    <span class="badge bg-secondary">${gender}</span>
                                </p>
                            </div>
                            <div class="col-md-6 mb-3">
                                <strong><i class="bi bi-stars"></i> Experience Level:</strong>
                                <p class="ms-4">
                                    <span class="badge bg-primary">${experience}</span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Programming Languages Card -->
                <div class="card shadow mb-4">
                    <div class="card-header bg-danger text-white">
                        <h5 class="mb-0"><i class="bi bi-code-slash"></i> Programming Languages</h5>
                    </div>
                    <div class="card-body">
                        <strong>Selected Languages (${languagesCount}):</strong>
                        <div class="mt-2">
                            <c:choose>
                                <c:when test="${languagesCount > 0}">
                                    <c:forEach var="language" items="${languages}">
                                        <span class="badge bg-danger me-2 mb-2">${language}</span>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <p class="text-muted">No languages selected</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>

                <!-- Preferences Card -->
                <div class="card shadow mb-4">
                    <div class="card-header bg-secondary text-white">
                        <h5 class="mb-0"><i class="bi bi-sliders"></i> Preferences</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <div class="preference-item">
                                    <i class="bi ${newsletter == 'Yes' ? 'bi-toggle-on text-success' : 'bi-toggle-off text-muted'}"></i>
                                    <strong> Newsletter:</strong>
                                    <span class="badge ${newsletter == 'Yes' ? 'bg-success' : 'bg-secondary'}">${newsletter}</span>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="preference-item">
                                    <i class="bi ${notifications == 'Yes' ? 'bi-toggle-on text-success' : 'bi-toggle-off text-muted'}"></i>
                                    <strong> Notifications:</strong>
                                    <span class="badge ${notifications == 'Yes' ? 'bg-success' : 'bg-secondary'}">${notifications}</span>
                                </div>
                            </div>
                            <div class="col-md-4 mb-3">
                                <div class="preference-item">
                                    <i class="bi ${darkMode == 'Yes' ? 'bi-toggle-on text-success' : 'bi-toggle-off text-muted'}"></i>
                                    <strong> Dark Mode:</strong>
                                    <span class="badge ${darkMode == 'Yes' ? 'bg-success' : 'bg-secondary'}">${darkMode}</span>
                                </div>
                            </div>
                        </div>

                        <hr>

                        <div class="mb-3">
                            <strong><i class="bi bi-emoji-smile"></i> Satisfaction Level:</strong>
                            <div class="d-flex align-items-center mt-2">
                                <div class="progress flex-grow-1 me-3" style="height: 25px;">
                                    <div class="progress-bar bg-success" role="progressbar"
                                         style="width: ${satisfaction * 10}%"
                                         aria-valuenow="${satisfaction}" aria-valuemin="0" aria-valuemax="10">
                                        ${satisfaction}/10
                                    </div>
                                </div>
                            </div>
                        </div>

                        <hr>

                        <div class="mb-3">
                            <strong><i class="bi bi-palette-fill"></i> Favorite Color:</strong>
                            <div class="d-flex align-items-center mt-2">
                                <div class="color-preview me-3"
                                     style="width: 50px; height: 50px; background-color: ${favoriteColor};
                                            border: 2px solid #dee2e6; border-radius: 8px;">
                                </div>
                                <span class="badge bg-dark">${favoriteColor}</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Framework Selection Card -->
                <div class="card shadow mb-4">
                    <div class="card-header bg-info text-white">
                        <h5 class="mb-0"><i class="bi bi-menu-down"></i> Framework Selection</h5>
                    </div>
                    <div class="card-body">
                        <strong><i class="bi bi-code-square"></i> Preferred Framework:</strong>
                        <p class="ms-4">
                            <c:choose>
                                <c:when test="${framework != 'Not selected'}">
                                    <span class="badge bg-info" style="font-size: 1rem; padding: 0.5rem 1rem;">${framework}</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="text-muted">${framework}</span>
                                </c:otherwise>
                            </c:choose>
                        </p>
                    </div>
                </div>

                <!-- Signature Card -->
                <div class="card shadow mb-4">
                    <div class="card-header bg-warning text-dark">
                        <h5 class="mb-0"><i class="bi bi-pen"></i> Digital Signature</h5>
                    </div>
                    <div class="card-body">
                        <strong><i class="bi bi-vector-pen"></i> Your Signature:</strong>
                        <div class="mt-3">
                            <c:choose>
                                <c:when test="${hasSignature}">
                                    <img src="${signatureData}" alt="User Signature" class="signature-preview">
                                    <p class="text-muted small mt-2">
                                        <i class="bi bi-check-circle-fill text-success"></i> Signature captured successfully
                                    </p>
                                </c:when>
                                <c:otherwise>
                                    <div class="alert alert-warning" role="alert">
                                        <i class="bi bi-exclamation-triangle"></i> No signature provided
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>

                <!-- Comments Card -->
                <div class="card shadow mb-4">
                    <div class="card-header bg-dark text-white">
                        <h5 class="mb-0"><i class="bi bi-chat-left-text"></i> Additional Comments</h5>
                    </div>
                    <div class="card-body">
                        <div class="comment-box">
                            <c:choose>
                                <c:when test="${comments != 'No comments provided'}">
                                    <p class="mb-0">${comments}</p>
                                </c:when>
                                <c:otherwise>
                                    <p class="text-muted mb-0">${comments}</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>

                <!-- Data Summary Table -->
                <div class="card shadow mb-4">
                    <div class="card-header bg-primary text-white">
                        <h5 class="mb-0"><i class="bi bi-table"></i> Complete Data Summary</h5>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead class="table-light">
                                    <tr>
                                        <th>Field Name</th>
                                        <th>Value</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><strong>Full Name</strong></td>
                                        <td>${fullName}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Email</strong></td>
                                        <td>${email}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Age</strong></td>
                                        <td>${age}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Phone</strong></td>
                                        <td>${phone}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Birth Date</strong></td>
                                        <td>${birthdate}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Website</strong></td>
                                        <td>${website}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Country</strong></td>
                                        <td>${country}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Occupation</strong></td>
                                        <td>${occupation}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Gender</strong></td>
                                        <td>${gender}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Experience Level</strong></td>
                                        <td>${experience}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Programming Languages</strong></td>
                                        <td>
                                            <c:forEach var="language" items="${languages}" varStatus="status">
                                                ${language}<c:if test="${!status.last}">, </c:if>
                                            </c:forEach>
                                            <c:if test="${languagesCount == 0}">None selected</c:if>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong>Newsletter Subscription</strong></td>
                                        <td>${newsletter}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Email Notifications</strong></td>
                                        <td>${notifications}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Dark Mode</strong></td>
                                        <td>${darkMode}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Satisfaction Level</strong></td>
                                        <td>${satisfaction}/10</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Favorite Color</strong></td>
                                        <td>
                                            <span style="display: inline-block; width: 20px; height: 20px;
                                                         background-color: ${favoriteColor}; border: 1px solid #000;
                                                         border-radius: 3px; vertical-align: middle;"></span>
                                            ${favoriteColor}
                                        </td>
                                    </tr>
                                    <tr>
                                        <td><strong>Preferred Framework</strong></td>
                                        <td>${framework}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Digital Signature</strong></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${hasSignature}">
                                                    <span class="badge bg-success">Provided</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge bg-warning text-dark">Not provided</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <!-- Action Buttons -->
                <div class="d-grid gap-2 d-md-flex justify-content-md-center mb-4">
                    <a href="index.jsp" class="btn btn-primary btn-lg">
                        <i class="bi bi-arrow-left-circle"></i> Back to Form
                    </a>
                    <button onclick="window.print()" class="btn btn-secondary btn-lg">
                        <i class="bi bi-printer"></i> Print Results
                    </button>
                </div>

            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-light text-center text-muted py-3 mt-5">
        <div class="container">
            <small>Java Web App Demo &copy; 2025 | Built with JSP/Servlets & Bootstrap 5</small>
        </div>
    </footer>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
