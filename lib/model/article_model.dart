import 'package:techblog/component/_apiConstans.dart';

class ArticleModel {
  String? id;
  String? title;
  String? image;
  String? catID;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;

  ArticleModel({
    required this.id,
    required this.title,
    required this.image,
    required this.catID,
    required this.catName,
    required this.author,
    required this.view,
    required this.status,
    required this.createdAt,
  });

  ArticleModel.fromJason(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = apiConstant.hostDLurl + element["image"];
    catID = element["cat_id"];
    catName = element["cat_name"];
    author = element["author"];
    view = element["view"];
    status = element["status"];
    createdAt = element["created_at"];
  }
}
