# Domain Model

Version: 1.0

---

# Purpose

Dokumen ini mendefinisikan seluruh Entity dalam Healthila OS.

Setiap Entity memiliki:

- Domain Owner
- Aggregate Root
- Tujuan
- Siapa yang boleh mengubah
- Relasi utama

Dokumen ini menjadi dasar sebelum membuat ERD dan migration database.

---

## Identity Domain

### Customer

Purpose

Menyimpan informasi pelanggan.

Aggregate Root

Customer

Managed By

Identity Module

Relations

Customer
└── Order

---

### Employee

Purpose

Menyimpan data seluruh karyawan.

Managed By

Identity Module

Relations

Employee
├── Picking
├── QC
├── Packing
└── Delivery

---

### Supplier

Purpose

Menyimpan data pemasok.

Relations

Supplier
└── Purchase Order

---

## Catalog Domain

### Product

Purpose

Produk yang dijual.

Product tidak memiliki stok.

Stock dimiliki Batch.

Relations

Product
├── Batch
├── Price
├── Image
└── Category

---

### Category

Purpose

Mengelompokkan Product.

---

### Price

Purpose

Riwayat harga jual.

---

## Procurement Domain

### Purchase Order

Purpose

Pemesanan barang ke Supplier.

Relations

Purchase Order
├── Purchase Order Item
└── Receiving

---

### Receiving

Purpose

Penerimaan barang.

Receiving membuat Batch baru.

---

## Inventory Domain

### Batch

Purpose

Representasi stok fisik.

Aggregate Root Inventory.

Relations

Batch
├── Reservation
├── Stock Movement
├── Waste
├── Adjustment
└── Warehouse

---

### Reservation

Purpose

Mengunci stok.

---

### Stock Movement

Purpose

Riwayat seluruh perubahan stok.

---

### Waste

Purpose

Barang rusak/busuk.

---

### Adjustment

Purpose

Koreksi stok.

---

## Sales Domain

### Order

Purpose

Transaksi penjualan.

Aggregate Root Sales.

Relations

Order
├── Order Item
├── Payment
└── Fulfillment

---

### Payment

Purpose

Pembayaran Order.

---

## Fulfillment Domain

### Fulfillment

Purpose

Mengelola seluruh proses operasional Order.

Relations

Fulfillment
├── Picking
├── QC
├── Packing
└── Workflow

---

### Picking

Purpose

Pengambilan barang.

---

### QC

Purpose

Quality Control.

---

### Packing

Purpose

Pengemasan.

---

## Delivery Domain

### Delivery

Purpose

Pengiriman.

Relations

Delivery
├── Driver
└── Proof Of Delivery

---

## Finance Domain

### Revenue

Purpose

Pendapatan.

---

### Expense

Purpose

Pengeluaran.

---

### Refund

Purpose

Pengembalian dana.

---

## System Domain

### User

Purpose

Akun Login.

---

### Role

Purpose

Hak akses.

---

### Permission

Purpose

Daftar izin.

---

### Audit Log

Purpose

Riwayat seluruh aktivitas sistem.

