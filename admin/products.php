<?php
include '../db.php';

// Add product
if (isset($_POST['add_product'])) {
    $name = $_POST['name'];
    $desc = $_POST['description'];
    $price = $_POST['price'];
    $stock = $_POST['stock'];

    $image = null;
    if (!empty($_FILES['image']['name'])) {
        $image = $_FILES['image']['name'];
        $target = "../uploads/" . basename($image);
        if (!move_uploaded_file($_FILES['image']['tmp_name'], $target)) {
            echo "<p style='color:red;'>Failed to upload image.</p>";
            $image = null;
        }
    }

    if ($image) {
        $stmt = $conn->prepare("INSERT INTO products (name, description, price, stock, image) VALUES (?, ?, ?, ?, ?)");
        $stmt->bind_param("ssdis", $name, $desc, $price, $stock, $image);
        $stmt->execute();
    }
    header("Location: " . $_SERVER['PHP_SELF'] . "?page=products");
    exit();
}

// Delete product
if (isset($_POST['delete_product'])) {
    $id = intval($_POST['delete_id']);
    $conn->query("DELETE FROM products WHERE id = $id");
    header("Location: " . $_SERVER['PHP_SELF'] . "?page=products");
    exit();
}

// Edit product
if (isset($_POST['edit_product'])) {
    $id = intval($_POST['edit_id']);
    $name = $_POST['edit_name'];
    $desc = $_POST['edit_description'];
    $price = $_POST['edit_price'];
    $stock = $_POST['edit_stock'];

    $result = $conn->query("SELECT image FROM products WHERE id = $id");
    $row = $result->fetch_assoc();
    $current_image = $row['image'];

    $image = $current_image;
    if (!empty($_FILES['edit_image']['name'])) {
        $image = $_FILES['edit_image']['name'];
        $target = "../uploads/" . basename($image);
        if (!move_uploaded_file($_FILES['edit_image']['tmp_name'], $target)) {
            echo "<p style='color:red;'>Failed to upload new image.</p>";
            $image = $current_image;
        }
    }

    $stmt = $conn->prepare("UPDATE products SET name=?, description=?, price=?, stock=?, image=? WHERE id=?");
    $stmt->bind_param("ssdssi", $name, $desc, $price, $stock, $image, $id);
    $stmt->execute();

    header("Location: " . $_SERVER['PHP_SELF'] . "?page=products");
    exit();
}

// Search logic
$search = $_GET['search'] ?? '';
$search_sql = "";
if ($search) {
    $search_escaped = $conn->real_escape_string($search);
    $search_sql = " WHERE name LIKE '%$search_escaped%' OR description LIKE '%$search_escaped%'";
}
$products = $conn->query("SELECT * FROM products $search_sql ORDER BY id DESC");
?>

<style>
  .product-form, .search-box {
    margin-bottom: 30px;
    padding: 15px;
    border: 1px solid #ccc;
    background: rgba(144, 92, 44, 0);
    max-width: 1100px;
  }

  .product-grid {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
  }

  .product-card {
    width: 250px;
    border: 1px solid #ddd;
    border-radius: 10px;
    overflow: hidden;
    background: #fff;
    box-shadow: 0 2px 6px rgba(0,0,0,0.1);
  }

  .product-card img {
    width: 100%;
    height: 180px;
    object-fit: cover;
  }

  .product-card .content {
    padding: 15px;
  }

  .product-card h4 {
    margin: 0 0 5px;
  }

  .product-card p {
    font-size: 14px;
    color: #333;
    margin: 5px 0;
  }

  .product-card form, .product-card .actions {
    text-align: right;
  }

  .product-card button, .product-card .edit-btn {
    background: #e74c3c;
    color: #fff;
    border: none;
    padding: 6px 10px;
    cursor: pointer;
    border-radius: 4px;
    font-weight: bold;
  }

  .product-card button:hover, .product-card .edit-btn:hover {
    background: #c0392b;
  }

  .product-card .edit-btn {
    background: #3fa64b;
    margin-right: 6px;
  }

  .modal {
    display: none;
    position: fixed;
    z-index: 9999;
    left: 0; top: 0; width: 100%; height: 100%;
    overflow: auto;
    background-color: rgba(0,0,0,0.5);
  }

  .modal-content {
    background-color: #fefefe;
    margin: 8% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 400px;
    border-radius: 10px;
  }

  .modal-content input, .modal-content textarea {
    width: 100%;
    padding: 8px;
    margin: 8px 0 15px 0;
    box-sizing: border-box;
  }

  .modal-content label {
    font-weight: bold;
  }

  .modal-close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
  }

  .modal-close:hover {
    color: black;
  }

  /* Align heading + search */
  .product-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 1100px;
    margin: 20px 0;
  }

  .search-box {
    display: flex;
    align-items: center;
    gap: 10px;
    margin: 0;
    padding: 0;
    border: none;
    background: none;
  }

  .search-box input[type="text"] {
    padding: 8px;
    font-size: 16px;
    width: 300px;
    border-radius: 18px;
    border: 1px solid #ccc;
  }

  .search-box button {
    padding: 8px 14px;
    font-size: 16px;
    border-radius: 18px;
    border: none;
    background-color: rgb(144,92,44);
    color: white;
    cursor: pointer;
  }

  .search-box button:hover {
    background-color: rgb(120, 70, 30);
  }
  .product-form input[type="text"],
  .product-form input[type="number"],
  .product-form input[type="file"] {
    padding: 10px 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 18px;
    transition: border-color 0.3s, box-shadow 0.3s;
  }

  .product-form input:focus {
    border-color: rgb(120, 70, 30);
    outline: none;
    box-shadow: 0 0 5px rgba(76, 175, 80, 0.3);
  }

  .product-form button {
    background-color: rgb(120, 70, 30);
    color: white;
    border: none;
    padding: 14px;
    font-size: 16px;
    border-radius: 18px;
    cursor: pointer;
    transition: background-color 0.3s ease;
  }

  .product-form button:hover {
    background-color: #45a049;
  }
</style>

<h2>Add a Product</h2>
<form method="POST" enctype="multipart/form-data" class="product-form">
  <input type="text" name="name" placeholder="Product Name" required>
  <input type="text" name="description" placeholder="Description" required>
  <input type="number" step="0.01" name="price" placeholder="Price" required>
  <input type="number" name="stock" placeholder="Stock" required>
  <input type="file" name="image" accept="image/*" required>
  <button type="submit" name="add_product">Add Product</button>
</form>

<div class="product-header">
  <h2>Product List</h2>
  <form method="GET" action="" class="search-box">
    <input type="hidden" name="page" value="products">
    <input type="text" name="search" placeholder="Search products..." value="<?= htmlspecialchars($search) ?>">
    <button type="submit">Search</button>
    <button type="button" onclick="window.location.href='?page=products'">Clear</button>
  </form>
</div>

<div class="product-grid">
  <?php while($row = $products->fetch_assoc()): ?>
  <div class="product-card" data-id="<?= $row['id'] ?>">
    <img src="../uploads/<?= htmlspecialchars($row['image']) ?>" alt="Product Image">
    <div class="content">
      <h4><?= htmlspecialchars($row['name']) ?></h4>
      <p><?= htmlspecialchars($row['description']) ?></p>
      <p><strong>₱<?= number_format($row['price'], 2) ?></strong></p>
      <p>Stock: <?= $row['stock'] ?></p>
      <div class="actions">
        <button class="edit-btn" 
          data-id="<?= $row['id'] ?>"
          data-name="<?= htmlspecialchars($row['name'], ENT_QUOTES) ?>"
          data-description="<?= htmlspecialchars($row['description'], ENT_QUOTES) ?>"
          data-price="<?= $row['price'] ?>"
          data-stock="<?= $row['stock'] ?>"
          data-image="<?= htmlspecialchars($row['image'], ENT_QUOTES) ?>"
        >Edit</button>
        <form method="POST" style="display:inline;" onsubmit="return confirm('Delete this product?');">
          <input type="hidden" name="delete_id" value="<?= $row['id'] ?>">
          <button type="submit" name="delete_product">Delete</button>
        </form>
      </div>
    </div>
  </div>
  <?php endwhile; ?>
</div>

<!-- Modal -->
<div id="editModal" class="modal">
  <div class="modal-content">
    <span class="modal-close">&times;</span>
    <h3>Edit Product</h3>
    <form method="POST" enctype="multipart/form-data" id="editForm">
      <input type="hidden" name="edit_id" id="edit_id">
      <label for="edit_name">Product Name</label>
      <input type="text" name="edit_name" id="edit_name" required>

      <label for="edit_description">Description</label>
      <textarea name="edit_description" id="edit_description" required></textarea>

      <label for="edit_price">Price</label>
      <input type="number" step="0.01" name="edit_price" id="edit_price" required>

      <label for="edit_stock">Stock</label>
      <input type="number" name="edit_stock" id="edit_stock" required>

      <label for="edit_image">Replace Image (leave empty to keep current)</label>
      <input type="file" name="edit_image" id="edit_image" accept="image/*">

      <div style="margin-top:15px; text-align:right;">
        <button type="submit" name="edit_product" style="background:#3fa64b; color:#fff; border:none; padding:8px 15px; border-radius:6px; cursor:pointer;">Save Changes</button>
      </div>
    </form>
  </div>
</div>

<script>
  const modal = document.getElementById('editModal');
  const closeBtn = modal.querySelector('.modal-close');

  closeBtn.onclick = () => {
    modal.style.display = "none";
  };

  window.onclick = (event) => {
    if (event.target === modal) {
      modal.style.display = "none";
    }
  };

  document.querySelectorAll('.edit-btn').forEach(btn => {
    btn.onclick = () => {
      document.getElementById('edit_id').value = btn.dataset.id;
      document.getElementById('edit_name').value = btn.dataset.name;
      document.getElementById('edit_description').value = btn.dataset.description;
      document.getElementById('edit_price').value = btn.dataset.price;
      document.getElementById('edit_stock').value = btn.dataset.stock;
      modal.style.display = "block";
    };
  });
</script>
