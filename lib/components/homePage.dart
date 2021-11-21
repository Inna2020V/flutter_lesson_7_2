import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_lesson_7_2/helpers/constants.dart';
import 'package:flutter_lesson_7_2/helpers/gifs.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _gifsUrl = <String>[];
  GifsFetch _gifsFetch = GifsFetch();

  void updateData(gifData) {
    setState(() {
      if (gifData != null) {
        debugPrint('from home_page updateData');
        debugPrint(jsonEncode(gifData));
        for (int i = 0; i < numberOfGifs; i++) {
          _gifsUrl.add(
              gifData['data'][i]['images']['fixed_width']['url'].toString());
        }
      } else {
        for (int i = 0; i < numberOfGifs; i++) {
          _gifsUrl.add(defaultGif);
        }
      }
    });
  }

  _getGifs(gif) async {
    debugPrint('from home_page _getGifs');
    debugPrint(gif);
    _gifsUrl.clear();
    try {
      var dataDecoded;
      if (gif != '') {
        dataDecoded = await _gifsFetch.getGifs(gif);
      }
      updateData(dataDecoded);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                decoration: const InputDecoration(hintText: 'Search gifs'),
                onSubmitted: (String gif) => _getGifs(gif),
              ),
              if (_gifsUrl.isNotEmpty)
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    height: 600,
                    child: ListView.builder(
                        itemCount: _gifsUrl.length ~/ 2,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Image.network(
                                _gifsUrl[index * 2],
                                width: 185,
                              ),
                              Image.network(
                                _gifsUrl[index * 2 + 1],
                                width: 185,
                              )
                            ],
                          );
                        }),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
