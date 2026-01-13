const express = require("express");
const router = express.Router();
const db = require("../config/db");

/**
 * GET /purchases
 * List pembelian
 */
router.get("/", (req, res) => {
  const query = `
    SELECT 
      purchases.id,
      products.name,
      products.price,
      purchases.quantity,
      purchases.total_price,
      purchases.status,
      purchases.created_at
    FROM purchases
    JOIN products ON products.id = purchases.product_id
    ORDER BY purchases.created_at DESC
  `;

  db.query(query, (err, results) => {
    if (err) throw err;
    res.json(results);
    // res.render("purchases", { purchases: results });
  });
});

/**
 * GET /purchases/create
 * Form pembelian
 */
router.get("/create", (req, res) => {
  db.query("SELECT * FROM products", (err, products) => {
    if (err) throw err;
    res.json(results);
    // res.render("form-purchase", { products });
  });
});

/**
 * POST /purchases/create
 * Proses pembelian
 */
router.post("/add", (req, res) => {
  const { product_id, quantity } = req.body;

  db.query(
    "SELECT quantity FROM stocks WHERE product_id = ?",
    [product_id],
    (err, stock) => {
      if (err) {
        return res.status(500).json({ message: "Database error" });
      }

      if (!stock.length) {
        return res.status(404).json({ message: "Stock tidak ditemukan" });
      }

      if (stock[0].quantity < quantity) {
        return res.status(400).json({ message: "Stok tidak cukup" });
      }

      db.beginTransaction((err) => {
        if (err) {
          return res.status(500).json({ message: "Transaction error" });
        }

        db.query(
          "SELECT price FROM products WHERE id = ?",
          [product_id],
          (err, product) => {
            if (err || !product.length) {
              return db.rollback(() => {
                res.status(500).json({ message: "Product error" });
              });
            }

            const total = product[0].price * quantity;

            db.query(
              "INSERT INTO purchases (product_id, quantity, total_price) VALUES (?, ?, ?)",
              [product_id, quantity, total],
              (err) => {
                if (err) {
                  return db.rollback(() => {
                    res.status(500).json({ message: "Insert failed" });
                  });
                }

                db.query(
                  "UPDATE stocks SET quantity = quantity - ? WHERE product_id = ?",
                  [quantity, product_id],
                  (err) => {
                    if (err) {
                      return db.rollback(() => {
                        res
                          .status(500)
                          .json({ message: "Update stock failed" });
                      });
                    }

                    db.commit((err) => {
                      if (err) {
                        return db.rollback(() => {
                          res.status(500).json({ message: "Commit failed" });
                        });
                      }

                      return res.json({
                        message: "Purchase berhasil",
                      });
                    });
                  }
                );
              }
            );
          }
        );
      });
    }
  );
});

/**
 * POST /purchases/cancel/:id
 * Cancel pembelian
 */
router.post("/cancel/:id", (req, res) => {
  const id = req.params.id;

  db.beginTransaction((err) => {
    if (err) throw err;

    db.query(
      "SELECT product_id, quantity FROM purchases WHERE id = ?",
      [id],
      (err, purchase) => {
        const { product_id, quantity } = purchase[0];

        db.query("UPDATE purchases SET status = 'CANCELLED' WHERE id = ?", [
          id,
        ]);

        db.query(
          "UPDATE stocks SET quantity = quantity + ? WHERE product_id = ?",
          [quantity, product_id]
        );

        db.commit((err) => {
          if (err)
            return db.rollback(() => {
              throw err;
            });
        });
      }
    );
  });
});

module.exports = router;
