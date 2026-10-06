
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="com.library.dao.BookDAO, com.library.model.Book, java.util.List"%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>DC Library | Discover Your Next Book</title>

    <!-- Google Font -->
    <link rel="preconnect"
          href="https://fonts.googleapis.com">

    <link rel="preconnect"
          href="https://fonts.gstatic.com"
          crossorigin>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
          rel="stylesheet">


    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }


        html {
            scroll-behavior: smooth;
        }


        body {

            font-family: "Inter", "Segoe UI", Arial, sans-serif;

            background: #f8fafc;

            color: #111827;

            min-height: 100vh;
        }


        /* ==================================================
           NAVBAR
        ================================================== */

        .navbar {

            height: 70px;

            background: rgba(255,255,255,0.96);

            border-bottom: 1px solid #e5e7eb;

            display: flex;

            align-items: center;

            justify-content: space-between;

            padding: 0 6%;

            position: sticky;

            top: 0;

            z-index: 100;

            backdrop-filter: blur(12px);
        }


        .logo {

            font-size: 22px;

            font-weight: 800;

            letter-spacing: -0.8px;

            color: #111827;

            text-decoration: none;
        }


        .logo span {

            color: #4f46e5;
        }


        .nav-right {

            display: flex;

            align-items: center;

            gap: 10px;
        }


        .nav-link {

            text-decoration: none;

            color: #4b5563;

            font-size: 12px;

            font-weight: 600;

            padding: 9px 13px;

            border-radius: 7px;

            transition: 0.2s;
        }


        .nav-link:hover {

            background: #f3f4f6;

            color: #4f46e5;
        }


        .nav-button {

            text-decoration: none;

            color: white;

            background: #4f46e5;

            font-size: 12px;

            font-weight: 700;

            padding: 9px 15px;

            border-radius: 7px;

            transition: 0.2s;
        }


        .nav-button:hover {

            background: #4338ca;

            transform: translateY(-1px);
        }


        .logout {

            color: #dc2626;
        }


        .logout:hover {

            color: #b91c1c;

            background: #fef2f2;
        }


        /* ==================================================
           HERO
        ================================================== */

        .hero {

            position: relative;

            overflow: hidden;

            padding: 72px 6% 78px;

            background:
                linear-gradient(
                    135deg,
                    #111827 0%,
                    #1e1b4b 52%,
                    #312e81 100%
                );

            color: white;
        }


        .hero::before {

            content: "";

            position: absolute;

            width: 400px;

            height: 400px;

            border-radius: 50%;

            background:
                rgba(99,102,241,0.16);

            right: -150px;

            top: -180px;
        }


        .hero::after {

            content: "";

            position: absolute;

            width: 250px;

            height: 250px;

            border-radius: 50%;

            background:
                rgba(129,140,248,0.10);

            left: -120px;

            bottom: -140px;
        }


        .hero-content {

            position: relative;

            z-index: 2;

            max-width: 1100px;

            margin: auto;
        }


        .hero-badge {

            display: inline-flex;

            align-items: center;

            gap: 7px;

            padding: 7px 12px;

            border-radius: 30px;

            background:
                rgba(255,255,255,0.09);

            border:
                1px solid rgba(255,255,255,0.14);

            color: #c7d2fe;

            font-size: 11px;

            font-weight: 600;

            margin-bottom: 20px;
        }


        .hero h1 {

            max-width: 720px;

            font-size: clamp(34px, 5vw, 58px);

            line-height: 1.05;

            letter-spacing: -2.5px;

            margin-bottom: 18px;
        }


        .hero h1 span {

            color: #818cf8;
        }


        .hero p {

            max-width: 600px;

            color: #c7d2fe;

            font-size: 14px;

            line-height: 1.8;

            margin-bottom: 28px;
        }


        .hero-actions {

            display: flex;

            gap: 10px;

            flex-wrap: wrap;
        }


        .hero-primary {

            text-decoration: none;

            background: white;

            color: #312e81;

            padding: 11px 17px;

            border-radius: 8px;

            font-size: 12px;

            font-weight: 700;

            transition: 0.2s;
        }


        .hero-primary:hover {

            transform: translateY(-1px);

            box-shadow:
                0 8px 20px rgba(0,0,0,0.18);
        }


        .hero-secondary {

            text-decoration: none;

            color: white;

            padding: 10px 17px;

            border-radius: 8px;

            border:
                1px solid rgba(255,255,255,0.25);

            font-size: 12px;

            font-weight: 600;

            transition: 0.2s;
        }


        .hero-secondary:hover {

            background:
                rgba(255,255,255,0.08);
        }


        /* ==================================================
           BOOK SECTION
        ================================================== */

        .books-section {

            max-width: 1200px;

            margin: auto;

            padding: 55px 25px 70px;
        }


        .section-header {

            display: flex;

            align-items: flex-end;

            justify-content: space-between;

            margin-bottom: 28px;
        }


        .section-title h2 {

            font-size: 25px;

            letter-spacing: -0.8px;

            margin-bottom: 5px;
        }


        .section-title p {

            color: #6b7280;

            font-size: 12px;
        }


        .book-count {

            color: #6b7280;

            font-size: 11px;

            font-weight: 600;
        }


        /* ==================================================
           BOOK GRID
        ================================================== */

        .book-grid {

            display: grid;

            grid-template-columns:
                repeat(auto-fill, minmax(200px, 1fr));

            gap: 20px;
        }


        /* ==================================================
           BOOK CARD
        ================================================== */

        .book-card {

            background: white;

            border: 1px solid #e5e7eb;

            border-radius: 13px;

            overflow: hidden;

            transition:
                transform 0.25s ease,
                box-shadow 0.25s ease,
                border-color 0.25s ease;
        }


        .book-card:hover {

            transform: translateY(-5px);

            border-color: #c7d2fe;

            box-shadow:
                0 15px 30px rgba(15,23,42,0.09);
        }


        .book-image-container {

            position: relative;

            height: 250px;

            background: #f1f5f9;

            overflow: hidden;
        }


        .book-image {

            width: 100%;

            height: 100%;

            object-fit: cover;

            transition: transform 0.35s ease;
        }


        .book-card:hover .book-image {

            transform: scale(1.04);
        }


        .stock-badge {

            position: absolute;

            top: 10px;

            right: 10px;

            padding: 5px 8px;

            border-radius: 5px;

            font-size: 9px;

            font-weight: 700;

            background: white;

            box-shadow:
                0 3px 10px rgba(0,0,0,0.10);
        }


        .stock-available {

            color: #15803d;
        }


        .stock-out {

            color: #dc2626;
        }


        /* ==================================================
           BOOK DETAILS
        ================================================== */

        .book-details {

            padding: 16px;
        }


        .book-title {

            font-size: 14px;

            font-weight: 700;

            color: #111827;

            line-height: 1.4;

            margin-bottom: 5px;

            display: -webkit-box;

            -webkit-line-clamp: 2;

            -webkit-box-orient: vertical;

            overflow: hidden;
        }


        .book-author {

            color: #6b7280;

            font-size: 11px;

            margin-bottom: 14px;

            white-space: nowrap;

            overflow: hidden;

            text-overflow: ellipsis;
        }


        .book-bottom {

            display: flex;

            align-items: center;

            justify-content: space-between;

            gap: 8px;
        }


        .book-price {

            font-size: 16px;

            font-weight: 800;

            color: #111827;
        }


        .book-price::first-letter {

            color: #4f46e5;
        }


        /* ==================================================
           CART BUTTON
        ================================================== */

        .cart-button {

            text-decoration: none;

            background: #4f46e5;

            color: white;

            padding: 8px 11px;

            border-radius: 7px;

            font-size: 10px;

            font-weight: 700;

            transition: 0.2s;

            white-space: nowrap;
        }


        .cart-button:hover {

            background: #4338ca;

            transform: translateY(-1px);
        }


        .login-buy {

            text-decoration: none;

            background: #f3f4f6;

            color: #4f46e5;

            padding: 8px 11px;

            border-radius: 7px;

            font-size: 10px;

            font-weight: 700;

            white-space: nowrap;

            transition: 0.2s;
        }


        .login-buy:hover {

            background: #e0e7ff;
        }


        .disabled-button {

            background: #f3f4f6;

            color: #9ca3af;

            padding: 8px 11px;

            border-radius: 7px;

            font-size: 10px;

            font-weight: 700;

            white-space: nowrap;
        }


        /* ==================================================
           EMPTY STATE
        ================================================== */

        .empty-state {

            text-align: center;

            background: white;

            border: 1px dashed #d1d5db;

            border-radius: 14px;

            padding: 60px 20px;
        }


        .empty-icon {

            font-size: 38px;

            margin-bottom: 12px;
        }


        .empty-state h3 {

            font-size: 17px;

            margin-bottom: 6px;
        }


        .empty-state p {

            color: #6b7280;

            font-size: 12px;
        }


        /* ==================================================
           FOOTER
        ================================================== */

        footer {

            border-top: 1px solid #e5e7eb;

            background: white;

            padding: 24px 20px;

            text-align: center;

            color: #9ca3af;

            font-size: 10.5px;
        }


        footer strong {

            color: #4f46e5;
        }


        /* ==================================================
           RESPONSIVE
        ================================================== */

        @media (max-width: 700px) {

            .navbar {

                height: auto;

                min-height: 62px;

                padding: 12px 18px;

                gap: 10px;
            }


            .nav-right {

                gap: 3px;
            }


            .nav-link {

                padding: 7px 8px;

                font-size: 10px;
            }


            .nav-button {

                padding: 8px 10px;

                font-size: 10px;
            }


            .hero {

                padding: 55px 22px 60px;
            }


            .hero h1 {

                letter-spacing: -1.5px;
            }


            .hero p {

                font-size: 12px;
            }


            .books-section {

                padding: 40px 18px 55px;
            }


            .section-header {

                align-items: flex-start;

                gap: 10px;
            }


            .book-grid {

                grid-template-columns:
                    repeat(2, minmax(0, 1fr));

                gap: 13px;
            }


            .book-image-container {

                height: 210px;
            }


            .book-details {

                padding: 12px;
            }


            .book-title {

                font-size: 12px;
            }


            .book-author {

                font-size: 10px;

                margin-bottom: 11px;
            }


            .book-price {

                font-size: 14px;
            }


            .cart-button,
            .login-buy,
            .disabled-button {

                padding: 7px 8px;

                font-size: 9px;
            }
        }


        @media (max-width: 390px) {

            .nav-link {

                display: none;
            }


            .book-grid {

                grid-template-columns: 1fr 1fr;
            }


            .book-image-container {

                height: 185px;
            }
        }

    </style>

</head>


<body>


<!-- ==================================================
     NAVIGATION
================================================== -->

<%

    HttpSession sess = request.getSession(false);

%>


<nav class="navbar">


    <a href="index.jsp" class="logo">

        DC<span>Library</span>

    </a>


    <div class="nav-right">


        <%

            if (sess != null && sess.getAttribute("user") != null) {

                com.library.model.User currentUser =
                    (com.library.model.User) sess.getAttribute("user");

        %>


            <a href="cart.jsp" class="nav-link">

                🛒 Cart

            </a>


            <a href="orders.jsp" class="nav-link">

                Orders

            </a>


            <span class="nav-link">

                Hi, <%= currentUser.getName() %>

            </span>


            <a href="logout" class="nav-link logout">

                Logout

            </a>


        <%

            } else {

        %>


            <a href="login.jsp" class="nav-link">

                Login

            </a>


            <a href="signup.jsp" class="nav-button">

                Create Account

            </a>


        <%

            }

        %>


    </div>

</nav>


<!-- ==================================================
     HERO
================================================== -->

<section class="hero">

    <div class="hero-content">


        <div class="hero-badge">

            📚 Your digital library

        </div>


        <h1>

            Discover your next

            <span>great read.</span>

        </h1>


        <p>

            Explore our collection of books, discover new stories,
            and build your personal collection — all in one place.

        </p>


        <div class="hero-actions">

            <a href="#books" class="hero-primary">

                Explore Books ↓

            </a>


            <%

                if (sess == null || sess.getAttribute("user") == null) {

            %>

                <a href="signup.jsp" class="hero-secondary">

                    Join DC Library

                </a>

            <%

                }

            %>

        </div>


    </div>

</section>


<!-- ==================================================
     BOOK SECTION
================================================== -->

<section class="books-section" id="books">


    <%

        List<Book> books = BookDAO.getAllBooks();

    %>


    <div class="section-header">


        <div class="section-title">

            <h2>

                Available Books

            </h2>

            <p>

                Find something worth reading.

            </p>

        </div>


        <div class="book-count">

            <%= books.size() %> book(s)

        </div>


    </div>


    <%

        if (books == null || books.isEmpty()) {

    %>


        <div class="empty-state">

            <div class="empty-icon">

                📚

            </div>


            <h3>

                No books available yet

            </h3>


            <p>

                Check back soon for new additions to the library.

            </p>

        </div>


    <%

        } else {

    %>


        <div class="book-grid">


            <%

                for (Book b : books) {


                    String img = b.getImageUrl();


                    if (img == null || img.trim().isEmpty()) {

                        img =
                            "https://picsum.photos/id/237/200/280";
                    }


                    boolean available =
                        b.getQuantity() > 0;

            %>


            <article class="book-card">


                <!-- BOOK IMAGE -->

                <div class="book-image-container">


                    <img

                        src="<%= img %>"

                        class="book-image"

                        alt="<%= b.getTitle() %>">


                    <%

                        if (available) {

                    %>

                        <span class="stock-badge stock-available">

                            In Stock

                        </span>

                    <%

                        } else {

                    %>

                        <span class="stock-badge stock-out">

                            Out of Stock

                        </span>

                    <%

                        }

                    %>

                </div>


                <!-- BOOK DETAILS -->

                <div class="book-details">


                    <div class="book-title">

                        <%= b.getTitle() %>

                    </div>


                    <div class="book-author">

                        <%= b.getAuthor() %>

                    </div>


                    <div class="book-bottom">


                        <div class="book-price">

                            ₹<%= b.getPrice() %>

                        </div>


                        <%

                            if (available) {


                                if (sess != null &&
                                    sess.getAttribute("user") != null) {

                        %>


                            <a

                                href="addToCart?bookId=<%= b.getId() %>"

                                class="cart-button">

                                Add to Cart

                            </a>


                        <%

                                } else {

                        %>


                            <a

                                href="login.jsp"

                                class="login-buy">

                                Login to Buy

                            </a>


                        <%

                                }


                            } else {

                        %>


                            <span class="disabled-button">

                                Unavailable

                            </span>


                        <%

                            }

                        %>


                    </div>

                </div>


            </article>


            <%

                }

            %>


        </div>


    <%

        }

    %>


</section>


<!-- ==================================================
     FOOTER
================================================== -->

<footer>

    © <%= java.time.Year.now() %>
    <strong>DC Library</strong>.
    Read. Discover. Grow.

</footer>


</body>

</html>
