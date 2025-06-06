<?php
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}
include '../db.php';

if (!isset($_SESSION['user']) || $_SESSION['user']['role'] !== 'customer') {
    header("Location: ../login.php");
    exit();
}

$user = $_SESSION['user'];
$customerName = $user['first_name'];

$pendingStmt = $conn->prepare("SELECT * FROM orders WHERE name = ? ORDER BY order_date DESC");
$pendingStmt->bind_param("s", $customerName);
$pendingStmt->execute();
$pendingOrders = $pendingStmt->get_result();

$completedStmt = $conn->prepare("SELECT * FROM completed_orders WHERE name = ? ORDER BY completed_date DESC");
$completedStmt->bind_param("s", $customerName);
$completedStmt->execute();
$completedOrders = $completedStmt->get_result();
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Your Orders - Lyneth's Garden</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      margin: 0;
      background: rgba(144, 92, 44, 0.3);
      padding: 20px;
    }
    h2 {
      color: rgb(144,92,44);
      text-align: center;
      margin-bottom: 20px;
    }
    .section-container {
      display: flex;
      justify-content: space-between;
      flex-wrap: wrap;
      gap: 20px;
      max-width: 1200px;
      margin: auto;
    }
    .order-list {
      flex: 1;
      min-width: 500px;
      background: white;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }
    .order-list h3 {
      margin-bottom: 15px;
      color: rgb(144,92,44);
      border-bottom: 2px solid rgb(144,92,44);
      padding-bottom: 5px;
    }
    .order-item {
      border-bottom: 1px solid #ccc;
      padding: 15px 0;
      position: relative;
    }
    .order-item:last-child {
      border-bottom: none;
    }
    .order-item h4 {
      margin: 0 0 10px;
      color: rgb(144,92,44)b;
    }
    .order-item p {
      margin: 5px 0;
      font-size: 14px;
    }
    .status {
      font-weight: bold;
    }
    .pending {
      color: #c98500;
    }
    .completed {
      color: rgb(144,92,44);
    }
    .no-orders {
      font-style: italic;
      text-align: center;
      color: #666;
    }
    .print-receipt-btn, .cancel-request-btn {
      position: relative;
      background-color: rgb(144,92,44);
      color: white;
      border: none;
      padding: 6px 12px;
      border-radius: 5px;
      cursor: pointer;
      font-size: 13px;
      margin-right: 5px;
    }
    .print-receipt-btn:hover, .cancel-request-btn:hover {
      background-color: rgb(144,92,44);
    }
    #cancelModal {
      display: none;
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: #00000088;
      z-index: 9999;
      align-items: center;
      justify-content: center;
    }
    #cancelModal form {
      background: white;
      padding: 20px;
      border-radius: 10px;
      width: 300px;
    }
  </style>
</head>
<body>

<h2>Your Order History</h2>

<div class="section-container">
  <div class="order-list">
    <h3>Pending Orders</h3>
    <?php if ($pendingOrders->num_rows > 0): ?>
      <?php while ($order = $pendingOrders->fetch_assoc()): ?>
        <div class="order-item"
          data-product="<?= htmlspecialchars($order['product_name']) ?>"
          data-quantity="<?= $order['quantity'] ?>"
          data-total="<?= $order['total_price'] ?>"
          data-status="<?= $order['status'] ?>"
          data-date="<?= $order['order_date'] ?>"
          data-customer="<?= htmlspecialchars($customerName) ?>"
          data-address="<?= htmlspecialchars($order['address']) ?>"
          data-order-type="pending">
          <h4><?= htmlspecialchars($order['product_name']) ?></h4>
          <p>Quantity: <?= $order['quantity'] ?></p>
          <p>Total Price: ₱<?= number_format($order['total_price'], 2) ?></p>
          <p>Delivery Address: <?= htmlspecialchars($order['address']) ?></p>
          <p>Estimated Delivery: <?= htmlspecialchars($order['estimated_date']) ?></p>
          <p>Status: <span class="status pending"><?= $order['status'] ?></span></p>
          <p>Ordered on: <?= date("F j, Y g:i A", strtotime($order['order_date'])) ?></p>
          <button class="print-receipt-btn" onclick="printReceipt(this)">Receipt</button>
          <button class="cancel-request-btn" data-order-id="<?= $order['id'] ?>" data-customer-name="<?= htmlspecialchars($customerName) ?>">Request Cancellation</button>
        </div>
      <?php endwhile; ?>
    <?php else: ?>
      <p class="no-orders">You have no pending orders.</p>
    <?php endif; ?>
  </div>

  <div class="order-list">
    <h3>Completed Orders</h3>
    <?php if ($completedOrders->num_rows > 0): ?>
      <?php while ($order = $completedOrders->fetch_assoc()): ?>
        <div class="order-item"
          data-product="<?= htmlspecialchars($order['product_name']) ?>"
          data-quantity="<?= $order['quantity'] ?>"
          data-total="<?= $order['total_price'] ?>"
          data-status="<?= $order['status'] ?>"
          data-date="<?= $order['completed_date'] ?>"
          data-customer="<?= htmlspecialchars($customerName) ?>"
          data-address="<?= htmlspecialchars($order['address']) ?>"
          data-order-type="completed">
          <h4><?= htmlspecialchars($order['product_name']) ?></h4>
          <p>Quantity: <?= $order['quantity'] ?></p>
          <p>Total Price: ₱<?= number_format($order['total_price'], 2) ?></p>
          <p>Delivery Address: <?= htmlspecialchars($order['address']) ?></p>
          <p>Status: <span class="status completed"><?= $order['status'] ?></span></p>
          <p>Completed on: <?= date("F j, Y g:i A", strtotime($order['completed_date'])) ?></p>
          <button class="print-receipt-btn" onclick="printReceipt(this)">Receipt</button>
        </div>
      <?php endwhile; ?>
    <?php else: ?>
      <p class="no-orders">You have no completed orders.</p>
    <?php endif; ?>
  </div>
</div>

<div id="cancelModal">
  <form method="POST" action="submit_cancellation.php">
    <h3>Cancel Order</h3>
    <input type="hidden" name="order_id" id="modalOrderId">
    <input type="hidden" name="customer_name" id="modalCustomerName">
    <label for="cancelReason">Reason:</label>
    <textarea name="reason" id="cancelReason" required></textarea><br><br>
    <button type="submit">Submit</button>
    <button type="button" onclick="document.getElementById('cancelModal').style.display='none'">Close</button>
  </form>
</div>

<script>
function printReceipt(button) {
  const orderItem = button.closest('.order-item');
  const product = orderItem.dataset.product;
  const quantity = orderItem.dataset.quantity;
  const total = orderItem.dataset.total;
  const status = orderItem.dataset.status;
  const date = orderItem.dataset.date;
  const customer = orderItem.dataset.customer;
  const address = orderItem.dataset.address;
  const type = orderItem.dataset.orderType;

  const title = type === 'pending' ? 'Pending Order Receipt' : 'Completed Order Receipt';

  const html = `
    <html>
    <head>
      <title>${title}</title>
      <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        h2 { color: #3fa64b; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
        th { background-color: #e9f5e9; }
        p { font-size: 16px; }
      </style>
    </head>
    <body>
      <h2>${title}</h2>
      <p><strong>Customer:</strong> ${customer}</p>
      <p><strong>Order Date:</strong> ${date}</p>
      <p><strong>Delivery Address:</strong> ${address}</p>
      <table>
        <thead>
          <tr>
            <th>Product</th>
            <th>Quantity</th>
            <th>Total Price (₱)</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>${product}</td>
            <td>${quantity}</td>
            <td>₱${total}</td>
            <td>${status}</td>
          </tr>
        </tbody>
      </table>
    </body>
    </html>
  `;

  const w = window.open('', '_blank');
  w.document.write(html);
  w.document.close();
  w.focus();
  w.print();
  w.close();
}

document.querySelectorAll('.cancel-request-btn').forEach(btn => {
  btn.addEventListener('click', () => {
    document.getElementById('modalOrderId').value = btn.dataset.orderId;
    document.getElementById('modalCustomerName').value = btn.dataset.customerName;
    document.getElementById('cancelModal').style.display = 'flex';
  });
});
</script>

</body>
</html>
