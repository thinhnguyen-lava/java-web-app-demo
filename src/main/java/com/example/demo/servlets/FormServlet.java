package com.example.demo.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Servlet for handling form submissions from the demo application
 */
public class FormServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Set character encoding to handle special characters
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        try {
            // Retrieve text input fields
            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String age = request.getParameter("age");
            String phone = request.getParameter("phone");
            String birthdate = request.getParameter("birthdate");
            String website = request.getParameter("website");

            // Retrieve dropdown selections
            String country = request.getParameter("country");
            String occupation = request.getParameter("occupation");

            // Retrieve radio button selections
            String gender = request.getParameter("gender");
            String experience = request.getParameter("experience");

            // Retrieve checkbox selections (multiple values)
            String[] languagesArray = request.getParameterValues("languages");
            List<String> languages = new ArrayList<>();
            if (languagesArray != null) {
                languages = Arrays.asList(languagesArray);
            }

            // Retrieve toggle switches
            String newsletter = request.getParameter("newsletter");
            String notifications = request.getParameter("notifications");
            String darkMode = request.getParameter("darkMode");

            // Retrieve range slider
            String satisfaction = request.getParameter("satisfaction");

            // Retrieve textarea
            String comments = request.getParameter("comments");

            // Retrieve file upload (note: basic handling, full implementation would need multipart)
            String fileUpload = request.getParameter("fileUpload");

            // Retrieve color picker
            String favoriteColor = request.getParameter("favoriteColor");

            // Retrieve terms checkbox
            String terms = request.getParameter("terms");

            // Basic server-side validation
            List<String> errors = new ArrayList<>();

            if (fullName == null || fullName.trim().isEmpty()) {
                errors.add("Full Name is required");
            }

            if (email == null || email.trim().isEmpty()) {
                errors.add("Email is required");
            } else if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
                errors.add("Invalid email format");
            }

            if (password == null || password.trim().isEmpty()) {
                errors.add("Password is required");
            } else if (password.length() < 6) {
                errors.add("Password must be at least 6 characters");
            }

            if (country == null || country.trim().isEmpty()) {
                errors.add("Country is required");
            }

            if (gender == null || gender.trim().isEmpty()) {
                errors.add("Gender is required");
            }

            if (terms == null) {
                errors.add("You must agree to the Terms and Conditions");
            }

            // If there are validation errors, redirect back with errors
            if (!errors.isEmpty()) {
                request.setAttribute("errors", errors);
                request.getRequestDispatcher("/index.jsp").forward(request, response);
                return;
            }

            // Set all attributes for the result page
            request.setAttribute("fullName", fullName);
            request.setAttribute("email", email);
            request.setAttribute("password", maskPassword(password));
            request.setAttribute("age", age != null && !age.isEmpty() ? age : "Not provided");
            request.setAttribute("phone", phone != null && !phone.isEmpty() ? phone : "Not provided");
            request.setAttribute("birthdate", birthdate != null && !birthdate.isEmpty() ? birthdate : "Not provided");
            request.setAttribute("website", website != null && !website.isEmpty() ? website : "Not provided");

            request.setAttribute("country", country);
            request.setAttribute("occupation", occupation != null && !occupation.isEmpty() ? occupation : "Not selected");

            request.setAttribute("gender", gender);
            request.setAttribute("experience", experience != null ? experience : "Not selected");

            request.setAttribute("languages", languages);
            request.setAttribute("languagesCount", languages.size());

            request.setAttribute("newsletter", newsletter != null ? "Yes" : "No");
            request.setAttribute("notifications", notifications != null ? "Yes" : "No");
            request.setAttribute("darkMode", darkMode != null ? "Yes" : "No");

            request.setAttribute("satisfaction", satisfaction);

            request.setAttribute("comments", comments != null && !comments.isEmpty() ? comments : "No comments provided");

            request.setAttribute("favoriteColor", favoriteColor);

            // Forward to result page
            request.getRequestDispatcher("/result.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR,
                    "An error occurred while processing your form: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect GET requests to the form page
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }

    /**
     * Mask password for display purposes
     */
    private String maskPassword(String password) {
        if (password == null || password.isEmpty()) {
            return "";
        }
        return "*".repeat(password.length());
    }
}
