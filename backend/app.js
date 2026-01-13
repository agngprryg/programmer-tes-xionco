const express = require("express");
const cors = require("cors");
const productRoutes = require("./routes/product.routes");
const purchaseRoutes = require("./routes/purchase.route");

const app = express();
app.set("view engine", "ejs");
app.use(express.urlencoded({ extended: true }));

app.use(
  cors({
    origin: "http://localhost:3000",
  })
);

app.use(express.json());
app.use("/api/products", productRoutes);
app.use("/api/purchase", purchaseRoutes);

app.listen(2000, () => {
  console.log("Backend running on http://localhost:2000");
});
