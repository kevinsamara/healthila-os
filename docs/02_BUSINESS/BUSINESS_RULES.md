# Business Rules

Version: 1.0

---

# Purpose

Dokumen ini mendefinisikan seluruh aturan bisnis Healthila OS.

Semua implementasi database, backend, frontend, dan workflow harus mengikuti aturan di dokumen ini.

---

# CUSTOMER

BR-CUS-001

Customer boleh memiliki banyak Order.

---

BR-CUS-002

Customer boleh melakukan Order tanpa akun (Guest Customer).

---

BR-CUS-003

Nomor telepon tidak boleh digunakan oleh dua Customer aktif.

---

# SUPPLIER

BR-SUP-001

Supplier boleh memasok banyak Product.

---

BR-SUP-002

Satu Batch hanya boleh berasal dari satu Supplier.

---

# PRODUCT

BR-PRO-001

Product tidak memiliki stok.

Stok dimiliki oleh Batch.

---

BR-PRO-002

Product boleh memiliki banyak Batch.

---

BR-PRO-003

Product yang sudah digunakan pada Order tidak boleh dihapus.

---

# BATCH

BR-BAT-001

Batch dibuat hanya melalui proses Receiving.

---

BR-BAT-002

Batch memiliki:

- Supplier
- Cost
- Received Date
- Expiry Date
- Initial Quantity

---

BR-BAT-003

Batch tidak boleh digabung.

---

BR-BAT-004

Batch tidak boleh dipindahkan menjadi Product lain.

---

BR-BAT-005

Batch yang sudah habis tetap disimpan sebagai histori.

---

# INVENTORY

BR-INV-001

Inventory dihitung berdasarkan seluruh Batch aktif.

---

BR-INV-002

On Hand Stock tidak boleh negatif.

---

BR-INV-003

Available Stock dihitung:

On Hand - Reserved

---

BR-INV-004

Semua perubahan stok harus menghasilkan Stock Movement.

---

BR-INV-005

Tidak boleh ada update stok secara langsung.

---

# RESERVATION

BR-RES-001

Order harus melakukan Reservation sebelum Picking.

---

BR-RES-002

Reservation mengurangi Available Stock.

---

BR-RES-003

Reservation tidak mengurangi On Hand Stock.

---

BR-RES-004

Reservation dapat dibatalkan.

---

# PICKING

BR-PIC-001

Picking hanya dapat dilakukan setelah Reservation.

---

BR-PIC-002

Picking mengurangi Reserved Stock.

---

BR-PIC-003

Picking mengurangi On Hand Stock.

---

BR-PIC-004

Picking wajib mencatat Employee.

---

# QC

BR-QC-001

QC dilakukan setelah Picking.

---

BR-QC-002

QC memiliki status:

PASS

FAIL

PARTIAL

---

BR-QC-003

QC FAIL wajib memiliki alasan.

---

BR-QC-004

QC PARTIAL harus mencatat jumlah yang lolos.

---

# PACKING

BR-PAC-001

Packing hanya dapat dilakukan setelah QC PASS.

---

BR-PAC-002

Packing menghasilkan paket siap kirim.

---

BR-PAC-003

Order yang sudah Packing tidak boleh diedit.

---

# DELIVERY

BR-DEL-001

Delivery hanya dapat dilakukan pada Order yang sudah Packing.

---

BR-DEL-002

Delivery memiliki status:

Assigned

On Delivery

Delivered

Failed

Returned

---

BR-DEL-003

Delivery selesai harus memiliki waktu selesai.

---

# ORDER

BR-ORD-001

Order minimal memiliki satu Order Item.

---

BR-ORD-002

Order wajib memiliki Customer.

---

BR-ORD-003

Order Number harus unik.

---

BR-ORD-004

Order tidak boleh dihapus setelah dibayar.

---

BR-ORD-005

Alamat pengiriman adalah snapshot.

Perubahan alamat Customer tidak mengubah Order lama.

---

# PAYMENT

BR-PAY-001

Satu Order dapat memiliki beberapa pembayaran.

---

BR-PAY-002

Status pembayaran:

Pending

Paid

Refunded

Partial Refund

---

# WASTE

BR-WST-001

Waste harus memiliki alasan.

---

BR-WST-002

Waste menghasilkan Stock Movement.

---

# ADJUSTMENT

BR-ADJ-001

Adjustment harus memiliki Approval.

---

BR-ADJ-002

Adjustment harus mencatat alasan.

---

# AUDIT

BR-AUD-001

Semua perubahan data penting harus memiliki Audit Log.

---

BR-AUD-002

Audit Log tidak boleh diubah oleh pengguna.

