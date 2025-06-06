<link rel="icon" href="logo.jpg" type="image/x-icon">
<?php
include 'db.php';
$products = $conn->query("SELECT * FROM products");
$slideshowImages = array_slice(
    glob("uploads/*.{jpg,jpeg,png,gif,webp}", GLOB_BRACE),
    0, 5
);
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Farmer's Brew</title>
  <style>
    html {
      scroll-behavior: smooth;
    }
    * { box-sizing: border-box; }

    body {
      margin: 0;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-image: url('background.jpg');
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      background-attachment: fixed;
      min-height: 100vh;
    }

    body::before {
      content: "";
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(144, 92, 44, 0.58);
      z-index: -1;
    }

    header {
      position: fixed;
      top: 0;
      width: 100%;
      background-color: rgb(144,92,44);
      color: white;
      padding: 1rem 2rem;
      display: flex;
      justify-content: space-between;
      align-items: center;
      z-index: 1000;
      flex-wrap: wrap;
      gap: 1rem;
    }

    header h1 {
      margin: 0;
      font-size: 1.5rem;
      flex: 1 1 auto;
    }

    .navbar-controls {
      display: flex;
      align-items: center;
      gap: 0.5rem;
      flex-wrap: wrap;
      position: relative;
    }

    .search-wrapper {
      position: relative;
      width: 240px;
    }

    .search-wrapper input {
      width: 100%;
      padding: 0.5rem 2.5rem 0.5rem 1rem;
      border-radius: 18px;
      border: none;
      font-size: 1rem;
    }

    .search-wrapper .icon-btn {
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      background: none;
      border: none;
      cursor: pointer;
      font-size: 1rem;
      color: #333;
    }

    .search-wrapper .search-icon { right: 30px; }
    .search-wrapper .clear-icon { right: 5px; font-weight: bold; }

    .navbar-controls a button, .navbar-controls a.about-btn {
      padding: 0.5rem 1rem;
      background-color: rgb(144,92,44);
      color: white; 
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-weight: bold;
      text-decoration: none;
    }

    .navbar-controls a button:hover,
    .navbar-controls a.about-btn:hover {
      background-color: rgb(146, 103, 62);
    }

    .spacer { height: 100px; }

    .slideshow-wrapper {
      overflow: hidden;
      width: 100%;
      padding: 1rem 0;
      position: relative;
    }

    .slideshow-track {
      display: flex;
      gap: 10px;
      animation: scroll-left 30s linear infinite;
      width: max-content;
    }

    .slideshow-track img {
      height: 300px;
      width: auto;
      border-radius: 10px;
      object-fit: cover;
      flex-shrink: 0;
    }

    @keyframes scroll-left {
      0% { transform: translateX(0); }
      100% { transform: translateX(-50%); }
    }

    .products-container {
      display: flex;
      flex-direction: column;
      gap: 2rem;
      padding: 2rem;
    }

    .product-card {
      display: flex;
      background-color: rgba(0, 0, 0, 0.4);
      border-radius: 10px;
      padding: 1rem;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.5);
      transition: transform 0.2s;
      gap: 2rem;
      align-items: center;
      width: 100%;
    }

    .product-card:hover {
      transform: scale(1.01);
    }

    .product-image img {
      width: 400px;
      height: 400px;
      object-fit: cover;
      border-radius: 8px;
    }

    .product-info {
      flex: 1;
      color: white;
    }

    .product-info h2 {
      font-size: 1.8rem;
      margin: 0.5rem 0;
      font-weight: 500;
    }

    .product-info p {
      font-size: 1.1rem;
      color: #f0f0f0;
      margin: 0.25rem 0;
      font-weight: 300;
    }

    .price { color: #c8f5c3; font-size: 1.2rem; font-weight: 400; }
    .stock { color: #dddddd; font-size: 1rem; font-weight: 300; }

    @media (max-width: 768px) {
      header { flex-direction: column; align-items: flex-start; }
      .product-card { flex-direction: column !important; text-align: center; }
      .product-image img { width: 100%; height: auto; }
      .navbar-controls { width: 100%; }
      .search-wrapper { width: 100%; }
      .slideshow-track img { height: 200px; }
    }

    .logo-title {
      display: flex;
      align-items: center;
      gap: 1rem;
      flex: 1 1 auto;
    }

    .logo-title img {
      height: 60px;
      width: auto;
      border-radius: 8px;
    }

    .menu-images {
      display: flex;
      justify-content: center; 
      align-items: center;
      gap: 40px;
      padding: 2rem;
      flex-wrap: wrap;
    }

    .menu-img {
      width: 45%;
      max-width: 450px;
      height: auto;
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0,0,0,0.4);
      object-fit: cover;
    }

    @media (max-width: 768px) {
      .menu-images {
        flex-direction: column;
        gap: 20px;
      }

      .menu-img {
        width: 100%;
      }
      .menu-video {
        width: 100%;
        max-width: 1000px;
        border-radius: 10px;
        margin-bottom: 1rem;
        box-shadow: 0 0 10px rgba(0,0,0,0.4);
      }
    }

    #about {
      background-color: rgba(0, 0, 0, 0.7);
      color: white;
      padding: 3rem 2rem;
      text-align: center;
    }

    #about h2 {
      font-size: 2rem;
      margin-bottom: 1rem;
    }

    #about p {
      font-size: 1.1rem;
      margin: 0.5rem 0;
    }

    #about iframe {
      width: 100%;
      max-width: 600px;
      height: 300px;
      border: 0;
      margin-top: 1rem;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0,0,0,0.5);
    }
  </style>
</head>
<body>

  <header>
    <div class="logo-title">
      <img src="logo.jpg" alt="Logo">
      <h1>Farmer's Brew</h1>
    </div>
    <div class="navbar-controls">
      <div class="search-wrapper">
        <input type="text" id="searchInput" placeholder="Search products...">
        <button class="icon-btn search-icon" onclick="searchProducts()">🔍︎</button>
        <button class="icon-btn clear-icon" onclick="clearSearch()">✖</button>
      </div>
      <a href="#about"><button>About Us</button></a>
      <a href="login.php"><button>Login to Order</button></a>     
    </div>
  </header>

  <div class="spacer"></div>

  <div class="slideshow-wrapper">
    <div class="slideshow-track">
      <?php foreach ($slideshowImages as $image): ?>
        <img src="<?= $image ?>" alt="Slideshow Image">
      <?php endforeach; ?>
      <?php foreach ($slideshowImages as $image): ?>
        <img src="<?= $image ?>" alt="Slideshow Image">
      <?php endforeach; ?>
    </div>
  </div>

  <?php
$menuImages = glob("featured/pics/*.{jpg,jpeg,png,gif,webp}", GLOB_BRACE);
$menuVideos = glob("featured/videos/*.{mp4,webm,ogg}", GLOB_BRACE);
?>

<div class="menu-images">
  <?php foreach ($menuVideos as $video): ?>
    <video class="menu-video" controls autoplay muted loop>
      <source src="<?= htmlspecialchars($video) ?>" type="video/mp4">
      Your browser does not support the video tag.
    </video>
  <?php endforeach; ?>
  <?php foreach ($menuImages as $img): ?>
    <img src="<?= htmlspecialchars($img) ?>" alt="Menu Image" class="menu-img">
  <?php endforeach; ?>
</div>


  <div class="products-container" id="productContainer">
    <?php 
    $i = 0;
    while ($row = $products->fetch_assoc()): 
      $i++;
      $imageOnLeft = $i % 2 == 0;
    ?>
      <div class="product-card" style="flex-direction: <?= $imageOnLeft ? 'row' : 'row-reverse' ?>;">
        <div class="product-image">
          <img src="uploads/<?= htmlspecialchars($row['image']) ?>" alt="<?= htmlspecialchars($row['name']) ?>">
        </div>
        <div class="product-info">
          <h2><?= htmlspecialchars($row['name']) ?></h2>
          <p class="price">₱<?= number_format($row['price'], 2) ?></p>
          <p class="stock">Stock: <?= $row['stock'] ?></p>
          <p><?= htmlspecialchars($row['description']) ?></p>
        </div>
      </div>
    <?php endwhile; ?>
  </div>

  <div id="about">
    <h2>About Us</h2>
    <p>📍 Address: 0405 Millaflor Subdivision, Burol 1st, Balagtas, Bulacan</p>
    <p>📞 Contact: 0915 097 5093</p>
    <p>✅ Facebook: Farmer's Brew</p>
    <p>📧 Email: farmersbrew@gmail.com</p>
  </div>

  <script>
    function searchProducts() {
      const input = document.getElementById('searchInput').value.toLowerCase();
      const cards = document.querySelectorAll('.product-card');
      cards.forEach(card => {
        const name = card.querySelector('.product-info h2').textContent.toLowerCase();
        card.style.display = name.includes(input) ? 'flex' : 'none';
      });
    }

    function clearSearch() {
      document.getElementById('searchInput').value = '';
      searchProducts();
    }
  </script>

</body>
</html>
