Author : Qosim Ariqoh Daffa

NPM : 2006522820

---

# Latihan: Playtest

Gerakkan objek landasan ke atas sehingga objek pesawatnya hampir menyentuh batas atas area permainan/window. Kemudian jawablah pertanyaan-pertanyaan berikut:

1. **Apa saja pesan log yang dicetak pada panel **Output**?**

```
Platform initialized
Reached objective!
```

2. **Coba gerakkan landasan ke batas area bawah, lalu gerakkan kembali ke atas hingga hampir menyentuh batas atas. Apa saja pesan log yang dicetak pada panel Output?**

```
Platform initialized
Reached objective!
Reached objective!
```

3. **Buka _scene_ `MainLevel` dengan tampilan workspace 2D. Apakah lokasi _scene_ `ObjectiveArea` memiliki kaitan dengan pesan log yang dicetak pada panel Output pada percobaan sebelumnya?**

Ya, _scene_ `ObjectiveArea` memiliki kaitan terhadap pesan log yang dicetak pada panel Output untuk pesan log "Reached objective!". _Scene_ `ObjectiveArea` tersebut memiliki sebuah _node_ `Area2D` yang memiliki fungsi `body_entered(body: Node)` yang dimana fungsi ini akan dijalankan ketika sebuah _Node_ memasuki area dari `ObjectiveArea`.

```
func _on_ObjectiveArea_body_entered(body: RigidBody2D):
	if (body.name == "BlueShip"):
		print("Reached objective!")
```

Dikarenakan `BlueShip` memiliki _Node_ `RigidBody2D`, `BlueShip` akan mentrigger fungsi `_on_ObjectiveArea_body_entered` sehingga dihasilkan pesan log berupa "Reached objective!" ketika `BlueShip` memasuki area dari `ObjectiveArea`.

---

# Latihan: Memanipulasi Node dan Scene

Sekarang coba kamu inspeksi _scene-scene_ pada contoh proyek tutorial 2 dan jawablah pertanyaan-pertanyaan berikut:

1. **_Scene_ `BlueShip` dan `StonePlatform` sama-sama memiliki sebuah child _node_ bertipe `Sprite`. Apa fungsi dari _node_ bertipe `Sprite`?**

Berdasarkan dokumentasi Godot, [`Sprite`](https://docs.godotengine.org/en/3.5/classes/class_sprite.html) adalah _node_ yang berfungsi untuk menampilkan tekstur 2D. Tekstur yang ditampilkan tersebut dapat berupa gambar maupun _frame_ dari _sprite sheet animation_.

2. **_Root node_ dari _scene_ `BlueShip` dan `StonePlatform` menggunakan tipe yang berbeda. `BlueShip` menggunakan tipe `RigidBody2D`, sedangkan `StonePlatform` menggunakan tipe `StaticBody2D`. Apa perbedaan dari masing-masing tipe node?**

[`RigidBody2D`](https://docs.godotengine.org/en/3.5/classes/class_rigidbody.html) adalah _physical body_ yang posisinya ditentukan melalui simulasi fisika dalam ruang 3D. Artinya adalah _player_ tidak mengendalikan posisi `RigidBody` secara langsung, melainkan dari gaya yang diberikan kepadanya (seperti gravitasi, dorongan, dll.) yang kemudian akan menghasilkan simulasi gerakan, gesekan, pantulan, putaran, dll..

Sedangkan [`StaticBody2D`](https://docs.godotengine.org/en/3.5/classes/class_staticbody2d.html) adalah bentuk _static body_ untuk fisik 2D. Idealnya `StaticBody` ini tidak diperuntukkan untuk bergerak dan diimplementasikan sebagai objek pada lingkungan, seperti tembok atau _platform_.

Kesimpulan perbedaan dari kedua _node_ tersebut adalah sebagai berikut:

| `RigidBody2D`                                                                                          | `StaticBody2D`                                                           |
| ------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------ |
| _Node_ yang dapat bergerak namun tidak dikendalikan secara langsung, melainkan melalui simulasi fisika | _Node_ yang idealnya diimplementasikan sebagai objek yang tidak bergerak |

3. **Ubah nilai atribut `Mass` dan `Weight` pada tipe `RigidBody2D` secara bebas di _scene_ `BlueShip`, lalu coba jalankan _scene_ `MainLevel`. Apa yang terjadi?**

Sejauh observasi yang dilakukan, tidak terjadi perubahan yang dapat terlihat.

4. **Ubah nilai atribut `Disabled` pada tipe `CollisionShape2D` di _scene_ `StonePlatform`, lalu coba jalankan _scene_ `MainLevel`. Apa yang terjadi?**

Ketika atribut `Disabled` pada tipe `CollisionShape2D` diaktifkan, _script_ yang menampilkan pesan log "Reached objective!" tidak dijalankan. Berdasarkan [dokumentasi `Area2D`](https://docs.godotengine.org/en/stable/tutorials/physics/using_area_2d.html), `Area2D` berfungsi untuk mendefinisikan wilayah dari area 2D yang dimana di dalamnya dapat digunakan untuk mendeteksi _node_ `CollisionObject2D`lainnya _overlapping_, _entering_, dan _exiting_. `Area2D` umumnya digunakan untuk mendeteksi _contact_ dan _overlap_ antar _node_ `CollisionObject2D` tanpa memerlukan _physics_ seperti memantul.

Dari proyek tutorial-2, diketahui bahwa _scene_ `BlueShip` juga memiliki `CollisionObject2D` sebagai *child*nya. Hal ini dapat menunjukkan interaksi antara `CollisionObject2D` milik `BlueShip` dengan milik `ObjectiveArea` sehingga _node_ `Area2D` yang dimiliki oleh `ObjectiveArea` dapat mendeteksi _collision_ antara kedua `CollisionObject2D` tersebut. Ketika atribut `Disabled` dinyalakan, fungsi dari `CollisionObject2D` tidak berjalan / mati yang mengakibatkan `Area2D` tidak dapat mendeteksi _collision_ yang terjadi.

5. **Pada _scene_ `MainLevel`, coba manipulasi atribut `Position`, `Rotation`, dan `Scale` milik node `BlueShip` secara bebas. Apa yang terjadi pada visualisasi `BlueShip` di Viewport?**

**`Position`** :

- `x` : semakin besar nilai, posisi `BlueShip` akan semakin ke **kanan**, begitu pula sebaliknya.
- `y` : semakin besar nilai, posisi `BlueShip` akan semakin ke **atas**, begitu pula sebaliknya.

**`Rotation`** : Mengatur arah rotasi dari `BlueShip`

**`Scale`** :

- `x` : semakin besar nilai, semakin besar ukuran horizontal `BlueShip`, begitu pula sebaliknya.
- `y` : semakin besar nilai, semakin besar ukuran vertikal `BlueShip`, begitu pula sebaliknya.

6. **Pada _scene_ `MainLevel`, perhatikan nilai atribut `Position` node `PlatformBlue`, `StonePlatform`, dan `StonePlatform2`. Mengapa nilai `Position` node `StonePlatform` dan `StonePlatform2` tidak sesuai dengan posisinya di dalam _scene_ (menurut Inspector) namun visualisasinya berada di posisi yang tepat?**

Atribut `Position` pada suatu _node_ berfungsi untuk menunjukkan posisi _node_ tersebut relatif terhadap posisi pusat (0, 0) **parent**nya. Hal ini menjelaskan kenapa secara visualisasinya `StonePlatform` dan `StonePlatform2` berada di posisi yang tepat. Posisi pusat (0, 0) dari kedua _node_ tersebut sudah berubah mengikuti posisi dari `PlatformBlue` dari posisi pusat (0, 0) _scene_ `MainLevel`.

---

# Latihan Mandiri: Membuat Level Baru

Silakan baca referensi yang tersedia untuk belajar bagaimana caranya untuk membuat node dan scene di Godot. Kemudian silakan berlatih untuk membuat level baru berisi tipe pesawat dan landasan yang berbeda dari level awal. Gunakan aset gambar pesawat dan landasan yang berbeda dari `BlueShip` dan `StonePlatform` untuk membuat tipe pesawat dan landasan baru.

Pada level baru ini, diharapkan kamu dapat membuat:

- [x] Objek pesawat baru.
- [x] Objek landasan baru.
- [x] Desain level yang berbeda dari level awal dengan menempatkan `ObjectiveArea` di pojok kanan atas atau pojok kana bawah area permainan di level baru.
- [x] Silakan berkreasi jika ingin memoles level awal maupun level baru. Beberapa ide polishing:
  - [x] Implementasi reset kondisi level ketika pesawatnya jatuh ke luar area permainan.
        https://forum.godotengine.org/t/reloading-a-scene/11896/3
  - [x] Implementasi transisi level awal ke level baru ketika pemain berhasil mencapai ObjectiveArea. Misalnya menampilkan pesan kemenangan sesaat sebelum pindah level.
        https://forum.godotengine.org/t/changing-levels/46908
        https://docs.godotengine.org/en/3.5/classes/class_scenetreetimer.html
  - [x] Menambahkan gambar latar.
  - [x] Menambahkan rintangan objek statis pada level baru.
  - Dan lain-lain. Silakan berkreasi!
