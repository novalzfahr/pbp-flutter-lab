import 'package:tugas_flutter/Page/myWatchList.dart';
import 'package:tugas_flutter/model/mywatchlist.dart';
import 'package:flutter/material.dart';
import 'package:tugas_flutter/main.dart';
import 'package:tugas_flutter/drawer.dart';
import 'package:flutter/services.dart';

class WatchlistDetailPage extends StatelessWidget {
  final MyWatchList watchlistData;
  const WatchlistDetailPage({
    super.key, 
    required this.watchlistData, 
  });

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
      ),
      drawer: const MyDrawer(),
      body: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Column(
                    children: [
                      Text(
                        watchlistData.fields!.title.toString(),
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ListTile(
                        leading: const Text(
                          'Release Date: ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          watchlistData.fields!.releaseDate.toString(),
                          style: const TextStyle(fontSize: 16),
                        ),
                        dense: true,
                      ),
                      ListTile(
                        leading: const Text(
                          'Rating: ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          '${watchlistData.fields!.rating} / 5',
                          style: const TextStyle(fontSize: 16),
                        ),
                        dense: true,
                      ),
                      ListTile(
                        leading: const Text(
                          'Status: ',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          // ignore: unrelated_type_equality_checks
                          watchlistData.fields!.watched == Watched.IYA ? "Watched": "Not Watched",
                          style: const TextStyle(fontSize: 16),
                        ),
                        dense: true,
                      ),
                      ListTile(
                        title: const Padding(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: Text(
                            'Review: ',
                            style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        dense: true,
                        subtitle: Text(
                          watchlistData.fields!.review.toString(),
                          style: const TextStyle(
                            fontSize: 14, color: Colors.black),
                        )
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: SizedBox(
            width: double.maxFinite,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(Colors.blue),
                  foregroundColor:MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                  )
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'Back',
                    style: TextStyle(fontSize: 15),
                  ),
                )
            )
          )
        )
    );
  }
}