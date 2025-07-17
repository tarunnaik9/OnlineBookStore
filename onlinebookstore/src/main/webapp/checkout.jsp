<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Checkout</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f4f4f4;
            padding: 40px;
        }

        .checkout-box {
            background: white;
            max-width: 700px;
            margin: auto;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            color: green;
        }

        label {
            display: block;
            margin-top: 20px;
            font-weight: bold;
        }

        input, select, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #aaa;
        }

        .payment-section {
            margin-top: 25px;
        }

        .btn {
            margin-top: 30px;
            width: 100%;
            padding: 12px;
            background-color: #28a745;
            color: black;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
    <script>
        function toggleCard(method) {
            document.getElementById('card-details').style.display = (method === 'card') ? 'block' : 'none';
        }
    </script>
</head>
<body>
    <div class="checkout-box">
        <h2>🧾 Checkout & Shipping</h2>
        
        <!-- ✅ Updated: Proper form POST -->
        <form action="thankyou.jsp" method="post">
            <label for="fullname">Full Name</label>
            <input type="text" name="fullname" id="fullname" required>

            <label for="address">Shipping Address</label>
            <textarea name="address" id="address" rows="3" required></textarea>

            <label for="contact">Mobile Number</label>
            <input type="tel" name="contact" id="contact" required pattern="[0-9]{10}" placeholder="10-digit number">

            <div class="payment-section">
                <label for="payment">Select Payment Method</label>
                <select name="payment" id="payment" onchange="toggleCard(this.value)" required>
                    <option value="">--Select--</option>
                    <option value="cod">Cash on Delivery</option>
                    <option value="card">Credit / Debit Card</option>
                </select>

                <div id="card-details" style="display:none;">
                    <label for="cardNumber">Card Number</label>
                    <input type="text" id="cardNumber" maxlength="16" pattern="\d{16}" placeholder="Enter 16-digit card number">

                    <label for="expiry">Expiry Date (MM/YY)</label>
                    <input type="text" id="expiry" placeholder="MM/YY">

                    <label for="cvv">CVV</label>
                    <input type="password" id="cvv" maxlength="3" pattern="\d{3}">
                </div>
            </div>

            <button type="submit" class="btn">✅ Confirm & Place order</button>
        </form>
    </div>
</body>
</html>

