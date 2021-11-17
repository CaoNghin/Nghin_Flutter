import 'dart:convert';

import 'package:http/http.dart' as http;
class Article{

  String title;
  String author;
  String description;
  String urlToImage;
  DateTime publshedAt;
  String content;
  String articleUrl;

  Article({this.title,this.description,this.author,this.content,this.publshedAt,
    this.urlToImage, this.articleUrl});

}

class News{

  List<Article> dsnews  = [];

  Future<void> getNews() async{


    List<News> ln=[];
    String url="https://newsapi.org/v2/everything?q=apple&from=2021-11-16&to=2021-11-16&sortBy=popularity&apiKey=3988004bfd6f404699854ca5ec38c3b4";
    var client = http.Client();
    var response = await client.get(Uri.parse(url));

    if (response.statusCode == 200){
      print('Tai du lieu thanh cong');
      var result = response.body;
      var jsonData = jsonDecode(result);

      if(jsonData['status'] == "ok"){
        jsonData["articles"].forEach((element){

          if(element['urlToImage'] != null && element['description'] != null){
            Article ar = Article(
              title: element['title'],
              author: element['author'],
              description: element['description'],
              urlToImage: element['urlToImage'],
              publshedAt: DateTime.parse(element['publishedAt']),
              content: element["content"],
              articleUrl: element["url"],
            );
            dsnews.add(ar);
          }


        });

       }
    }

  else{
    print("Tai du lieu that bai");
    throw Exception("loi lay du lieu. Chi tiet: ${response.statusCode}");
  }


}


}
