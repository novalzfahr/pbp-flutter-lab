import 'package:tugas_flutter/formBudget.dart';
import 'package:tugas_flutter/displayBudget.dart';
import 'package:tugas_flutter/models.dart';
import 'package:tugas_flutter/drawer.dart';
import 'package:tugas_flutter/main.dart';
import 'package:flutter/material.dart';


class MyFormBudgetPage extends StatefulWidget {
    const MyFormBudgetPage({super.key});

    @override
    State<MyFormBudgetPage> createState() => _MyFormBudgetPageState();
}

class _MyFormBudgetPageState extends State<MyFormBudgetPage> {
  final _formKey = GlobalKey<FormState>();
  String _judulBudget = '';
  int _nominalBudget = 0;
  String _tipeBudget = 'Pengeluaran';
  List<String> tipeBudget = ['Pemasukan', 'Pengeluaran'];
  DateTime? _dateTime;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
        ),
        drawer: const MyDrawer(),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Contoh: Beli Aqua",
                        labelText: "Judul",
                        icon: const Icon(Icons.money),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _judulBudget = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          _judulBudget = value!;
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Judul tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Contoh: 1000",
                        labelText: "Nominal",
                        icon: const Icon(Icons.money),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          _nominalBudget = int.parse(value!);
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          _nominalBudget = int.parse(value!);
                        });
                      },
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Nominal tidak boleh kosong!';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: const Icon(Icons.calendar_today),
                      title: Text(_dateTime == null
                              ? 'Nothing has been picked yet'
                              : _dateTime.toString()
                              ),
                      trailing: ElevatedButton(
                        child: const Text(
                          "Pilih Tanggal",
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: (() {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2099),
                          ).then((date) {  //tambahkan setState dan panggil variabel _dateTime.
                            setState(() {
                              _dateTime = date;
                            });
                          });
                        }),
                      ),
                    ),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: _tipeBudget,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: tipeBudget.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _tipeBudget = newValue!;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 380),
                    child: TextButton( 
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        ), 
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child:
                        Text(
                          'Simpan',
                          style: TextStyle(color: Colors.white),)
                        ),
                        onPressed:() {
                          if (_formKey.currentState!.validate()) {
                            listBudget.add(MyBudget(_judulBudget, _nominalBudget, _tipeBudget, _dateTime));
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyDisplayBudgetPage()
                              ));
                          }
                        },
                      ),
                    )
                  ],  
                ),
              ),  
            ),
        )
    );
  }
}