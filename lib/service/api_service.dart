import 'dart:convert';

import 'package:globenews/model/article.model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService{
   var url = Uri.parse('https://newsapi.org/v2/everything?domains=wsj.com&apiKey=22ae7e2bde3f4e56a149b6b7de102da6');

   Future<List<Article>> getArticle() async {
      http.Response res = await get(url);

      if(res.statusCode == 200){
         Map<String, dynamic> json = jsonDecode(res.body);
         List<dynamic> body = json["articles"];

         List<Article> articles = body.map((dynamic item) => Article.fromJson(item)).toList();
         return articles;
      }else{
         throw("cant get the article");
      }
   }
}




