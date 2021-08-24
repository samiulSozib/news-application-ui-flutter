import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_application/home/Drawer_Menu_View.dart';
import 'package:news_application/home/all_category.dart';

import 'package:news_application/home/single_category_item.dart';
import 'package:news_application/post/post_details.dart';
import 'package:news_application/post/post_list.dart';
import 'package:news_application/post/single_post_row.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key key}) : super(key: key);

  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  List data = List();
  List post_data = List();
  Future<String> loadCategoryData() async {
    var jsonText =
        await rootBundle.loadString('assets/json_data/category.json');
    setState(() {
      data = jsonDecode(jsonText);
    });
  }

  Future<String> loadPostData() async {
    var post_jsonText =
        await rootBundle.loadString('assets/json_data/news.json');
    setState(() {
      post_data = jsonDecode(post_jsonText);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.loadCategoryData();
    this.loadPostData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "News Application",
          style: GoogleFonts.podkova(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        child: DrawerMenuView(),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "Category",
                      style: GoogleFonts.podkova(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => All_Category(),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "View All",
                            style: GoogleFonts.podkova(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 200,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: ListView.builder(
                      itemCount: data.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(
                    "Popular News",
                    style: GoogleFonts.podkova(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: post_data.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => Post_Details(
                              title: post_data[index]['title'],
                              category: post_data[index]['category'],
                              created_at: post_data[index]['created_at'],
                              thumbnail_image: post_data[index]
                                  ['thumbnail_image'],
                              body: post_data[index]['body'],
                            ),
                          ),
                        );
                      },
                      child: Post_Single_List(
                        title: post_data[index]['title'],
                        category: post_data[index]['category'],
                        created_At: post_data[index]['created_at'],
                        thumbnail_image: post_data[index]['thumbnail_image'],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
