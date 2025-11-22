package com.example.demo.filters;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletResponse;
import java.io.CharArrayWriter;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet Filter that automatically injects Katalon script into all HTML responses
 */
public class ScriptInjectionFilter implements Filter {

    private static final String KATALON_SCRIPT =
        "<script defer async client-code=\"KA-743630-03\" " +
        "src=\"https://static.katalon.com/libs/traffic-agent/v1/traffic-agent.min.js\"></script>";

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Initialization logic if needed
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        HttpServletResponse httpResponse = (HttpServletResponse) response;

        // Create a wrapper to capture the response
        CharResponseWrapper wrapper = new CharResponseWrapper(httpResponse);

        // Continue the filter chain with the wrapped response
        chain.doFilter(request, wrapper);

        // Get the captured output
        String output = wrapper.toString();

        // Only inject script for HTML responses
        String contentType = wrapper.getContentType();
        if (contentType != null && contentType.contains("text/html") && output.contains("<head>")) {
            // Inject the script right after the opening <head> tag
            output = output.replace("<head>", "<head>\n    " + KATALON_SCRIPT);
        }

        // Write the modified output
        response.setContentLength(output.getBytes(wrapper.getCharacterEncoding()).length);
        response.getWriter().write(output);
    }

    @Override
    public void destroy() {
        // Cleanup logic if needed
    }

    /**
     * Response wrapper to capture the output
     */
    static class CharResponseWrapper extends jakarta.servlet.http.HttpServletResponseWrapper {
        private CharArrayWriter writer;
        private PrintWriter printWriter;

        public CharResponseWrapper(HttpServletResponse response) {
            super(response);
            writer = new CharArrayWriter();
        }

        @Override
        public PrintWriter getWriter() {
            if (printWriter == null) {
                printWriter = new PrintWriter(writer);
            }
            return printWriter;
        }

        @Override
        public String toString() {
            return writer.toString();
        }
    }
}
