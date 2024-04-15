// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffe_shop/components/category_title.dart';
import 'package:coffe_shop/components/coffe_tile.dart';
import 'package:coffe_shop/utils/CoffeCategory/category_coffe.dart';
import 'package:coffe_shop/utils/CoffeList/coffe_class_info.dart';
import 'package:coffe_shop/utils/CoffeList/coffe_list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late List<String> category;
  late List<CoffeInfo> allCoffes = allCoffe;
  late int chooseType = 0 ;

  @override
  void initState() {
    // TODO: implement initState
    category = categoryCoffe;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          leading: Icon(Icons.menu, color: Colors.white, size: 30,),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right :20.0),
              child: Icon(Icons.person, size: 30, color: Colors.white,),
            ),
          ],
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
          bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), 
            label: ''
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: ''
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '' 
            ),
        ]) ,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
          
                //Find the best coffe for you
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('Find the best coffe for you', style: GoogleFonts.bebasNeue( 
                    fontSize: 60,
                    color: Colors.white
                  ),),
                ),
          
          
                //Searching bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),                
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey.shade700)),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(width: 1, color: Colors.grey.shade700)),
                    ),
                  ),
                ),
                
                const SizedBox(height: 18,),
          
                //CATEGORY coffe
                Container(
                  // width: double.infinity,
                  constraints: BoxConstraints(maxHeight: 50),
          
                  child: Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: category.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              chooseType = index;
                            });
                          },
                          child: CategoryTile(titleCoffe: category[index], isChoose: index == chooseType ? true: false, ));
                      },),
                  ),
                ),
                
                //Coffe list
                Container(
                  height:350,
                  child: Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: allCoffes.length ,
                      itemBuilder: (context, index) {
                        return CoffeTile(des: allCoffes[index].des!, price: allCoffes[index].Price, title: allCoffes[index].title, imagePath: allCoffes[index].imagePath, );
                      },
                      ),
                  ),
                )
          
          
              ],
            ),
          ),
        ),
      ),
    );
  }
}