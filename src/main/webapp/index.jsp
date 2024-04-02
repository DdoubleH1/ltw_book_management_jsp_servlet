<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Book</title>
    <style>
        .alert {
            position: fixed;
            top: 0;
            left: 100%;
            transform: translateX(-50%);
            width: 90%;
            max-width: 500px;
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid transparent;
            border-radius: 4px;
            color: #31708f;
            background-color: #d9edf7;
            border-color: #bce8f1;
            z-index: 9999;
        }

        .close {
            float: right;
            font-size: 18px;
            font-weight: bold;
            line-height: 1;
            color: #000;
            text-shadow: 0 1px 0 #fff;
            opacity: .2;
        }

        .close:hover,
        .close:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
            opacity: .5;
        }
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

        .container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 300px;
        }

        .container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            color: #555;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .btn-submit {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            font-size: 16px;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-submit:hover {
            background-color: #2980b9;

        }

        .btn-display {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            background-color: #2ecc71;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-display:hover {
            background-color: #27ae60;

        }
    </style>
    <script>
        // Function to remove the alert after 3 seconds
        setTimeout(function() {
            const alertElement = document.querySelector('.alert');
            if (alertElement) {
                alertElement.remove();
            }
        }, 3000);
    </script>
</head>
<body>
<div class="container">
    <h2>Add Book</h2>
    <form action="add-book" method="post">
        <div class="form-group">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required>
        </div>
        <div class="form-group">
            <label for="author">Author:</label>
            <input type="text" id="author" name="author" required>
        </div>
        <div class="form-group">
            <label for="year">Year:</label>
            <input type="number" id="year" name="year" required>
        </div>
        <button type="submit" class="btn-submit">Add Book</button>
    </form>
    <form action="display-books" method="get">
        <button type="submit" class="btn-display">Display Books</button>
    </form>
</div>

<%
    // Check if addedSuccessfully flag is set and display an alert
    if (request.getSession().getAttribute("addedSuccessfully") != null) {
%>
<div class="alert">
    Book added successfully!
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
</div>
<%
        // Clear the addedSuccessfully flag
        request.getSession().removeAttribute("addedSuccessfully");
    }
%>
</body>
</html>


