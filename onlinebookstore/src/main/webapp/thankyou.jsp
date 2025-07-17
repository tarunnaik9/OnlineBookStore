<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Clear cart session
    session.removeAttribute("cart");

    // Get user details from checkout.jsp
    String fullname = request.getParameter("fullname");
    String address = request.getParameter("address");
    String contact = request.getParameter("contact");
    String payment = request.getParameter("payment");

    // Generate a unique Order ID using timestamp
    String orderId = "ORD" + System.currentTimeMillis();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f0fdf5;
            padding: 50px;
            text-align: center;
        }

        .message-box {
            background-color: #d4edda;
            padding: 30px;
            border-radius: 10px;
            display: inline-block;
            box-shadow: 0 0 12px rgba(0,0,0,0.3);
        }

        h2 {
            color: green;
            font-size: 28px;
        }

        .invoice {
            text-align: left;
            background: #fff;
            color: #333;
            margin-top: 25px;
            padding: 20px;
            border-radius: 10px;
            font-size: 16px;
        }

        .invoice h3 {
            margin-top: 0;
            color: #007bff;
        }

        .invoice p {
            margin: 6px 0;
        }

        a {
            display: inline-block;
            margin-top: 20px;
            font-size: 17px;
            color: #007bff;
            text-decoration: none;
        }

        .download-btn {
            margin-top: 20px;
            background-color: #007bff;
            color: white;
            padding: 10px 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }

        .download-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<div class="message-box" id="invoiceBox">
    <h2>✅ Order Placed Successfully!</h2>
    <p>Thank you for shopping at <strong>Online Book Store</strong>.</p>

    <div class="invoice">
        <h3>🧾 Invoice Summary</h3>
        <p><strong>Name:</strong> <%= fullname %></p>
        <p><strong>Address:</strong> <%= address %></p>
        <p><strong>Contact:</strong> <%= contact %></p>
        <p><strong>Payment Mode:</strong> <%= "card".equals(payment) ? "Credit / Debit Card" : "Cash on Delivery" %></p>
        <p><strong>Order ID:</strong> <%= orderId %></p>
        <p><strong>Status:</strong> Confirmed</p>
        <p><strong>Date:</strong> <%= new java.text.SimpleDateFormat("dd-MM-yyyy HH:mm:ss").format(new java.util.Date()) %></p>
    </div>

    <button class="download-btn" onclick="downloadInvoice()">⬇ Download Invoice (PDF)</button>
    <br/>
    <a href="books.jsp">⬅ Continue Shopping</a>
</div>

<script>
    function downloadInvoice() {
        const invoice = document.getElementById("invoiceBox");
        html2pdf().from(invoice).save("Invoice_Order_<%= orderId %>.pdf");
    }
</script>

</body>
</html>
