// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CoffeTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String des;
  final double price;

  const CoffeTile({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.des,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, bottom: 25),
      child: Container(
         padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
        width: 200,
        decoration: BoxDecoration(
            color: Colors.black54, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //image
            Container(
             
              height: 150,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            
            const SizedBox(height: 15,),

            //Info
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 20
                ),),

                Text(des, style: TextStyle(color: Colors.grey.shade700 ),),
              ],
            ),

            const SizedBox(height: 15,),

            //price and add to cart
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$ '+price.toString(), style: TextStyle(fontSize: 15),),

                //button
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle
                  ),
                  child: Icon(Icons.add, color: Colors.white),
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
