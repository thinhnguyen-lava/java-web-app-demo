<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Java Web App Demo - Form Components</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">

    <!-- Custom CSS -->
    <link href="css/style.css" rel="stylesheet">

    <script defer async client-code="KA-743630-03" src="https://static.katalon.com/libs/traffic-agent/v1/traffic-agent.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-dark bg-primary">
        <div class="container-fluid">
            <span class="navbar-brand mb-0 h1">
                <i class="bi bi-code-square"></i> Java Web App Demo
            </span>
        </div>
    </nav>

    <div class="container my-5">
        <div class="row">
            <div class="col-lg-10 mx-auto">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0"><i class="bi bi-ui-checks"></i> UI Components Demo Form</h4>
                    </div>
                    <div class="card-body">
                        <p class="text-muted">
                            This form demonstrates various web UI components. Fill out the form below and click Submit to see the results.
                        </p>

                        <form action="submitForm" method="POST" id="demoForm">

                            <!-- Text Input Fields Section -->
                            <div class="section-divider">
                                <h5><i class="bi bi-input-cursor-text"></i> Text Input Fields</h5>
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="fullName" class="form-label">Full Name *</label>
                                    <input type="text" class="form-control" id="fullName" name="fullName"
                                           placeholder="Enter your name" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="email" class="form-label">Email Address *</label>
                                    <input type="email" class="form-control" id="email" name="email"
                                           placeholder="example@email.com" required>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="password" class="form-label">Password *</label>
                                    <input type="password" class="form-control" id="password" name="password"
                                           placeholder="Enter password" required>
                                </div>
                                <div class="col-md-6">
                                    <label for="age" class="form-label">Age</label>
                                    <input type="number" class="form-control" id="age" name="age"
                                           placeholder="Enter your age" min="1" max="120">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="phone" class="form-label">Phone Number</label>
                                    <input type="tel" class="form-control" id="phone" name="phone"
                                           placeholder="(123) 456-7890">
                                </div>
                                <div class="col-md-6">
                                    <label for="birthdate" class="form-label">Birth Date</label>
                                    <input type="date" class="form-control" id="birthdate" name="birthdate">
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="website" class="form-label">Website URL</label>
                                <input type="url" class="form-control" id="website" name="website"
                                       placeholder="https://example.com">
                            </div>

                            <!-- Dropdown/Select Section -->
                            <div class="section-divider">
                                <h5><i class="bi bi-menu-button-wide"></i> Dropdown Menus</h5>
                            </div>

                            <div class="row mb-3">
                                <div class="col-md-6">
                                    <label for="country" class="form-label">Country *</label>
                                    <select class="form-select" id="country" name="country" required>
                                        <option value="" selected>Select a country</option>
                                        <option value="USA">United States</option>
                                        <option value="Canada">Canada</option>
                                        <option value="UK">United Kingdom</option>
                                        <option value="Australia">Australia</option>
                                        <option value="Germany">Germany</option>
                                        <option value="France">France</option>
                                        <option value="Japan">Japan</option>
                                        <option value="Other">Other</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label for="occupation" class="form-label">Occupation</label>
                                    <select class="form-select" id="occupation" name="occupation">
                                        <option value="" selected>Select occupation</option>
                                        <option value="Developer">Software Developer</option>
                                        <option value="Designer">Designer</option>
                                        <option value="Manager">Manager</option>
                                        <option value="Student">Student</option>
                                        <option value="Other">Other</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Radio Buttons Section -->
                            <div class="section-divider">
                                <h5><i class="bi bi-record-circle"></i> Radio Buttons</h5>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Gender *</label>
                                <div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender"
                                               id="genderMale" value="Male" required>
                                        <label class="form-check-label" for="genderMale">Male</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender"
                                               id="genderFemale" value="Female">
                                        <label class="form-check-label" for="genderFemale">Female</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender"
                                               id="genderOther" value="Other">
                                        <label class="form-check-label" for="genderOther">Other</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="radio" name="gender"
                                               id="genderPreferNot" value="Prefer not to say">
                                        <label class="form-check-label" for="genderPreferNot">Prefer not to say</label>
                                    </div>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Experience Level</label>
                                <div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="experience"
                                               id="expBeginner" value="Beginner" checked>
                                        <label class="form-check-label" for="expBeginner">
                                            Beginner (0-2 years)
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="experience"
                                               id="expIntermediate" value="Intermediate">
                                        <label class="form-check-label" for="expIntermediate">
                                            Intermediate (3-5 years)
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="experience"
                                               id="expAdvanced" value="Advanced">
                                        <label class="form-check-label" for="expAdvanced">
                                            Advanced (6+ years)
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <!-- Checkboxes Section -->
                            <div class="section-divider">
                                <h5><i class="bi bi-check-square"></i> Checkboxes</h5>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Programming Languages (select all that apply)</label>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="languages"
                                                   value="Java" id="langJava">
                                            <label class="form-check-label" for="langJava">Java</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="languages"
                                                   value="Python" id="langPython">
                                            <label class="form-check-label" for="langPython">Python</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="languages"
                                                   value="JavaScript" id="langJS">
                                            <label class="form-check-label" for="langJS">JavaScript</label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="languages"
                                                   value="C++" id="langCpp">
                                            <label class="form-check-label" for="langCpp">C++</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="languages"
                                                   value="C#" id="langCSharp">
                                            <label class="form-check-label" for="langCSharp">C#</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="languages"
                                                   value="Ruby" id="langRuby">
                                            <label class="form-check-label" for="langRuby">Ruby</label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="languages"
                                                   value="PHP" id="langPHP">
                                            <label class="form-check-label" for="langPHP">PHP</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="languages"
                                                   value="Go" id="langGo">
                                            <label class="form-check-label" for="langGo">Go</label>
                                        </div>
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" name="languages"
                                                   value="Swift" id="langSwift">
                                            <label class="form-check-label" for="langSwift">Swift</label>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Toggle Switches Section -->
                            <div class="section-divider">
                                <h5><i class="bi bi-toggle-on"></i> Toggle Switches</h5>
                            </div>

                            <div class="mb-3">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="newsletter"
                                           value="yes" id="newsletter">
                                    <label class="form-check-label" for="newsletter">
                                        Subscribe to newsletter
                                    </label>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="notifications"
                                           value="yes" id="notifications" checked>
                                    <label class="form-check-label" for="notifications">
                                        Enable email notifications
                                    </label>
                                </div>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" name="darkMode"
                                           value="yes" id="darkMode">
                                    <label class="form-check-label" for="darkMode">
                                        Enable dark mode
                                    </label>
                                </div>
                            </div>

                            <!-- Range Slider Section -->
                            <div class="section-divider">
                                <h5><i class="bi bi-sliders"></i> Range Slider</h5>
                            </div>

                            <div class="mb-3">
                                <label for="satisfaction" class="form-label">
                                    Satisfaction Level: <span id="satisfactionValue">5</span>/10
                                </label>
                                <input type="range" class="form-range" min="1" max="10" step="1"
                                       value="5" id="satisfaction" name="satisfaction">
                            </div>

                            <!-- Textarea Section -->
                            <div class="section-divider">
                                <h5><i class="bi bi-textarea-t"></i> Text Area</h5>
                            </div>

                            <div class="mb-3">
                                <label for="comments" class="form-label">Additional Comments</label>
                                <textarea class="form-control" id="comments" name="comments"
                                          rows="4" placeholder="Enter any additional comments or feedback..."></textarea>
                            </div>

                            <!-- File Upload Section -->
                            <div class="section-divider">
                                <h5><i class="bi bi-file-earmark-arrow-up"></i> File Upload</h5>
                            </div>

                            <div class="mb-3">
                                <label for="fileUpload" class="form-label">Upload Resume/CV</label>
                                <input class="form-control" type="file" id="fileUpload" name="fileUpload">
                                <div class="form-text">Supported formats: PDF, DOC, DOCX (Max 5MB)</div>
                            </div>

                            <!-- Color Picker Section -->
                            <div class="section-divider">
                                <h5><i class="bi bi-palette"></i> Color Picker</h5>
                            </div>

                            <div class="mb-3">
                                <label for="favoriteColor" class="form-label">Favorite Color</label>
                                <input type="color" class="form-control form-control-color"
                                       id="favoriteColor" name="favoriteColor" value="#0d6efd"
                                       title="Choose your favorite color">
                            </div>

                            <!-- Hover Menu Section -->
                            <div class="section-divider">
                                <h5><i class="bi bi-menu-down"></i> Hover Menu</h5>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Select your preferred programming framework (hover to see options)</label>
                                <div class="hover-menu-container">
                                    <div class="hover-menu-trigger">
                                        <span id="selectedFramework">None Selected</span>
                                        <i class="bi bi-chevron-down"></i>
                                    </div>
                                    <div class="hover-menu-dropdown">
                                        <div class="hover-menu-item" data-value="React">
                                            <i class="bi bi-bootstrap-fill"></i> React
                                        </div>
                                        <div class="hover-menu-item" data-value="Vue">
                                            <i class="bi bi-bootstrap-fill"></i> Vue.js
                                        </div>
                                        <div class="hover-menu-item" data-value="Angular">
                                            <i class="bi bi-bootstrap-fill"></i> Angular
                                        </div>
                                        <div class="hover-menu-item" data-value="Svelte">
                                            <i class="bi bi-bootstrap-fill"></i> Svelte
                                        </div>
                                        <div class="hover-menu-item" data-value="Spring">
                                            <i class="bi bi-code-square"></i> Spring Boot
                                        </div>
                                        <div class="hover-menu-item" data-value="Django">
                                            <i class="bi bi-code-square"></i> Django
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" id="framework" name="framework" value="">
                            </div>

                            <!-- Signature Canvas Section -->
                            <div class="section-divider">
                                <h5><i class="bi bi-pen"></i> Signature Canvas</h5>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Please sign below</label>
                                <div class="signature-container">
                                    <canvas id="signatureCanvas" width="600" height="200"></canvas>
                                    <div class="signature-controls">
                                        <button type="button" class="btn btn-sm btn-outline-secondary" id="clearSignature">
                                            <i class="bi bi-eraser"></i> Clear
                                        </button>
                                        <span class="signature-hint">Draw your signature with mouse or touch</span>
                                    </div>
                                </div>
                                <input type="hidden" id="signatureData" name="signatureData" value="">
                            </div>

                            <!-- Terms and Conditions -->
                            <div class="mb-4">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="terms"
                                           name="terms" value="agreed" required>
                                    <label class="form-check-label" for="terms">
                                        I agree to the <a href="#" class="text-decoration-none">Terms and Conditions</a> *
                                    </label>
                                </div>
                            </div>

                            <!-- Submit Buttons -->
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                <button type="reset" class="btn btn-secondary">
                                    <i class="bi bi-arrow-counterclockwise"></i> Reset
                                </button>
                                <button type="submit" class="btn btn-primary">
                                    <i class="bi bi-send"></i> Submit Form
                                </button>
                            </div>

                        </form>
                    </div>
                </div>

                <!-- Info Card -->
                <div class="card mt-4 shadow-sm">
                    <div class="card-body">
                        <h6 class="card-subtitle mb-2 text-muted">
                            <i class="bi bi-info-circle"></i> About This Demo
                        </h6>
                        <p class="card-text small mb-0">
                            This is a demonstration Java web application built with JSP/Servlets and deployed on Apache Tomcat.
                            The form showcases various HTML5 input types and Bootstrap 5 components including text inputs,
                            dropdowns, radio buttons, checkboxes, toggle switches, range sliders, textareas, file uploads,
                            color pickers, hover menus, and HTML5 canvas signature.
                        </p>
                    </div>
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

    <!-- Custom JavaScript -->
    <script src="js/script.js"></script>
</body>
</html>
