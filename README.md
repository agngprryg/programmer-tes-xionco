# Technical Test – Admin System (Pembelian & Manajemen Produk)

Repository ini berisi hasil pengerjaan **Technical Test Interview** berupa **Sistem Admin Page** untuk mengelola pembelian dan stok produk.

Pengerjaan dilakukan sesuai dengan ketentuan yang diberikan dan diselesaikan dalam durasi **maksimal 24 jam** sejak arahan pretest diterima.

---

## 🧩 Deskripsi Aplikasi

Aplikasi ini merupakan **sistem admin sederhana** yang digunakan oleh admin toko untuk:

- Mengelola data produk
- Mengelola stok produk
- Melakukan input pembelian
- Melakukan pembatalan (cancel) pembelian oleh admin

Aplikasi dibangun menggunakan **Node.js, Express.js, EJS**, dan **database SQL** dengan desain UI yang sederhana dan fungsional.

---

## 🗄️ Struktur Database

Aplikasi menggunakan **database SQL** dengan struktur sebagai berikut:

### 1️⃣ Tabel Produk
Digunakan untuk menyimpan data produk.

Field utama:
- id
- nama_produk
- harga
- deskripsi

📌 Terdapat **10 data produk awal** sebagai seed data.

---

### 2️⃣ Tabel Stok Produk
Digunakan untuk menyimpan jumlah stok tiap produk.

Field utama:
- id
- produk_id (relasi ke tabel Produk)
- jumlah_stok

---

### 3️⃣ Tabel Pembelian
Digunakan untuk mencatat transaksi pembelian produk.

Field utama:
- id
- produk_id
- jumlah_beli
- total_harga
- status_pembelian (SUCCESS / CANCELED)
- tanggal_pembelian

---

## 🛠️ Tech Stack

- **Backend**: Node.js
- **Framework**: Express.js
- **Template Engine**: EJS
- **Database**: SQL (MySQL / PostgreSQL / SQLite)
- **UI**: Bebas (fokus pada fungsionalitas)

---

## ▶️ Cara Menjalankan Aplikasi

### 1️⃣ Clone Repository
```bash
git clone <URL_REPOSITORY>
cd admin-system
