import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String,String>> products =[
  {'productId':'1','productName':'Biscuit','productQuantity':'30'},
  {'productId':'2','productName':'Choclates','productQuantity':'34'},
  {'productId':'3','productName':'Candy','productQuantity':'35'},
  {'productId':'4','productName':'Bread','productQuantity':'20'},
  {'productId':'5','productName':'Milk','productQuantity':'45'},
  {'productId':'6','productName':'Juice','productQuantity':'60'},
  {'productId':'7','productName':'Soap','productQuantity':'37'},
  {'productId':'8','productName':'Shampoo','productQuantity':'29'}];
    List<Map<String,String>> sales =[
      {'productId':'1','saleQuantity':'10'},
      {'productId':'2','saleQuantity':'12'},
      {'productId':'3','saleQuantity':'20'},
      {'productId':'4','saleQuantity':'10'},
      {'productId':'5','saleQuantity':'15'},
      {'productId':'6','saleQuantity':'30'},
      {'productId':'7','saleQuantity':'22'},
      {'productId':'8','saleQuantity':'17'}];
    return Scaffold(
      body: Center(
        child:Column(
          children: [
           const  Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text('Home Page',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const Padding(
                       padding:  EdgeInsets.only(left: 20,right: 300),
                       child: Text('Products',
                        style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        ),),
                     ),
                    ElevatedButton(onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductScreen()),
                      );
                      },
                       child:const Text('Add'),
                    ),
                  ],
                ),
              Container(
                margin: const EdgeInsets.only(left: 30,right: 30),
                height: 400,
                width: 500,
                color: Color.fromRGBO(114, 157, 198,1),
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context,index){
                    return ListTile(
                      title: Text("""ProductId:${products[index]['productId']},
                      ProductName:${products[index]['productName']},
                      ProductQuantity:${products[index]['productQuantity']}"""),
                    );
                  }),
              ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const Padding(
                      padding:  EdgeInsets.only(left: 20,right: 300),
                      child: Text('Sales',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),),
                    ),
                    ElevatedButton(onPressed: (){
                    Navigator.push(
                            context,
                    MaterialPageRoute(builder: (context) =>const SalesScreen()),
                    );
                                }, child: const Text('Add'),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30,right: 30),
                  height: 400,
                  width: 500,
                  color: Color.fromRGBO(233, 228, 255,1,),
                  child: ListView.builder(
                    itemCount:sales.length ,
                    itemBuilder: (context,index){
                      return ListTile(
                      title: Text("""SaleId:${sales[index]['productId']},
                      SaleQuantity:${sales[index]['saleQuantity']}"""),
                    );
                    },
                      ),
                    ),
              ],
            ),
          ],
        ),)
          ],
        ),

      ),
    );
  }
}
class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String productName ='';
    String productId ='';
    String productQuantity ='';
    return Scaffold(
      backgroundColor:const Color.fromRGBO(114, 157, 198,1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const  Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text('Product Screen Page',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),),
                  ),
                ),
              ],
            ),
           Center(
             child: Container(
              height: 450,
              width: 300,
              color: const Color.fromRGBO(255, 255, 255,1),
               child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   TextFormField(
                     onChanged:(value){
                       productName = value;
                     },
                     decoration:const  InputDecoration(
                       labelText: 'Enter Product Name',
                       focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10),
                        ),
                      )
                     ),
                   ),
                   TextFormField(
                     onChanged:(value){
                       productId = value;
                     },
                     decoration:const  InputDecoration(
                       labelText: 'Enter Product Id',
                       focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10),
                        ),
                      )
                     ),
                     ),
                   TextFormField(
                     onChanged:(value){
                       productQuantity = value;
                     },
                     decoration:const  InputDecoration(
                       labelText: 'Enter Product Quantity',
                       focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10),
                        ),
                      )
                     ),
                   ),
                   ElevatedButton(
                     onPressed: (){
                       print(productName);
                       print(productId);
                       print(productQuantity);
                   }, child:const Text('Submit'),
                   ),
                 ],
               ),
             ),
           ),
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child:const Text('Close'),
          ),
        ],
      ),
    );
  }
}
class SalesScreen extends StatelessWidget {
  const SalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String productId ='';
    String salesQuantity ='';
    return Scaffold(
      backgroundColor:const Color.fromRGBO(233, 228, 255,1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const  Row(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(15),
                    child: Text('Sales Screen Page',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),),
                  ),
                ),
              ],
            ),
          Center(
            child: Container(
              height: 450,
              width: 300,
              color: const Color.fromRGBO(255, 255, 255,1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
                    onChanged:(value){
                      productId = value;
                    },
                    decoration:const  InputDecoration(
                      hintText: 'Enter Product Id',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10),
                        ),
                      )
                    ),
                    ),
                  TextFormField(
                    onChanged:(value){
                      salesQuantity = value;
                    },
                    decoration:const  InputDecoration(
                      hintText: 'Enter Sales Quantity',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10),
                        ),
                      )
                    ),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      print(productId);
                      print(salesQuantity);
                  }, child:const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                  }, child:const Text('Close'),
                  ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}