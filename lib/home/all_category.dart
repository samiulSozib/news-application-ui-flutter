import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:news_application/home/single_category_item.dart';
import 'package:news_application/post/post_list.dart';

class All_Category extends StatefulWidget {
  @override
  _All_CategoryState createState() => _All_CategoryState();
}

class _All_CategoryState extends State<All_Category> {
  List data = List();
  Future<String> loadCategoryData() async {
    var jsonText =
        await rootBundle.loadString('assets/json_data/category.json');
    setState(() {
      data = jsonDecode(jsonText);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.loadCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Browse By Category",
          style: GoogleFonts.podkova(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Post_List(
                            category_name: data[index]['category_name'],
                          ),
                        ),
                      );
                    },
                    child: Single_Category_Item(
                      name: data[index]['category_name'],
                      image: data[index]['category_image'],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
