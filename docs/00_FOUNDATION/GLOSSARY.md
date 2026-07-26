# Healthila OS Glossary

Version: 1.0

---

# Purpose

Dokumen ini mendefinisikan istilah-istilah resmi yang digunakan di seluruh Healthila OS.

Semua developer, designer, dan stakeholder wajib menggunakan definisi yang sama.

---

# Batch

Sekelompok stok produk yang berasal dari satu penerimaan barang.

Satu batch memiliki:

- Supplier
- Tanggal diterima
- Harga modal
- Expired Date
- Lokasi penyimpanan
- Jumlah awal
- Jumlah tersisa

Contoh:

20 kg Apel Fuji diterima tanggal 5 Agustus.

Maka seluruh 20 kg tersebut adalah satu Batch.

---

# Inventory

Seluruh stok fisik yang dimiliki perusahaan.

Inventory terdiri dari banyak Batch.

Inventory bukan sekadar angka stok.

---

# Stock Movement

Semua perubahan jumlah stok.

Jenis movement:

- Receiving
- Reservation
- Picking
- Waste
- Adjustment
- Return
- Production
- Delivery

Semua movement harus tercatat.

---

# Reservation

Proses mengunci stok agar tidak digunakan oleh order lain.

Reservation tidak mengurangi stok fisik.

Reservation hanya mengurangi Available Stock.

---

# Available Stock

Jumlah stok yang masih dapat dijual.

Formula:

Available = On Hand - Reserved

---

# On Hand

Jumlah stok fisik yang ada di gudang.

---

# Picking

Proses mengambil barang dari gudang berdasarkan order.

Picking dilakukan setelah Reservation.

---

# QC (Quality Control)

Pemeriksaan kualitas produk sebelum packing.

Hasil QC:

- PASS
- FAIL
- PARTIAL

---

# Packing

Proses mengemas produk setelah lolos QC.

Packing menghasilkan paket siap kirim.

---

# Fulfillment

Seluruh proses setelah order dibuat hingga siap dikirim.

Meliputi:

- Reservation
- Picking
- QC
- Packing

---

# Delivery

Proses pengiriman barang ke pelanggan.

Delivery selesai setelah diterima pelanggan.

---

# Waste

Stok yang tidak dapat dijual.

Contoh:

- Busuk
- Pecah
- Rusak
- Expired

Waste harus memiliki alasan.

---

# Adjustment

Perubahan stok karena koreksi.

Adjustment harus memiliki approval.

---

# Supplier

Pihak yang memasok produk.

Supplier dapat memasok banyak Batch.

---

# Customer

Pembeli produk.

Customer memiliki histori order.

---

# Product

Barang yang dijual.

Contoh:

- Fuji Apple
- Navel Orange
- Jumbo Pomegranate

Product bukan Batch.

Satu Product dapat memiliki banyak Batch.

---

# Order

Permintaan pembelian dari customer.

Order terdiri dari banyak Order Item.

---

# Order Item

Baris produk dalam sebuah Order.

Contoh:

Order #001

- Fuji Apple 2 kg
- Pear 1 kg
- Orange 3 pcs

Terdapat tiga Order Item.

---

# Purchase Order

Dokumen pemesanan barang ke Supplier.

Disingkat PO.

---

# Receiving

Proses menerima barang dari Supplier.

Receiving akan membuat Batch baru.

---

# Traceability

Kemampuan sistem untuk melacak asal-usul dan perjalanan suatu produk.

Contoh:

Supplier
↓

Receiving
↓

Batch
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

