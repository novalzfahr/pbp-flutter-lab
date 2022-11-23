import 'package:flutter/material.dart';
import 'package:tugas_flutter/Page/myWatchListDetail.dart';
import 'package:tugas_flutter/main.dart';
import 'package:tugas_flutter/Page/myWatchList.dart';
import 'package:tugas_flutter/drawer.dart';
import 'package:flutter/services.dart';
import 'package:tugas_flutter/Page/fetchDataWatchlist.dart';
import 'dart:convert';
import 'package:tugas_flutter/model/MyWatchList.dart';

class MyWatchListPage extends StatefulWidget {
    const MyWatchListPage({Key? key}) : super(key: key);

    @override
    _WatchListState createState() => _WatchListState();
}

class _WatchListState extends State<MyWatchListPage> {
    List<bool> watchStatus = [];
    @override
    Widget build(BuildContext context){
            return Scaffold(
            appBar: AppBar(
              title: const Text('My Watch List'),
            ),
            drawer: const MyDrawer(),
            body: FutureBuilder(
                future: fetchMyWatchList(),
                builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      for (int i = 0; i < snapshot.data!.length; i++) {
                        var value = snapshot.data![i].fields.watched;
                        if (value.toString() ==  "Watched.IYA") {
                          watchStatus.add(true);
                        } else{
                          watchStatus.add(false);
                        }
                      }
                        if (!snapshot.hasData) {
                          return Column(
                        children: const [
                            Text(
                            "Tidak ada my watch list :(",
                            style: TextStyle(
                                color: Color(0xff59A5D8),
                                fontSize: 20),
                            ),
                            SizedBox(height: 8),
                        ],
                        );
                    } else {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index)=> Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            padding: const EdgeInsets.all(20.0),
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
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    child: Text(
                                      "${snapshot.data![index].fields?.title}",
                                      style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>
                                          WatchlistDetailPage(
                                            watchlistData: snapshot.data![index],
                                    )
                                    ))
                                    },
                                  ),
                                  Checkbox(
                                    value: watchStatus[index],
                                    onChanged: (value) {
                                      setState(() {
                                        watchStatus[index] = value!;
                                      });
                                    }
                                  )
                                ],
                            ),
                            )
                        );
                    }
                    }
                }
            )
        );
  }
}