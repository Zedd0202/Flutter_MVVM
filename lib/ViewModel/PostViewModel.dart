import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app_mvvm/Model/Post.dart';

class PostViewModel extends ChangeNotifier {
  List<Post> lists = List<Post>();

  Future<List<Post>> fetchPost() async {
    final response =
    await http.get('https://jsonplaceholder.typicode.com/posts');
    if (response.statusCode == 200) {
      // 만약 서버가 OK 응답을 반환하면, JSON을 파싱합니다.
      List responseJson = json.decode(response.body);
      return responseJson.map((post) => new Post.fromJson(post)).toList();
      //notifyListeners();
    } else {
      // 만약 응답이 OK가 아니면, 에러를 던집니다.
      throw Exception('Failed to load post');
    }
  }
}

