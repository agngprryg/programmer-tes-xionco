const mysql = require("mysql2");

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "",
  database: "programmer-tes-product",
});

db.connect((err) => {
  if (err) {
    console.error("DB ERROR:", err);
  } else {
    console.log("DB CONNECTED");
  }
});

module.exports = db;
