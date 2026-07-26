# Healthila OS Product Principles

Version: 1.0

---

# Philosophy

Healthila OS dibangun berdasarkan proses bisnis nyata, bukan sekadar fitur aplikasi.

Setiap keputusan desain, database, dan kode harus mengacu pada prinsip-prinsip berikut.

---

# 1. Workflow First

Workflow adalah inti dari sistem.

UI, database, dan API mengikuti workflow, bukan sebaliknya.

---

# 2. Batch Driven Inventory

Setiap stok berasal dari sebuah batch.

Batch memiliki informasi:

- Supplier
- Tanggal masuk
- Expired Date
- Harga modal
- Lokasi
- Jumlah

Stok bukan hanya angka.

---

# 3. Traceability

Semua aktivitas harus dapat ditelusuri.

Minimal mengetahui:

- siapa
- kapan
- dimana
- melakukan apa

Tidak boleh ada perubahan data tanpa jejak.

---

# 4. Input Once

Data hanya dimasukkan satu kali.

Seluruh modul menggunakan data yang sama.

Tidak boleh ada input berulang.

---

# 5. Automation First

Komputer mengerjakan pekerjaan berulang.

Manusia mengambil keputusan.

Contoh:

✓ Generate nomor invoice

✓ Update stok

✓ Hitung profit

✓ Notifikasi

---

# 6. Evidence Over Assumption

Status harus memiliki bukti.

Contoh:

Packing selesai → ada foto.

Delivery selesai → ada tanda tangan atau foto.

QC gagal → ada catatan.

---

# 7. Modular Architecture

Setiap domain berdiri sendiri.

Contoh:

Inventory tidak mengetahui detail Finance.

Finance tidak mengubah Inventory secara langsung.

Komunikasi dilakukan melalui service dan event.

---

# 8. API First

Seluruh fitur dapat diakses melalui API.

UI hanyalah salah satu client.

---

# 9. Mobile Friendly

Seluruh workflow operasional harus dapat dijalankan melalui perangkat mobile.

---

# 10. Scalable

Healthila OS harus mampu berkembang dari:

1 toko

↓

10 toko

↓

100 toko

tanpa mengubah arsitektur utama.
