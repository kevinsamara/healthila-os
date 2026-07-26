# Workflow Engine

Version: 1.0

---

# Purpose

Workflow Engine mengatur bagaimana sebuah pekerjaan berpindah dari satu tahap ke tahap berikutnya.

Workflow bukan bagian dari kode aplikasi.

Workflow adalah konfigurasi bisnis.

Dengan demikian, Healthila OS dapat mendukung berbagai jenis operasional tanpa mengubah source code.

---

# Workflow Concepts

Workflow
    ↓
Stage
    ↓
Task
    ↓
Action

---

# Workflow

Workflow adalah kumpulan Stage.

Contoh:

- Fresh Fruit
- Fruit Parcel
- Cold Pressed Juice
- Corporate Gift
- Marketplace Order

---

# Stage

Stage adalah langkah besar dalam sebuah workflow.

Contoh:

Reservation

Picking

QC

Packing

Delivery

---

# Task

Task adalah pekerjaan yang harus dilakukan pada sebuah Stage.

Contoh:

Stage : Picking

Task:

- Ambil Batch
- Timbang
- Scan Barcode

---

# Action

Action adalah tindakan user.

Contoh:

Start

Pause

Resume

Complete

Cancel

Reject

Approve

---

# Workflow : Fresh Fruit

Reservation
    ↓
Picking
    ↓
Quality Control
    ↓
Packing
    ↓
Delivery
    ↓
Completed

---

# Workflow : Fruit Parcel

Reservation
    ↓
Picking
    ↓
Quality Control
    ↓
Gift Wrapping
    ↓
Greeting Card
    ↓
Packing
    ↓
Delivery

---

# Workflow : Cold Pressed Juice

Reserve Ingredients
    ↓
Production
    ↓
Bottle Filling
    ↓
Labeling
    ↓
Packing
    ↓
Delivery

---

# Workflow : Corporate Gift

Reservation
    ↓
Picking
    ↓
QC
    ↓
Packaging
    ↓
Approval
    ↓
Delivery

---

# Workflow Rules

1.

Stage hanya dapat dimulai jika Stage sebelumnya selesai.

---

2.

Stage dapat memiliki lebih dari satu Task.

---

3.

Task dapat diberikan kepada Employee tertentu.

---

4.

Task memiliki Deadline.

---

5.

Task dapat memiliki Checklist.

---

6.

Task dapat membutuhkan Foto.

---

7.

Task dapat membutuhkan Approval.

---

8.

Workflow dapat dihentikan.

---

9.

Workflow dapat dibatalkan.

---

10.

Workflow dapat diulang.

---

# Status Workflow

Draft

Ready

Running

Waiting

Completed

Cancelled

Failed

---

# Status Task

Pending

Assigned

In Progress

Paused

Completed

Rejected

Cancelled

---

# Future Vision

Workflow nantinya akan disimpan di database.

Contoh:

Workflow
↓

Workflow Stage
↓

Workflow Task
↓

Workflow Transition

Dengan struktur tersebut, admin dapat membuat workflow baru tanpa deploy ulang aplikasi.

