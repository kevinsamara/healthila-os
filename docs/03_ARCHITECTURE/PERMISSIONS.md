# Permissions

Version: 1.0

---

# Purpose

Healthila OS menggunakan Role-Based Access Control (RBAC).

Setiap User memiliki satu atau lebih Role.

Role memiliki sekumpulan Permission.

Permission menentukan apakah User dapat melakukan suatu Action.

---

# Access Model

User
    ↓
Role
    ↓
Permission

---

# Standard Roles

- Super Admin
- Owner
- Manager
- Admin
- Purchasing
- Warehouse
- Picker
- QC
- Packing
- Cashier
- Customer Service
- Driver
- Finance
- Auditor

---

# Permission Format

<module>.<resource>.<action>

Contoh:

inventory.batch.read

inventory.batch.create

inventory.batch.update

inventory.batch.delete

---

sales.order.create

sales.order.cancel

sales.order.refund

---

delivery.delivery.assign

delivery.delivery.complete

---

# Permission Actions

read

create

update

delete

approve

cancel

assign

export

import

restore

---

# Role Matrix

======================================================
Role            Create Edit Delete Approve Export
======================================================

Owner             ✓      ✓      ✓       ✓       ✓

Manager           ✓      ✓      ✗       ✓       ✓

Admin             ✓      ✓      ✗       ✗       ✓

Warehouse         ✓      ✓      ✗       ✗       ✗

Picker            ✗      ✓      ✗       ✗       ✗

QC                ✗      ✓      ✗       ✓       ✗

Packing           ✗      ✓      ✗       ✗       ✗

Cashier           ✓      ✓      ✗       ✗       ✓

Finance           ✓      ✓      ✗       ✓       ✓

Driver            ✗      ✓      ✗       ✗       ✗

Auditor           Read Only

======================================================

---

# Sensitive Permissions

Permission berikut harus dibatasi:

inventory.adjustment.approve

inventory.waste.approve

finance.refund.approve

finance.expense.approve

system.user.delete

system.role.update

system.settings.update

---

# Audit Requirements

Action berikut WAJIB masuk Audit Log:

- Login
- Logout
- Create
- Update
- Delete
- Approve
- Reject
- Refund
- Adjustment
- Waste
- Permission Change

---

# Future Features

Mendukung:

- Multiple Roles per User
- Temporary Permission
- Branch-level Permission
- Warehouse-level Permission
- Company-level Permission

