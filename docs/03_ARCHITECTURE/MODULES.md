# Modules

Version: 1.0

---

# Purpose

Healthila OS dibangun menggunakan pendekatan Modular Monolith.

Setiap domain bisnis menjadi satu module yang memiliki tanggung jawab sendiri.

Module memiliki:

- Database
- Service
- Repository
- API
- Validation
- Types
- UI

Module tidak boleh mengakses database module lain secara langsung.

---

# Module Structure

modules/

├── identity
├── catalog
├── procurement
├── inventory
├── sales
├── fulfillment
├── delivery
├── finance
└── system

---

# Identity Module

Purpose

Mengelola identitas seluruh pihak.

Entities

- User
- Employee
- Customer
- Supplier

Features

- Authentication
- Profile
- Address
- Contact

API

/api/customers

/api/employees

/api/suppliers

---

# Catalog Module

Purpose

Mengelola data produk.

Entities

- Product
- Category
- Variant
- Packaging
- Price

Features

- Product Management
- Pricing
- Product Image

API

/api/products

/api/categories

---

# Procurement Module

Purpose

Mengelola pembelian barang.

Entities

- Purchase Order
- Receiving
- Supplier Invoice

Features

- Create PO
- Receive Goods
- Supplier History

API

/api/purchase-orders

/api/receivings

---

# Inventory Module

Purpose

Mengelola stok fisik.

Entities

- Batch
- Stock Movement
- Reservation
- Waste
- Adjustment

Features

- Batch Tracking
- Stock Reservation
- Stock History
- FEFO Allocation

API

/api/inventory

/api/batches

/api/reservations

---

# Sales Module

Purpose

Mengelola order pelanggan.

Entities

- Order
- Order Item
- Payment
- Promotion

Features

- Checkout
- Payment
- Invoice

API

/api/orders

/api/payments

---

# Fulfillment Module

Purpose

Mengelola proses operasional setelah order dibuat.

Entities

- Picking
- QC
- Packing
- Workflow Task

Features

- Picking List
- QC Checklist
- Packing Checklist

API

/api/picking

/api/qc

/api/packing

---

# Delivery Module

Purpose

Mengelola pengiriman.

Entities

- Delivery
- Driver
- Vehicle
- Route

Features

- Delivery Assignment
- Proof of Delivery
- Tracking

API

/api/delivery

---

# Finance Module

Purpose

Mengelola transaksi keuangan.

Entities

- Revenue
- Expense
- Refund

Features

- Daily Closing
- Profit Report
- Cash Flow

API

/api/finance

---

# System Module

Purpose

Shared services.

Entities

- Role
- Permission
- Audit Log
- Attachment
- Notification
- Settings

Features

- User Management
- Audit Trail
- File Storage
- Notifications

API

/api/users

/api/roles

/api/settings

---

# Dependency Rules

Allowed

Sales
↓

Inventory Service

Allowed

Fulfillment
↓

Inventory Service

Allowed

Delivery
↓

Sales Service

Forbidden

Sales
↓

UPDATE inventory_batches

Forbidden

Inventory
↓

UPDATE orders

Semua komunikasi antar module dilakukan melalui Service Layer.

