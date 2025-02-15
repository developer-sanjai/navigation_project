import 'package:flutter/material.dart';
class Product{
    String productName;
    String productId ;
    String productQuantity;

    Product(this.productName,this.productId,this.productQuantity);
}
class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  Product product =Product('','','');
  resultProduct(){
    Navigator.pop(context,product); 
  }
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
                     onChanged:(value){
                       product.productQuantity = value;
                     },
                     decoration:const  InputDecoration(
                       labelText: 'Enter Product Quantity',
                       focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15),
                        ),
                      )
                     ),
                   ),
                   ElevatedButton(
                     onPressed:resultProduct,
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
