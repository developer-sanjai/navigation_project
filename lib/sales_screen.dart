import 'package:flutter/material.dart';
class Sales{
  String productId ;
  String saleQuantity ;
  Sales(this.productId,this.saleQuantity); 
}
class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<SalesScreen> createState() => _SalesScreenState();
} 
class _SalesScreenState extends State<SalesScreen> {
  Sales sales =Sales('','');
  resultSales(){
    Navigator.pop(context,sales);
  }
  @override
  Widget build(BuildContext context) {
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
                      sales.productId = value;
                    },
                    decoration:const  InputDecoration(
                      hintText: 'Enter Product Id',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15),
                        ),
                      )
                    ),
                    ),
                  TextFormField(
                    onChanged:(value){
                      sales.saleQuantity = value;
                    },
                    decoration:const  InputDecoration(
                      hintText: 'Enter Sales Quantity',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15),
                        ),
                      )
                    ),
                  ),
                  ElevatedButton(
                    onPressed: resultSales,
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
