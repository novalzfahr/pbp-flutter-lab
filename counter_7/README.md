# Tugas 7
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

# Tugas 8
**1. Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement**
- `Navigator.push` akan memunculkan layar lain diatas layar saat ini.
- `Navigator.pushReplacement` akan menggantikan layar saat ini dengan layar baru. 

**2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.**
- ListTile: Menampilkan beberapa baris teks ke dalam sebuah list
- Padding: Mengatur padding
- DropdownButton: Memberikan user memilih item dalam bentuk dropdown.
- DropdownHideUnderline: menghapus underline dari `DropdownButton`
- TextButton: membuat button
- Drawer: Membuat hamburger menu pada app untuk navigasi.
- ListView.builder: untuk menampilkan data yang ada pada child items.

**3. Sebutkan jenis-jenis event yang ada pada Flutter**
- onPressed: ter-*trigger* saat ditekan oleh user.
- onChanged: Event yang terjadi saat user ingin melakukan perubahan ke TextField atau fields lainnya.
- onTap: Event yang terjadi saat *taps* pada objek yang akan di render.

**4.  Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter**
- Cara kerja navigator menggunakan prinsip stack. Saat ingin navigasi ke layar lain, layar lain itu akan di push ke *top* dari stack. Metode *pop* digunakan untuk kembali ke layar sebelumnya.

**5.  Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.**
- Membuat drawer lalu refactor file drawer ke file terpisah
- Pada drawer tambahkan navigasi ke halaman counter, form, dan data budget
```
children: [
          // Menambahkan clickable menu
          ListTile(
            title: const Text('Counter'),
            onTap: () {
              // Route menu ke halaman utama
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyHomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Tambah Budget'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyFormBudgetPage()),
              );
            },
          ),
          ListTile(
            title: const Text('Data Budget'),
            onTap: () {
              // Route menu ke halaman form
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const MyDisplayBudgetPage()),
              );
            },
          ),
        ]
```
- Membuat file `formBudget.dart` lalu membuat var input `_judulBudget`, `_nominalBudget`, `tipeBudget` lalu membuat button untuk *save form*.
- Display data dari form pada `displayBudget.dart`.
```
class _MyDisplayBudgetPageState extends State<MyDisplayBudgetPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Budget'),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: ListView.builder(
        itemCount: listBudget.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Material(
              elevation: 2.0,
              borderRadius: BorderRadius.circular(5.0),
              shadowColor: Colors.blueGrey,
              child: ListTile(
                title: Text(listBudget[index].judul),
                subtitle:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(listBudget[index].nominal.toString()),
                    Text(listBudget[index].tipeBudget),
                    Text(listBudget[index].dateTime.toString()),
                  ]
                ) 
              )
            ),
          );
        }),
      )),
    );
  }
}
```

# Tugas 9
**1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?**
- Ya, kita bisa mendapatkan data JSON tanpa terlebih dahulu membuat model. Kita dapat membuat *dynamic map* dari JSON dan mengakses nilainya dengan *dictionary* pada python. Namun, itu tidak dianjurkan karena kita tidak akan tahu apakah ada field yang hilang atau jika field tersebut tidak sesuai dengan yang kita inginkan sehingga sulit untuk mendeteksi  kesalahan dan tidak tahu data apa yang diambil.

**2. Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.**
- `GestureDetector`: Widget ini, kita bisa menentukan event apa saja dan function yang merespon pada widget child nya.
- `Checkbox`: Untuk membuat *clickable checkbox* yang mengubah nilai `true` -> `false` dan sebaliknya.
- `FutureBuilder`: Widget yang membangun sendiri berdasarkan objek `Future` terakhir yang diterima.
- `ListTile`: Widget yang digunakan untuk membuat list.
- `BoxShadow`: widget ini mengatur efek bayangan yang ada pada box.
- `TextButton`: Widget ini untuk membuat tombol.

**3. Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.**
- Data diambil melalui HTTP melalui metode `fetchWatchlist`, yang memanggil fungsi get menggunakan HTTP *instances*. Fungsi ini  me*return* list MyWatchlist. `FutureBuilder` akan menjalankan fungsi dan menunggunya kembali. Saat data diperoleh, FutureBuilder *return* `ListView.builder`, yang *builds* `ListTiles` dari data yang telah dipetakan yang di*return* oleh metode `fetchWatchlist`.

**4. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.**
- Membuat tombol navigasi
```
ListTile(
  title: const Text('My Watch List'),
  onTap: () {
    // Route menu ke halaman form
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const MyWatchListPage()),
    );
  },
),
...
```
- Membuat file `mywatchlist.dart` untuk menyimpan model
- Membuat `myWatchList.dart` dan `myWatchListDetail.dart` untuk menampilkan data dari json.
- Membuat navigator untuk ke halaman myWatchList detail
```
onTap: () => {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>
      WatchlistDetailPage(
        watchlistData: snapshot.data![index],
      )
  ))
},
...
```
- Membuat *checkbox* untuk bagian bonus
```
Checkbox(
  value: watchStatus[index],
  onChanged: (value) {
    setState(() {
      watchStatus[index] = value!;
    });
  }
)
...
```
- Menambahkan outline dengan dua warna berbeda berdasarkan status ditontonnya.
```
decoration: BoxDecoration(
    color:Colors.white,
    border: Border.all(
      color: (watchStatus[index]) ? Colors.greenAccent: Colors.redAccent,
      width: 3.5
    ),
    borderRadius: BorderRadius.circular(15.0),
    boxShadow: const [
    BoxShadow(
        color: Colors.black,
        blurRadius: 2.0
    )
    ]
),
...
```
- Refactor fungsi fetch ke dalam file `fetchDataWatchlist.dart`.

