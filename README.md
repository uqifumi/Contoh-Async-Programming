# Asynchronous Programming dengan Flutter (async - await)
Program yang mendemonstrasikan asynchronous programming dengan framework flutter. Program menampilkan waktu sholat kota Malang dimana data yang digunakan hasil request ke server dengan JSON API lewat jaringan internet. Adapun tampilan dari program tersebut ketika pertama kali dijalankan adalah sebagai berikut:
<br><br><img src="https://github.com/uqifumi/Contoh-Async-Programming/blob/master/dokumentasi/Screenshot1.png" width="250"/><br><br>
Dari gambar terlihat tampilan program terdiri dari nama kota yaitu kota malang dengan, hari/tanggal yang masih kosong, dan jadwal sholat lima waktu yang juga masih masih kosong. Hal ini disebabkan karena program sengaja dibuat untuk tidak melakukan request data secara otomatis (langsung) pada saat dijalankan, untuk menunjukkan proses asynchronous. 
Request data dapat dilakukan dengan tap/klik tombol floating action button berwarna biru yang terletak di sebelah kanan bawah.
## Proses Asynchronous
Begitu program melakukan request data ke server melalui jaringan internet dengan JSON API maka akan ditampilkan circular progress indicator yang mengindikasikan bahwa diperlukan waktu untuk menunggu respon dari server. Di sini ditunjukkan bahwa program menjalankan proses secara asynchronous, yaitu request data ke server dan menunggu responnya secara background (di latar belakang) serta menampilkan widget berupa circular progress indicator ke layar. Berikut tampilan circular progress indicator yang dimaksud:
<br><br><img src="https://github.com/uqifumi/Contoh-Async-Programming/blob/master/dokumentasi/Screenshot3.png" width="250"/><br><br>
## Menampilkan Hasil
Jika request data dari program berhasil diterima oleh server (tidak terjadi error, misalnya: kendala koneksi internet atau kesalahan url endpoint JSON API) dan server memberikan respon mengirimkan data berformat JSON, maka data akan diterima oleh program dan tampilan circular progress indicator di layar akan diganti dengan layout yang menampilkan data tersebut. Berikut tampilan pesan error/kegagalan pemuatan data:
<br><br><img src="https://github.com/uqifumi/Contoh-Async-Programming/blob/master/dokumentasi/Screenshot4.png" width="250"/><br><br>
Data yang ditampilkan berupa hari/tanggal saat ini dan waktu sholat lima waktu. Tampilan data hari/tanggal dan waktu sholat tersebut adalah sebagai berikut:
<br><br><img src="https://github.com/uqifumi/Contoh-Async-Programming/blob/master/dokumentasi/Screenshot2.png" width="250"/><br><br>

## Paket yang digunakan:
http: ^0.13.5 (https://pub.dev/packages/http)<br>
intl: ^0.17.0 (https://pub.dev/packages/intl)<br>


## Referensi:
Dokumentasi JSON API dan URL endpoint yang digunakan di program dapat diakses di: 
https://fathimah.docs.apiary.io/#reference/sholat  
