import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:hackerkernel/Widgets/color.dart';
import 'package:hackerkernel/Widgets/text.dart';
import 'package:http/http.dart' as http;
import '../album.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late Future<List<Data>> futureData;

  Future<List<Data>> fetchData() async {
    var url = 'https://jsonplaceholder.typicode.com/posts';
    final response = await http.get(Uri.parse(url));
    log('URL:-' + url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => Data.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  void showDetails(BuildContext context, String id, title, body) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, left: 20, bottom: 15, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    "Id:- " + id,
                    color: ColorData.secondary,
                    size: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  AppText(
                    title,
                    color: ColorData.secondary,
                    size: 18,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  AppText(
                    body,
                    color: ColorData.grey,
                    size: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorData.primary,
        elevation: 0.0,
        title: AppText(
          'Posts',
          color: ColorData.secondary,
          size: 20,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder<List<Data>>(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Data>? data = snapshot.data;
              return ListView.builder(
                  itemCount: data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 15.0, left: 20, right: 20.0),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, left: 20, bottom: 15, right: 20.0),
                          child: GestureDetector(
                            onTap: () {
                              showDetails(context, data[index].id.toString(),
                                  data[index].title, data[index].body);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText(
                                  data[index].title,
                                  color: ColorData.secondary,
                                  size: 18,
                                  fontWeight: FontWeight.w400,
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                AppText(
                                  data[index].body,
                                  color: ColorData.grey,
                                  size: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
