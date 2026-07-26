# System Overview

Version: 1.0

---

# Purpose

Healthila OS adalah ERP (Enterprise Resource Planning) yang dirancang khusus untuk bisnis fresh produce.

Sistem mengintegrasikan seluruh aktivitas operasional mulai dari pembelian barang, pengelolaan stok, penjualan, fulfillment, pengiriman, hingga pelaporan.

---

# Core Philosophy

Healthila OS bukan kumpulan halaman (pages).

Healthila OS adalah kumpulan domain bisnis yang saling berkolaborasi.

Setiap domain memiliki tanggung jawab yang jelas dan tidak boleh saling mengambil alih tanggung jawab domain lain.

---

# Core Domains

Identity
│
├── Customer
├── Employee
└── Supplier

↓

Catalog
│
├── Product
├── Variant
├── Packaging
└── Pricing

↓

Procurement
│
├── Purchase Order
├── Receiving
└── Supplier Invoice

↓

Inventory
│
├── Batch
├── Stock
├── Reservation
├── Movement
├── Waste
└── Adjustment

↓

Sales
│
├── Order
├── Order Item
├── Promotion
└── Payment

↓

Fulfillment
│
├── Picking
├── QC
├── Packing
└── Workflow

↓

Delivery
│
├── Driver
├── Vehicle
├── Route
└── Delivery

↓

Finance
│
├── Revenue
├── Expense
├── Refund
└── Reporting

↓

System
│
├── User
├── Role
├── Permission
├── Notification
├── Attachment
└── Audit Log

---

# Data Flow

Supplier
    ↓
Receiving
    ↓
Batch
    ↓
Inventory
    ↓
Reservation
    ↓
Picking
    ↓
QC
    ↓
Packing
    ↓
Delivery
    ↓
Customer

---

# Domain Responsibilities

Identity

Mengelola seluruh data master mengenai orang dan organisasi.

Tidak mengelola transaksi.

---

Catalog

Mengelola produk yang dijual.

Tidak mengelola stok.

---

Procurement

Mengelola proses pembelian barang.

Tidak mengelola penjualan.

---

Inventory

Mengelola seluruh stok fisik.

Tidak menerima pembayaran.

---

Sales

Mengelola order customer.

Tidak mengurangi stok secara langsung.

---

Fulfillment

Mengelola proses pemenuhan order.

Tidak mengetahui proses akuntansi.

---

Delivery

Mengelola pengiriman.

Tidak mengubah data order.

---

Finance

Mengelola transaksi keuangan.

Tidak mengubah inventory.

---

System

Menyediakan layanan bersama seperti autentikasi, audit log, file, dan notifikasi.

---

# Integration Principles

Setiap domain hanya boleh berkomunikasi melalui Service Layer.

Tidak boleh mengakses tabel domain lain secara langsung untuk menjalankan logika bisnis.

Contoh:

✓ Sales meminta Inventory melakukan Reservation.

✗ Sales mengurangi stok sendiri.

---

# Future Scalability

Arsitektur harus mendukung:

- Multi Warehouse
- Multi Store
- Multi Company
- Multi Currency
- Multi Language
- Multi Workflow

tanpa mengubah struktur domain utama.

