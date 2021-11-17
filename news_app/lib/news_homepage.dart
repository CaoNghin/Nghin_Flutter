
import 'package:flutter/material.dart';

import 'package:news_app/news.dart';
import 'package:news_app/news_carousel.dart';
import 'package:news_app/news_content.dart';

class Home extends StatefulWidget {
  const Home({ key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Flutter",
              style:
              TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            )
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListViewNews()

     );

  }
}


class ListViewNews extends StatefulWidget {
  const ListViewNews({key}) : super(key: key);

  @override
  _ListViewNewsState createState() => _ListViewNewsState();
}

class _ListViewNewsState extends State<ListViewNews> {
  var dsNews;
   List<Carousel> carousels = List<Carousel>();

   void getNews() async {
     News news = News();
     await news.getNews();
     dsNews = news.dsnews ;
     setState(() {
      // _loading = false;
     });
   }
  @override
  void initState(){
    super.initState();

    carousels = getCarousel();
    getNews();

  }

  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child:  SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                /// Categories
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  height: 70,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: carousels.length,
                      itemBuilder: (context, index) {
                        return CarouselCard(
                          imageAssetUrl: carousels[index].imageAssetUrl,
                          carouselName: carousels[index].carouselName,
                        );
                      }),
                ),

                /// News Article
                Container(
                    margin: EdgeInsets.only(top: 16),
                    child: ListView.builder(
                    itemCount: dsNews.length,
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                    return NewsTile(
                      imgUrl: dsNews[index].urlToImage ?? "",
                      title: dsNews[index].title ?? "",
                      desc: dsNews[index].description ?? "",
                      content: dsNews[index].content ?? "",
                      posturl: dsNews[index].articleUrl ?? "",
                    );
                    }),



                ),
              ],
            ),
          ),
        ),
      ),
    );




  }
}


class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;

  NewsTile({this.imgUrl, this.desc, this.title, this.content, @required this.posturl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //--------------WebView khong chay duọc tren web-------------------------------------
//Unsupported operation: Trying to use the default webview implementation
  // for TargetPlatform.windows but there isn't a default one
        //-------------------------------------------------------

        // Navigator.push(context, MaterialPageRoute(
        //     builder: (context) => ContentURL(
        //       postUrl: posturl,
        //     )
        // )
        // );

        //---------------------------------------------------------------------
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => Content2(
                content:content,
            )
        )
        );
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(6),bottomLeft:  Radius.circular(6))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        imgUrl,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(height: 12,),
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    desc,
                    maxLines: 2,
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  )
                ],
              ),
            ),
          )),
    );
  }
}


class CarouselCard extends StatelessWidget {
  final String imageAssetUrl, carouselName;

  CarouselCard({this.imageAssetUrl, this.carouselName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Container(
        margin: EdgeInsets.only(right: 14),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network( imageAssetUrl,
                height: 60,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black26
              ),
              child: Text(
                carouselName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
class Content2 extends StatefulWidget {

final String content;
Content2({@required this.content});

@override
_Content2State createState() => _Content2State();
}

class _Content2State extends State<Content2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Flutter",
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            )
          ],
        ),
        actions: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.share,))
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Text(
              widget.content,
           style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500),
            ),
      ),
    );
  }
}





