# Aggregates

Version: 1.0

---

# Purpose

Aggregate mendefinisikan batas konsistensi data (Consistency Boundary).

Perubahan data dalam satu Aggregate harus selalu konsisten dalam satu transaksi.

Aggregate lain tidak boleh mengubah data internal secara langsung.

---

# Aggregate Overview

Identity
Catalog
Procurement
Inventory
Sales
Fulfillment
Delivery
Finance
System

---

# Identity Aggregate

Root

- Customer

Entities

- Customer Address
- Customer Contact

Rules

- Customer memiliki banyak alamat.
- Penghapusan customer menggunakan Soft Delete.
- Order hanya menyimpan snapshot customer.

---

# Catalog Aggregate

Root

- Product

Entities

- Category
- Variant
- Packaging
- Price

Rules

- Product tidak memiliki stok.
- Product dapat memiliki banyak Batch.
- Product tidak boleh dihapus jika pernah terjual.

---

# Procurement Aggregate

Root

- Purchase Order

Entities

- Purchase Order Item
- Receiving
- Supplier Invoice

Rules

- Receiving hanya berasal dari Purchase Order.
- Receiving membuat Batch baru.
- Purchase Order tidak boleh diubah setelah selesai.

---

# Inventory Aggregate

Root

- Batch

Entities

- Stock Movement
- Reservation
- Waste
- Adjustment
- Warehouse Location

Rules

- Semua perubahan stok berasal dari Stock Movement.
- Batch tidak boleh digabung.
- Batch tidak boleh dihapus.
- Reservation tidak mengurangi On Hand.
- Picking mengurangi On Hand.

---

# Sales Aggregate

Root

- Order

Entities

- Order Item
- Payment
- Promotion

Rules

- Order minimal memiliki satu item.
- Order Number unik.
- Order tidak boleh diubah setelah Packing.

---

# Fulfillment Aggregate

Root

- Fulfillment

Entities

- Picking
- QC
- Packing
- Workflow Task

Rules

- Picking hanya setelah Reservation.
- QC setelah Picking.
- Packing setelah QC PASS.

---

# Delivery Aggregate

Root

- Delivery

Entities

- Delivery Stop
- Driver Assignment
- Proof of Delivery

Rules

- Delivery tidak boleh dimulai sebelum Packing selesai.
- Delivery wajib memiliki status.
- Delivery selesai memiliki timestamp.

---

# Finance Aggregate

Root

- Transaction

Entities

- Revenue
- Expense
- Refund

Rules

- Refund selalu terkait Order.
- Finance tidak mengubah Inventory.

---

# System Aggregate

Root

- User

Entities

- Role
- Permission
- Notification
- Attachment
- Audit Log

Rules

- Audit Log immutable.
- Permission berbasis Role.
- Attachment dapat digunakan seluruh domain.

---

# Communication Rules

Aggregate tidak boleh saling mengubah data secara langsung.

Contoh:

Sales
    ↓
InventoryService.reserveStock()

✓ Benar

Sales
    ↓
UPDATE inventory_batches ...

✗ Salah

---

# Transaction Boundary

Satu transaksi database hanya boleh mengubah satu Aggregate Root.

Jika melibatkan Aggregate lain, gunakan Service Layer atau Domain Event.

Contoh:

Order Created
    ↓
Inventory Reserve
    ↓
Notification

Setiap langkah merupakan tanggung jawab Aggregate masing-masing.

