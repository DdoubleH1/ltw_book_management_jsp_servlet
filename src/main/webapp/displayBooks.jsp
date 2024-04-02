<%@ page import="java.util.List" %>
<%@ page import="com.example.bookmanagement.model.Book" %>
<!DOCTYPE html>
<html>
<head>
    <title>Book List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 500px;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        .add-more-button {
            display: block;
            width: 200px;
            margin: 0 auto;
            padding: 10px;
            font-size: 16px;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .add-more-button:hover {
            background-color: #2980b9;
        }

        .message_no_books {
            text-align: center;
            color: #828080;
        }
    </style>
</head>
<body>
<div class="card">
    <h2>Book List</h2>
    <%
        List<Book> bookList = (List<Book>) request.getAttribute("bookList");
    %>

    <table>
        <tr>
            <th>Title</th>
            <th>Author</th>
            <th>Year</th>
        </tr>
        <%
            if (bookList != null && !bookList.isEmpty()) {
                for (Book book : bookList) {
        %>
        <tr>
            <td><%= book.getTitle() %></td>
            <td><%= book.getAuthor() %></td>
            <td><%= book.getYear() %></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="3" class="message_no_books">No books available.</td>
        </tr>
        <% } %>
    </table>

    <form action="index.jsp" method="get">
        <input type="submit" class="add-more-button" value="Add More Books">
    </form>
</div>
</body>
</html>
