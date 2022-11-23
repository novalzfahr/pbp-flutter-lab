class MyBudget {
  String judul;
  int nominal;
  String tipeBudget;
  DateTime? dateTime;

  MyBudget(
    this.judul,
    this.nominal,
    this.tipeBudget,
    this.dateTime
  );
}
// List untuk menyimpan data dari form
List<MyBudget> listBudget = <MyBudget>[];