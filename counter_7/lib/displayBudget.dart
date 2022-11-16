import 'package:tugas_flutter/formBudget.dart';
import 'package:tugas_flutter/displayBudget.dart';
import 'package:tugas_flutter/models.dart';
import 'package:tugas_flutter/drawer.dart';
import 'package:tugas_flutter/main.dart';
import 'package:flutter/material.dart';

class MyDisplayBudgetPage extends StatefulWidget {
  const MyDisplayBudgetPage({super.key});

  @override
  State<MyDisplayBudgetPage> createState() => _MyDisplayBudgetPageState();
}

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