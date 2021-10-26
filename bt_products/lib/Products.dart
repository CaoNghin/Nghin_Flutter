import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
class Product{
  final int id;
  final String title;
  final dynamic price;
  final String description;
  final String category;
  final String image;
  final dynamic rating;



  Product(this.id, this.title, this.price, this.description, this.category, this.image, this.rating);

  static Future<List<Product>> fetchData() async{
    String url = "https://fakestoreapi.com/products";
    var client = http.Client();
    var response = await client.get(Uri.parse(url));
    if (response.statusCode == 200){
      print('Tai du lieu thanh cong');
      var result = response.body;
      var jsonData = jsonDecode(result);

      List<Product> lp=[];
      for(var item in jsonData){
        var id=item['id'];
        var title=item['title'];
        var price =item['price'];
        var description=item['description'];
        var category=item['category'];
        var image=item['image'];
        var rating=item['rating'];
        Product p=new Product(id, title, price, description, category, image, rating);
        lp.add(p);
      }
      return lp;

    }
    else{
      print("Tai du lieu that bai");
      throw Exception("loi lay du lieu. Chi tiet: ${response.statusCode}");
    }

  }
}