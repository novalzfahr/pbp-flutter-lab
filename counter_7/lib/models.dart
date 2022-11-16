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
List<MyBudget> listBudget = <MyBudget>[]; // List untuk menyimpan data 