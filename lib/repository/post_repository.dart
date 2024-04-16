import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

import '../model/post_model.dart';

class PostRepository {
  final dio = Dio();

  Future<List<PostModel>> fetchPost() async {
    try {
      final response =
          await dio.get(('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        //final List<dynamic> body = json.decode(response.data); // Since Dio automatically parses JSON responses for you, you should directly access response.data without using json.decode.
        final List<dynamic> body = response.data;
        return body.map((json) {
          // final map = json as Map<String, dynamic>;
          return PostModel(
            userId: json['userId'] as int,
            id: json['id'] as int,
            title: json['title'] as String,
            body: json['body'] as String,
          );
        }).toList();
      }
    } on SocketException {
      await Future.delayed(const Duration(milliseconds: 1800));
      throw Exception('No Internet Connection');
    } on TimeoutException {
      throw Exception('TimeoutException');
    }

    throw Exception('error fetching data');
  }
}
