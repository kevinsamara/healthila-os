# Context Map

Version: 1.0

---

# Purpose

Context Map mendefinisikan batas kepemilikan data (Ownership) antar domain.

Setiap data hanya memiliki satu pemilik.

Domain lain hanya boleh meminta layanan (Service/API), bukan mengubah data secara langsung.

---

# Domain Ownership

Identity
├── Customer
├── Employee
├── Supplier
└── User

Catalog
├── Product
├── Category
├── Variant
├── Packaging
└── Price

Procurement
├── Purchase Order
├── Receiving
└── Supplier Invoice

Inventory
├── Batch
├── Reservation
├── Stock Movement
├── Waste
├── Adjustment
└── Warehouse

Sales
├── Order
├── Order Item
├── Payment
└── Promotion

Fulfillment
├── Picking
├── QC
├── Packing
└── Workflow Task

Delivery
├── Delivery
├── Route
├── Driver Assignment
└── Proof of Delivery

Finance
├── Revenue
├── Expense
├── Refund
└── Journal

System
├── Role
├── Permission
├── Notification
├── Attachment
└── Audit Log

---

# Dependency

Catalog
        │
        ▼
Inventory

Inventory
        │
        ▼
Sales

Sales
        │
        ▼
Fulfillment

Fulfillment
        │
        ▼
Delivery

Sales
        │
        ▼
Finance

System
        │
        ▼
Semua Domain

---

# Communication Rules

✔ Inventory menyediakan reserveStock()

✔ Inventory menyediakan releaseReservation()

✔ Inventory menyediakan allocateBatch()

✔ Sales membuat Order.

✔ Fulfillment menjalankan workflow.

✔ Finance menerima informasi pembayaran.

✘ Sales tidak boleh UPDATE Batch.

✘ Finance tidak boleh UPDATE Inventory.

✘ Delivery tidak boleh UPDATE Order.

---

# Shared Kernel

Shared Kernel hanya berisi:

- Money
- Address
- Phone Number
- Email
- Measurement
- Weight
- Dimensions
- File Attachment
- Audit Metadata

Selain itu harus dimiliki oleh domain masing-masing.

---

# Future Expansion

Context Map dirancang agar mendukung:

- Multi Company
- Multi Warehouse
- Multi Branch
- Marketplace Integration
- POS Integration
- Mobile App
- AI Automation

tanpa mengubah ownership domain.

