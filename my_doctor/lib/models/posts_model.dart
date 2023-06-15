import 'dart:convert';
import 'package:http/http.dart' as http;

class PostsModel{
  String userId;
  int catigoryId;
  String catigoryName;
  String title;
  String content;
  String imagepath;
  String datePosted;


  PostsModel({required this.userId,required this.catigoryId,
    required this.catigoryName,required this.title,required this.content,required this.imagepath,required this.datePosted
  });


  factory PostsModel.fromjson(jsonData){
    return PostsModel(
      catigoryId: jsonData['catigoryId'],
      catigoryName: jsonData['catigoryName'],
      title: jsonData['title'],
      userId: jsonData['userId'],
      content: jsonData['content'],
      imagepath: jsonData['imagepath'],
      datePosted: jsonData['datePosted'],
    );
  }



}