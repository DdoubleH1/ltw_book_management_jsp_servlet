package com.example.bookmanagement;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

import com.example.bookmanagement.model.Book;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "addBookServlet", value = "/add-book")
public class AddBookServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve book information from the form
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        int year = Integer.parseInt(request.getParameter("year"));

        // Create a new Book object
        Book book = new Book(title, author, year);

        // Retrieve existing book list from servlet context
        ServletContext context = getServletContext();
        List<Book> bookList = (List<Book>) context.getAttribute("bookList");

        // If book list does not exist, create a new one
        if (bookList == null) {
            bookList = new ArrayList<>();
            context.setAttribute("bookList", bookList);
        }

        request.getSession().setAttribute("addedSuccessfully", true);

        // Add the new book to the book list
        bookList.add(book);

        // Redirect to addBook.jsp to clear the form
        response.sendRedirect("index.jsp");
    }


}