# Tutorial 7 — Basic 3D Game Mechanics & Level Design

Game 3D first-person dengan sistem pickup item, inventory, dan interaksi switch lampu, dibuat menggunakan Godot 4 sebagai tugas Tutorial 7 kuliah Game Development.

## Cara Menjalankan

1. Buka Godot 4 dan import folder proyek ini.
2. Scene utama sudah diset ke `scenes/intro.tscn` (layar intro → level_1).
3. Tekan **F5** atau klik tombol **Play** untuk menjalankan game.

## Kontrol

| Tombol | Aksi |
|--------|------|
| W / A / S / D | Gerak maju / kiri / mundur / kanan |
| W W (double tap) | Sprint (berlari cepat) |
| Mouse | Arahkan pandangan kamera |
| Space | Lompat |
| E | Berinteraksi dengan objek (ambil item / nyalakan lampu) |
| Ctrl | Crouch (berjalan jongkok, kecepatan berkurang) |
| Escape | Lepas kursor mouse |
| Klik mouse | Tangkap kembali kursor mouse |
| 1 / 2 / 3 | Pilih slot inventory |
| Q | Jatuhkan item yang dipilih |

## Fitur yang Diimplementasikan

### Latihan Wajib

- **Basic 3D Plane Movement** — Karakter `CharacterBody3D` bisa bergerak ke semua arah, gravitasi, dan lompat. Kamera dikendalikan mouse dengan clamp ±90°.
- **Object Interaction (Pickup)** — Sistem `Interactable` / `Pickubable` menggunakan `RayCast3D`. Pemain dapat menekan **E** untuk mengambil item (Knife, Cooking Tools). Item tersimpan ke `Inventory` (Autoload singleton).
- **Object Interaction (Switch)** — Sistem `Switch.gd` mewarisi `Interactable`. Tekan **E** pada switch merah untuk menyalakan/mematikan lampu.
- **Level 3D dengan CSG** — Ruangan dibuat menggunakan `CSGCombiner3D` + `CSGBox3D` dengan operasi Union dan Subtraction (pembuatan jurang/gap).
- **ObjLamp** — Objek lampu 3D dekoratif dari kombinasi CSG, ditempatkan di empat sudut ruangan.
- **Area Trigger** — `GoalZone` (hijau) di platform tujuan membawa pemain ke Win Screen; `DeathZone` di bawah jurang me-reload level.
- **Win Screen** — Layar kemenangan dengan tombol Play Again dan Quit.

### Latihan Mandiri (2 Mekanik)

- **Sprinting** — Double-tap **W** untuk berlari (15 unit/s vs 10 unit/s normal). FOV melebar ke 95° secara smooth. Sprint berhenti saat tombol W dilepas.
- **Crouching** — Tahan **Ctrl** untuk berjongkok (5 unit/s). FOV menyempit ke 55°. Tidak bisa sprint saat crouch.

### HUD & Inventory

- **Crosshair** — Titik putih di tengah layar.
- **Interact Prompt** — Muncul nama item dan tombol `[E]` saat RayCast mendeteksi `Interactable` di depan pemain.
- **Inventory Bar** — Tiga slot di bagian bawah layar. Menampilkan nama item dan jumlah yang dipegang.