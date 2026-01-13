const express = require("express");
const router = express.Router();
const db = require("../config/db");

/**
 * GET /get
 * Ambil semua produk
 */
router.get("/", (req, res) => {
  const query = `SELECT 
      products.id,
      products.name,
      products.price,
      stocks.quantity
    FROM products
    LEFT JOIN stocks ON stocks.product_id = products.id`;
  db.query(query, (err, results) => {
    if (err) return res.status(500).json(err);
    res.json(results);
  });
});

/**
 * POST /add
 * Tambah produk
 */
router.post("/create", (req, res) => {
  const { name, price, quantity } = req.body;

  db.query(
    "INSERT INTO products (name, price) VALUES (?, ?)",
    [name, price],
    (err, result) => {
      if (err) return res.status(500).json(err);

      const productId = result.insertId;

      db.query(
        "INSERT INTO stocks (product_id, quantity) VALUES (?, ?)",
        [productId, quantity],
        (err) => {
          if (err) return res.status(500).json(err);
          res.json({ message: "Produk & stok berhasil ditambahkan" });
        }
      );
    }
  );
});

/**
 * GET /:id/edit
 * Ambil produk by ID
 */
router.get("/:id/edit", (req, res) => {
  const { id } = req.params;

  db.query("SELECT * FROM products WHERE id = ?", [id], (err, result) => {
    if (err) return res.status(500).json(err);
    res.json(result[0]);
  });
});

/**
 * PUT /:id/update
 * Update produk
 */
router.put("/:id/update", (req, res) => {
  const { id } = req.params;
  const { name, price } = req.body;

  db.query(
    "UPDATE products SET name = ?, price = ? WHERE id = ?",
    [name, price, id],
    (err) => {
      if (err) return res.status(500).json(err);
      res.json({ message: "Produk berhasil diupdate" });
    }
  );
});

/**
 * DELETE /:id/delete
 * Hapus produk
 */
router.delete("/:id/delete", (req, res) => {
  const { id } = req.params;

  db.query("DELETE FROM products WHERE id = ?", [id], (err) => {
    if (err) return res.status(500).json(err);
    res.json({ message: "Produk berhasil dihapus" });
  });
});

module.exports = router;
