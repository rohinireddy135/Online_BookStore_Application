# DC Library Management (Online Bookstore Application)

A web-based bookstore application where users can browse books, add them to a cart and place orders, and admins can manage the book catalogue.

## Features

**Users**
- Sign up and log in
- Browse books with cover images, price and stock
- Add books to the cart and view the cart
- Place orders and view order history
- Log out

**Admin**
- Admin dashboard
- Add, edit and delete books
- Manage stock and prices

## Technologies Used

- Java 21
- JSP and Servlets (Jakarta EE 10)
- JDBC with MySQL
- Apache Tomcat 10.1
- HTML and CSS
- Eclipse IDE

## Project Structure

- `database/library.sql`: database schema and sample data
- `src/main/java/com/library/model`: Book, User, CartItem, Order
- `src/main/java/com/library/dao`: BookDAO, UserDAO, CartDAO, OrderDAO
- `src/main/java/com/library/servlet`: Login, Signup, Cart, Order and Book servlets
- `src/main/java/com/library/util`: DBConnection
- `src/main/webapp`: JSP pages

## Database

MySQL database `dc_library` with four tables: `users`, `books`, `cart` and `orders`.

## How to Run

1. Install JDK 21, MySQL, Apache Tomcat 10.1 and Eclipse.
2. Clone this repository:
   `git clone https://github.com/rohinireddy135/Online_BookStore_Application.git`
3. Run `database/library.sql` in MySQL to create the database.
4. Open `src/main/java/com/library/util/DBConnection.java` and set your own MySQL username and password.
5. Import the project into Eclipse: File > Import > Existing Projects into Workspace.
6. Right-click the project > Run As > Run on Server > Apache Tomcat v10.1.
7. Open `http://localhost:8080/DC_Library_Management/` in your browser.

## Sample Logins

| Role  | Email           | Password |
|-------|-----------------|----------|
| Admin | admin@gmail.com | admin123 |
| User  | john@gmail.com  | john123  |

## Author

Rohini Reddy
