<a name="readme-top"></a>

<div align="center">
  
  <h1>🎮 Tutorial Game Development 2025/2026</h1>

  <p>
	<b>Brenda Po Lok Fahida</b> • 2306152304
  </p>

</div>

<br>

<div align="center">

[![TUTORIAL CSUI](https://img.shields.io/badge/-TUTORIAL_CSUI-EDC5BB?style=for-the-badge&logoColor=white)](https://csui-game-development.github.io/)
[![GODOT DOCS](https://img.shields.io/badge/-GODOT_DOCS-6B7F7E?style=for-the-badge&logo=godotengine&logoColor=white)](https://docs.godotengine.org/en/stable/getting_started/introduction/)
[![GITHUB](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/bddaax/Game-Development-Tutorial-7)

</div>

<br>

<details>
<summary><h2>Tutorial 7 – Basic 3D Game Mechanics & Level Design</h2></summary>

### Deskripsi
Tutorial 7 berfokus pada pembuatan **game 3D first-person** menggunakan Godot 4. Diterapkan mekanik pergerakan 3D, sistem interaksi objek (pickup & switch), inventory, area trigger, serta desain level dengan CSG. Game bersetting dapur dengan tujuan mengumpulkan semua peralatan masak yang tersebar di ruangan.

---

### Fitur yang Diimplementasikan

#### Latihan Wajib

#### 1. Basic 3D Plane Movement
- `CharacterBody3D` bergerak ke semua arah menggunakan input WASD dengan gravitasi dan lompat (Space).
- Kamera dikendalikan mouse dengan clamp ±90° agar tidak bisa putar balik penuh.
- Kursor mouse di-capture saat game aktif, dilepas saat Escape ditekan.

#### 2. Object Interaction – Pickup (`Pickubable.gd`)
- Sistem `Interactable` dideteksi oleh `RayCast3D` di depan pemain.
- Tekan **E** untuk mengambil item (Knife, Spatula, Panci, Chopstick, dsb.).
- Item tersimpan ke `Inventory` (Autoload singleton) dan ditampilkan di HUD slot.

#### 3. Object Interaction – Switch (`Switch.gd`)
- Mewarisi `Interactable`. Tekan **E** pada switch merah untuk menyalakan/mematikan `OmniLight3D` di area tujuan.
- Switch berbentuk `StaticBody3D` kecil yang ditempatkan di dinding.

#### 4. Level 3D dengan CSG
- Ruangan dapur (28×7×50 unit) dibangun dari 6 panel `CSGBox3D` terpisah (lantai, 4 dinding, langit-langit) tanpa `flip_faces` agar `is_on_floor()` bekerja dengan benar.
- Pilar-pilar dekoratif ditambahkan menggunakan `CSGBox3D` dengan `use_collision = true`.

#### 5. ObjLamp
- Objek lampu 3D dekoratif (`Lamp.tscn`) dari kombinasi CSG, ditempatkan di empat sudut ruangan.

#### 6. Area Trigger
- `GoalZone` (hijau) di platform tujuan: saat pemain masuk, game berpindah ke Win Screen.
- Menggunakan `AreaTrigger.tscn` berbasis `Area3D` dengan deteksi `body_entered`.

#### 7. Win Screen
- Layar kemenangan dengan tombol **Play Again** (reload level) dan **Quit** (keluar game).

---

### Latihan Mandiri

#### Fitur 1: Sprinting
- Double-tap **W** untuk berlari (kecepatan 15 vs 10 unit/s normal).
- FOV melebar ke 95° secara smooth menggunakan `lerp()`.
- Sprint berhenti otomatis saat tombol W dilepas; tidak bisa sprint saat crouch.

#### Fitur 2: Crouching
- Tahan **Ctrl** untuk berjongkok (kecepatan 5 unit/s).
- FOV menyempit ke 55° secara smooth.
- Tidak bisa sprint saat crouch aktif.

---

### HUD & Inventory

| Elemen | Deskripsi |
|--------|-----------|
| **Crosshair** | Titik putih di tengah layar |
| **Interact Prompt** | Nama item + tombol `[E]` muncul saat RayCast mendeteksi Interactable |
| **Inventory Bar** | Tiga slot di bawah layar, menampilkan nama item dan jumlah |
| **Slot Selection** | Tombol **1 / 2 / 3** untuk memilih slot aktif |
| **Drop Item** | Tombol **Q** untuk menjatuhkan item dari slot aktif |

---

### Kontrol

| Tombol | Aksi |
|--------|------|
| W / A / S / D | Gerak maju / kiri / mundur / kanan |
| W W (double tap) | Sprint |
| Mouse | Arahkan pandangan kamera |
| Space | Lompat |
| E | Interaksi (ambil item / nyalakan switch) |
| Ctrl | Crouch |
| 1 / 2 / 3 | Pilih slot inventory |
| Q | Jatuhkan item |
| Escape | Lepas kursor mouse |

---

### Referensi Dokumentasi
[![CharacterBody3D](https://img.shields.io/badge/-CharacterBody3D-808080?style=for-the-badge&logo=godotengine&logoColor=white)](https://docs.godotengine.org/en/stable/classes/class_characterbody3d.html)
[![CSGBox3D](https://img.shields.io/badge/-CSGBox3D-808080?style=for-the-badge&logo=godotengine&logoColor=white)](https://docs.godotengine.org/en/stable/classes/class_csgbox3d.html)
[![Area3D](https://img.shields.io/badge/-Area3D-808080?style=for-the-badge&logo=godotengine&logoColor=white)](https://docs.godotengine.org/en/stable/classes/class_area3d.html)
<br>
[![RayCast3D](https://img.shields.io/badge/-RayCast3D-808080?style=for-the-badge&logo=godotengine&logoColor=white)](https://docs.godotengine.org/en/stable/classes/class_raycast3d.html)
[![OmniLight3D](https://img.shields.io/badge/-OmniLight3D-808080?style=for-the-badge&logo=godotengine&logoColor=white)](https://docs.godotengine.org/en/stable/classes/class_omnilight3d.html)
[![Autoload/Singleton](https://img.shields.io/badge/-Autoload%2FSingleton-808080?style=for-the-badge&logo=godotengine&logoColor=white)](https://docs.godotengine.org/en/stable/tutorials/scripting/singletons_autoload.html)
<br>

</details>
