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
  List<Reports> reports =[];

      showProductPage(Product product)async {
        final output =await Navigator.push(context,
         MaterialPageRoute(builder: 
         (context) => ProductScreen(product: product)
         ));
         if(output != null){
          setState(() {
            int index = products.indexWhere((value) => value.productId == product.productId);
            if(index != -1){
              products[index] = output;
            }
            else{
              products.add(output);
            }
          });
         }
      }
      showSalesPage(Sales sale)async {
        final output =await Navigator.push(context,
         MaterialPageRoute(builder: 
         (context) =>  SalesScreen(sale: sale),
         ));
         if(output != null){
          setState(() {
            int index = sales.indexWhere((value) => value.productId == sale.productId);
            if(index != -1){
              sales[index] = output;
              updateReports();
            }
            else{
              sales.add(output);
            }
            updateReports();
          });
         }
      }
    void updateReports()async {
    reports.clear();
    for (var sale in sales) {
      Product product = products.firstWhere((product) => product.productId == sale.productId);
      double totalAmount = sale.saleQuantityAsInt * product.priceAsDouble;
      Reports report = Reports(product, sale, totalAmount);
      reports.add(report);
    }
    reports.sort((a, b) => b.totalAmount.compareTo(a.sale.saleQuantityAsInt));
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
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
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
                        ElevatedButton(onPressed: ()async{
                          showProductPage(Product('','','',''));
                        },
                           child:const Text('Add'),
                        ),
                      ],
                    ),
                    Container(  
                margin: const EdgeInsets.only(left: 30,right: 30),
                height: 200,
                width: 500,
                color:const Color.fromRGBO(114, 157, 198,1),
                child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context,index){
                    final product =products[index];
                    return ListTile(
                      title: Text("ProductId:${product.productId}"),
                      subtitle:Text("ProductName:${product.productName},Stock:${product.stock},Price${product.price}"),
                      trailing: const Icon(Icons.edit),
                      onTap:  ()async{
                        showProductPage(product);
                      },
                      );
                  }),
                  ),
                  ],
                ),
                Column(
              children: [
                Column(
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
                        ElevatedButton(onPressed:()async{
                          showSalesPage(Sales('',''));
                        },
                         child: const Text('Add'),
                        ),
                      ],
                    ),
                    Container(
                  margin: const EdgeInsets.only(left: 30,right: 30),
                  height: 200,
                  width: 500,
                  color:const Color.fromRGBO(233, 228, 255,1,),
                  child: ListView.builder(
                    itemCount:sales.length ,
                    itemBuilder: (context,index){
                      final sale =sales[index];
                      return ListTile(
                      title: Text("ProductId:${sale.productId}"),
                      subtitle: Text("SalesQuantity:${sale.saleQuantity}"),
                      trailing: const Icon(Icons.edit),
                      onTap: ()async{
                        showSalesPage(sale);
                      },
                    );
                    },
                      ),
                    ),
                  ],
                ),
              ],
              
            ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Row(
                      children: [
                        Text('Top Sale',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 230,bottom:80),
                  height: 300,
                  width: 460,
                  color: Colors.blue,
                  child: ListView.builder(
                          itemCount: reports.length,
                          itemBuilder: (context, index) {
                            final report = reports[index];
                            return ListTile(
                              title: Text("ProductId:${report.product.productId}"),
                              subtitle: Text(
                                  "ProductName:${report.product.productName},SaleQuantity:${report.sale.saleQuantity}, Total Sales: \$${report.totalAmount}"),
                              trailing: const Icon(Icons.edit),
                            );
                          },
                        ),
                ),
                  ],
                ),
                Column(),
              ],
            )
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
class Reports{
  Product product;
  Sales sale;
  double totalAmount; 

  Reports(this.product, this.sale,this.totalAmount); 
}