import 'package:flutter/material.dart';
class Product{
    String productName;
    String productId ;
    String stock;
    String price;

    Product(this.productName,this.productId,this.stock,this.price);
    int get stockAsInt => int.parse(stock);
    double get priceAsDouble => double.parse(price);
}
class ProductScreen extends StatefulWidget {
  final Product product;
  const ProductScreen({super.key,required this.product});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
late Product product =widget.product;
  @override
  Widget build(BuildContext context) {
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
                    initialValue: product.productId,
                     onChanged:(value){
                       product.productId = value;
                     },
                     decoration:const  InputDecoration(
                       labelText: 'Enter Product Id',
                       focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15),
                        ),
                      )
                     ),
                     ),
                     TextFormField(
                    initialValue:product.productName ,
                     onChanged:(value){
                       product.productName = value;
                     },
                     decoration:const  InputDecoration(
                       labelText: 'Enter Product Name',
                       focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15),
                        ),
                      )
                     ),
                   ),
                   TextFormField(
                    initialValue: product.stock,
                     onChanged:(value){
                       product.stock = value;
                     },
                     decoration:const  InputDecoration(
                       labelText: 'Enter Product Stock',
                       focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15),
                        ),
                      )
                     ),
                   ),
                   TextFormField(
                    initialValue: product.price,
                     onChanged:(value){
                       product.price = value;
                     },
                     decoration:const  InputDecoration(
                       labelText: 'Enter Product Price',
                       focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15),
                        ),
                      )
                     ),
                   ),
                   ElevatedButton(
                     onPressed:(){
                      Navigator.pop(context,product); 
                     },
                      child:const Text('Submit'),
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
