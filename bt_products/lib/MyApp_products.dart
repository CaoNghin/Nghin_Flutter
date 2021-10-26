
import 'package:bt_products/Products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListViewProducts(),
    );
  }
}
class ListViewProducts extends StatefulWidget {
  const ListViewProducts({Key? key}) : super(key: key);

  @override
  _ListViewProductsState createState() => _ListViewProductsState();
}

class _ListViewProductsState extends State<ListViewProducts> {
  late Future<List<Product>> lsProduct;
  @override
  void initState(){
    super.initState();
    lsProduct = Product.fetchData();
  }

  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("ListView Products"),
      ),
      body: FutureBuilder(
        future: lsProduct,
        builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
          if(snapshot.hasData){
            var data = snapshot.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (BuildContext context, int index) {
                Product p = data[index];
                var fkey = GlobalKey<FormState>();
                var txtinput= TextEditingController();
                return ListTile(
                  leading: Image.network(p.image),
                  title: Text(p.title),
                  subtitle: Text(p.description),

                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      IconButton(
                        onPressed: ( ) {
                            var alert = Dialog(key: fkey,
                              child: Column(
                                children: [
                                SizedBox(height: 50,),
                              Text("Mua hàng",
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepOrange),
                              ),TextFormField(
                                    controller: txtinput,
                              validator: (value){
                                if (value==null || value.isEmpty)
                                  return "sl cannot empty";
                                else
                                  if (value.runtimeType==int || value.hashCode <=0)
                                    return "sl is number >0";
                                  else
                                    return  null;
                              },
                              decoration: InputDecoration(

                                  hintText: "Vui lòng nhập số lượng",
                                  labelText: "Chọn số lượng mua hàng"


                              ),


                            ),
                                  SizedBox(height: 15,),
                                  ElevatedButton(
                                      onPressed: (){
                                        if (fkey.currentState!.validate())
                                        {
                                          print("oke");
                                          var input= txtinput.text;

                                          var alert = AlertDialog(
                                            content: Text("${input} alert! "),

                                          );
                                          showDialog(context: context, builder: (context){
                                            return alert;
                                          });
                                        }
                                        else
                                          print("not oke");
                                      },
                                      child: Text("Mua")),
                                ],
                              ),


                          );
                          showDialog(context: context, builder: (context){
                            return alert;
                          });
                        },
                        icon: Icon(Icons.shopping_cart),

                      ),
                    ],
                  ),
                );

              },
            );
          }
          else{
            return CircularProgressIndicator();
          }
        },

      ),



    );
  }
}











