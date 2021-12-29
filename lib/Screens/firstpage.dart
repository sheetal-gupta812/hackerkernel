import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hackerkernel/Screens/showimage.dart';
import 'package:hackerkernel/Widgets/color.dart';
import 'package:hackerkernel/Widgets/text.dart';
import 'package:http/http.dart' as http;
import '../album.dart';

Future<List<Photo>> fetchPhotos(http.Client client) async {
  final response = await client
      .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

  return compute(parsePhotos, response.body);
}

List<Photo> parsePhotos(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorData.primary,
        elevation: 0.0,
        title: AppText(
          'Photos',
          size: 20,
          color: ColorData.secondary,
        ),
      ),
      body: FutureBuilder<List<Photo>>(
        future: fetchPhotos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return PhotosList(photos: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  const PhotosList({Key? key, required this.photos}) : super(key: key);

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return photos.isEmpty
        ? const Center(
            child: CircularProgressIndicator(
            color: ColorData.darkBlue,
          ))
        : ListView.builder(
            itemCount: photos.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          photos[index].title,
                          size: 16,
                          color: ColorData.darkBlue,
                          fontWeight: FontWeight.w400,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ShowImage(photos[index].url)),
                              );
                            },
                            child: Image.network(photos[index].url)),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}
