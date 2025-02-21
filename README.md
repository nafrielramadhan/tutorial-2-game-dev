**Sekarang coba gerakkan objek landasan ke atas sehingga objek pesawatnya hampir menyentuh batas atas area permainan/*window*. Kemudian jawablah pertanyaan-pertanyaan berikut:**

1. **Apa saja pesan log yang dicetak pada panel Output?**

Log yang dicetak: **“Reached Objective!”**

2. **Coba gerakkan landasan ke batas area bawah, lalu gerakkan kembali ke atas hingga hampir menyentuh batas atas. Apa saja pesan log yang dicetak pada panel Output?**

Log yang dicetak: **“Reached Objective!”**

3. **Buka scene MainLevel dengan tampilan workspace 2D. Apakah lokasi scene ObjectiveArea memiliki kaitan dengan pesan log yang dicetak pada panel Output pada percobaan sebelumnya?**

Iya, berkaitan. Lokasi scene ObjectiveArea menjadi patokan lokasi scene lain ketika game dimainkan. Jika scene BlueShip mengenai scene ObjectiveArea, maka akan muncul log “Reached Objective!”.

Scene ObjectiveArea ini memiliki type: Area2D dan juga memiliki children CollisionShape2D dengan type: CollisionShape2D. Jadi, log "Reached Objective" akan muncul jika BlueShip collide dengan CollisionShape2D tersebut.

Hal itu terjadi karena scene ObjectiveArea memiliki script berikut:

func _on_ObjectiveArea_body_entered(body: RigidBody2D):

if (body.name == "BlueShip"):

print("Reached objective!")

**Sekarang coba kamu inspeksi scene-scene pada contoh proyek tutorial 2 dan jawablah pertanyaan-pertanyaan berikut:**

4. **Scene BlueShip dan StonePlatform sama-sama memiliki sebuah child node bertipe Sprite. Apa fungsi dari node bertipe Sprite?**

Node Sprite ini berfungsi untuk menampilkan tekstur 2D.

Pada BlueShip dan StonePlatform, Sprite2D menggunakan gambar yang tersedia pada folder assets.

5. **Root node dari scene BlueShip dan StonePlatform menggunakan tipe yang berbeda. BlueShip menggunakan tipe RigidBody2D, sedangkan StonePlatform menggunakan tipe StaticBody2D. Apa perbedaan dari masing-masing tipe node?**

Yang saya rasakan saat bermain game ini adalah StaticBody2D (StonePlatform) dapat menggerakkan RigidBody2D (BlueShip) dengan memberikan force ke RigidBody2D tersebut.

Jadi perbedaannya adalah:

RigidBody2D: Objek yang merespons terhadap benturan atau gaya (force), tetapi tidak dikontrol secara langsung. Kita harus menerapkan gaya untuk menggerakkannya.

StaticBody2D: Objek statis yang tidak merespons terhadap benturan, tetapi bisa mempengaruhi pergerakan objek lain (seperti landasan tempat RigidBody2D berdiri).

6. **Ubah nilai atribut Mass pada tipe RigidBody2D secara bebas di scene BlueShip, lalu coba jalankan scene MainLevel. Apa yang terjadi?**

Tidak ada perubahan yang dirasakan ketika saya coba besarkan mass-nya menjadi 1000kg maupun ringankan mass-nya menjadi 0.001kg.

Kecepatan saat BlueShip jatuh tidak berubah.

Berat yang dirasakan saat saya menggerakkan StonePlatform ke atas juga tidak berubah.

Hasilnya sama seperti jika mass-nya tetap di 1kg.

7. **Ubah nilai atribut Disabled pada tipe CollisionShape2D di scene StonePlatform, lalu coba jalankan scene MainLevel. Apa yang terjadi?**

Yang terjadi adalah BlueShip (RigidBody2D) jatuh ke bawah dan melewati StonePlatform.

Tidak ada force yang menahan BlueShip berdiri di atas StonePlatform, karena CollisionShape2D pada StonePlatform telah dinonaktifkan, sehingga tidak ada deteksi tabrakan.

8. **Pada scene MainLevel, coba manipulasi atribut Position, Rotation, dan Scale milik node BlueShip secara bebas. Apa yang terjadi pada visualisasi BlueShip di Viewport?**

Pada scene MainLevel, coba manipulasi atribut Position, Rotation, dan Scale milik node BlueShip secara bebas. Apa yang terjadi pada visualisasi BlueShip di Viewport?

Visualisasi BlueShip pada Viewport langsung berubah sesuai dengan manipulasi yang dilakukan.

Before:

https://lh7-rt.googleusercontent.com/docsz/AD_4nXfTLY6tGgZjqkU4ImmPRWdHbdQEK7VaI0wMMUH0_RevEVTeM9k1bGp4h1kw-agZWwZxCyhS0kxKBMlBdx7b1_CJleVxR1BaZQaJOmTdW25AjspNtXrt7Tf8RPmg8yoIl-s5MBY4?key=N0F6D6p8bH8_b4B45e7YHyz8

After:

https://lh7-rt.googleusercontent.com/docsz/AD_4nXethHENFQOQnKK7yd67IYWQssBac3tJJz5H1tMEtgCQjpHXy4q0ehh3Ai4SNxaqQNkYwGn6OjqRbq4iqTMxgbDknXHZqoNX9nQVzLoEDx_Esqbc1hU0V8_9WXuKKw_jSBoCcijc?key=N0F6D6p8bH8_b4B45e7YHyz8

Namun, muncul warning saat saya scale up objek.

https://lh7-rt.googleusercontent.com/docsz/AD_4nXd6KZXr7W-_JNEAZv6ZavybXlNaqT2VQ3He2FTu8qTQ7ErqAoZoSPF3rRiE2rxhJWEGle4QxXibE6EjVZy-9YAVTbqd4sDh3KiAwQQA3SxA5oc449-jBbb-C3YmYt-tsOLAB-5N?key=N0F6D6p8bH8_b4B45e7YHyz8

Saat game dijalankan, perubahan scale tidak diterapkan karena saya tidak mengubah scale pada child node CollisionShape2D secara langsung.

https://lh7-rt.googleusercontent.com/docsz/AD_4nXe7E0R7OXsh75ws33EXu1beHP03pxbkZoARNk0W6nYXid1u0A08D2jr5A0jiGYMQmTuXMHlL0G-MxRlS24XgtcgCHG0W-u9U5TqXFxpZkZbPNlF2HZORySjlMrrUEw4TRAs9Fs?key=N0F6D6p8bH8_b4B45e7YHyz8

Solusi:

Saya ubah langsung ukuran CollisionShape2D, dan perubahan ukuran tersebut akhirnya teraplikasi saat MainLevel dijalankan.

https://lh7-rt.googleusercontent.com/docsz/AD_4nXcaopZbpfyKsRyK_UGxt3vuBSe0FCF8VUyI2JzobHiMeNAf7okK1coT5D4YrEne2wvkkT22GVAVWEpVoBQ5tEaZ8NLM-RtgUopOk-qtAJjIILUVdbMpLaE8er3c884Mx_G9uwh0?key=N0F6D6p8bH8_b4B45e7YHyz8

https://lh7-rt.googleusercontent.com/docsz/AD_4nXcVltComcN8X7UYUdJ5z4FYQLH50kQqoZJ3KE7Q1xIZStpAbNEsnun2sG4iJGNemg62WbvNv4FJ_ZMrZscrIIZYgoSjPVfljGOMcWLm1g6tTBXZHqk-oFtxcvNOUfLUNU-q3ulx?key=N0F6D6p8bH8_b4B45e7YHyz8

9. **Pada scene MainLevel, perhatikan nilai atribut Position node PlatformBlue, StonePlatform, dan StonePlatform2. Mengapa nilai Position node StonePlatform dan StonePlatform2 tidak sesuai dengan posisinya di dalam scene (menurut Inspector) namun visualisasinya berada di posisi yang tepat?**

Nilai Position dari masing-masing node:

PlatformBlue:

https://lh7-rt.googleusercontent.com/docsz/AD_4nXfeDOaYOannE2kdLUCKmQsZIWek9pas57fwBW0-loNK28Ght7q_D15SNPY340vQD3-jZy8cmM2n3IPtXyWCP3m1UEyepZu-nJLo5XUswP8wg4wCEygMuJfRbAdp4UjkK91xYsot?key=N0F6D6p8bH8_b4B45e7YHyz8

StonePlatform:

https://lh7-rt.googleusercontent.com/docsz/AD_4nXd5-a1J66TGn2qIpwjp-6JUMaE0BBAPPABHfSQgfvxVIxxtVZP9VI6QwMko1l-HxrIu7_l0ekcAeZEJXkaupOeUukYrAmj2HHjlibQ1QdDg_uwDLlFnRLRnzUKuawxvA6aRo6sK?key=N0F6D6p8bH8_b4B45e7YHyz8

StonePlatform2:

https://lh7-rt.googleusercontent.com/docsz/AD_4nXdhg9XbBw5vorNVV9BtsLm1rb9MjehqbtvBCO-6I303qqSojn_6mHDt6JdcQk_5WjAi74-ocGqaGoKxrWXB0zFghvF2T8UAAQ8N6QNOpay8-qnT4ffrJC8UAmr0l6Un880ym0k?key=N0F6D6p8bH8_b4B45e7YHyz8

Berdasarkan gambar tersebut, nilai atribut position node PlatformBlue visualisasinya sesuai dengan tampilan di viewport. Namun, nilai atribut position node StonePlatform dan StonePlatform2 tidak sesuai dengan tampilan di viewport. Hal ini terjadi karena StonePlatform dan StonePlatform2 berada dalam parent node PlatformBlue. Artinya, posisi mereka adalah relatif terhadap PlatformBlue, bukan terhadap origin scene MainLevel.
