**1.  Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget dan jelaskan perbedaan dari keduanya.**
- Stateless widget adalah widget yang statenya tidak dapat diubah.
    - Bersifat statik.
    - Tidak bergantung dengan perubahan data.
- Statefull widget adalah widget yang statenya dapat diubah.
    - Bersifat dinamik.
    - Bergantung dengan perubahan data.

**2.  Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.**
- Text: Berfungsi untuk menampilkan teks dan memiliki properti style untuk mengatur tampilannya.
- Row: Berfungsi untuk mengurutkan array dari kiri ke kanan.
- Padding: Berfungsi untuk mengatur layout.
- FloatingActionButton: Berfungsi untuk menampilkan button, selain itu juga dapat melakukan *action* sesuai keinginan *user*
- Visibility: Berfungsi untuk menyembunyikan widget apabila diperlukan.

**3.  Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.**
- Fungsi dari `setState()` adalah menampilkan perubahan-perubahan yang terjadi pada variabel yang ada pada sebuah class state. Yang terdampak adalah widget yang memiliki nilai variabel dan variabel yang terdapat dalam stateless widget.

**4. Jelaskan perbedaan antara const dengan final.**
- final
    - Hanya bisa di assign value satu kali yang akan diinisialisasi pada runtime.
    - Bisa digunakan dalam Class.
- const
    - value diassing saat runtime dan diinisialisasi saat compile time. Nilai variabel tidak dapat diubah saat runtime.
    - Hanya bisa digunakan di dalam function.

**5.  Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.**
- Membuat program dengan 
```
flutter create counter_7
```
- Mengubah tampilan dengan `home: const MyHomePage(title: 'Program Counter'),` 

- Membuat button add dan remove menggunakan `FloatingActionButton`

- Membuat fungsi untuk menambah dan mengurangi counter
```
  int _counter = 0;
  String _output = 'GENAP';
  MaterialColor _textColor = Colors.red;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _checkParity();
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
      _checkParity();
    });
  }
```
- membuat fungsi `_checkParity()` untuk cek ganjil atau genap dan mengubah warna teks jika ganjil atau genap
```
void _checkParity() {
setState(() {
    if (_counter % 2 != 0) {
    _output = 'Ganjil';
    _textColor = Colors.blue;
    } else {
    _output = 'Genap';
    _textColor= Colors.red;
    }
});
}  
```

