import 'package:flutter/material.dart';
import 'package:navigationpage_project/product_screen.dart';
import 'package:navigationpage_project/sales_screen.dart';
void main(){
  runApp(const MyApp());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Product> products =[];

    List<Sales> sales =[];

      showProductPage()async {
        final output =await Navigator.push(context,
         MaterialPageRoute(builder: 
         (context) => const ProductScreen(),
         ));
         if(output != null){
          setState(() {
            products.add(output);
          });
         }
      }
      showSalesPage()async {
        final output =await Navigator.push(context,
         MaterialPageRoute(builder: 
         (context) => const SalesScreen(),
         ));
         if(output != null){
          setState(() {
            sales.add(output);
          });
         }
      }

  @override
  Widget build(BuildContext context) {
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
                    ElevatedButton(onPressed: showProductPage,
                       child:const Text('Add'),
                    ),
                  ],
                ),
              Container(
                margin: const EdgeInsets.only(left: 30,right: 30),
                height: 400,
                width: 500,
                color:const Color.fromRGBO(114, 157, 198,1),
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context,index){
                    final product =products[index];
                    return ListTile(
                      title: Text("""ProductId:${product.productId},
                      ProductName:${product.productName},
                      ProductQuantity:${product.productQuantity}"""),
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
                    ElevatedButton(onPressed:showSalesPage,
                     child: const Text('Add'),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30,right: 30),
                  height: 400,
                  width: 500,
                  color:const Color.fromRGBO(233, 228, 255,1,),
                  child: ListView.builder(
                    itemCount:sales.length ,
                    itemBuilder: (context,index){
                      final sale =sales[index];
                      return ListTile(
                      title: Text("""ProductId:${sale.productId},
                      SalesQuantity:${sale.saleQuantity}"""),
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