# Event Storming

Version: 1.0

---

# Purpose

Dokumen ini memetakan seluruh alur bisnis Healthila OS berdasarkan event yang terjadi di dunia nyata.

Healthila OS dibangun berdasarkan event bisnis, bukan berdasarkan menu aplikasi.

---

# Procurement Flow

Supplier Selected
    ↓
Purchase Order Created
    ↓
Purchase Order Approved
    ↓
Purchase Order Sent
    ↓
Goods Received
    ↓
Receiving Completed
    ↓
Batch Created
    ↓
Inventory Updated

---

# Sales Flow

Customer Order Created
    ↓
Order Confirmed
    ↓
Stock Reserved
    ↓
Invoice Generated
    ↓
Payment Received

---

# Fulfillment Flow

Picking Started
    ↓
Picking Completed
    ↓
QC Started
    ↓
QC Passed / QC Failed
    ↓
Packing Started
    ↓
Packing Completed

---

# Delivery Flow

Driver Assigned
    ↓
Delivery Started
    ↓
Delivery Completed

atau

Delivery Failed

atau

Returned

---

# Inventory Events

Batch Created

↓

Stock Reserved

↓

Stock Released

↓

Stock Picked

↓

Stock Adjusted

↓

Stock Wasted

↓

Stock Returned

---

# Customer Events

Customer Registered

↓

Customer Updated

↓

Order Created

↓

Order Paid

↓

Order Completed

↓

Customer Feedback Received

---

# Finance Events

Payment Received

↓

Invoice Paid

↓

Refund Requested

↓

Refund Approved

↓

Refund Completed

---

# Notification Events

Order Created

→ Notify Admin

Order Paid

→ Notify Warehouse

QC Failed

→ Notify Supervisor

Delivery Completed

→ Notify Customer

---

# Audit Events

Semua event berikut harus menghasilkan Audit Log:

- Create
- Update
- Delete (Soft Delete)
- Approve
- Reject
- Cancel
- Refund
- Stock Adjustment
- Waste
- Delivery

---

# Core Business Timeline

Supplier
    ↓
Purchase Order
    ↓
Receiving
    ↓
Batch Created
    ↓
Inventory Available
    ↓
Customer Order
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
Completed
