import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_application/post/post_details.dart';
import 'package:news_application/post/single_post_row.dart';

class Post_List extends StatefulWidget {
  final String category_name;

  const Post_List({Key key, this.category_name}) : super(key: key);

  @override
  _Post_ListState createState() => _Post_ListState();
}

class _Post_ListState extends State<Post_List> {
  List post_data = List();
  Future<String> loadPostData() async {
    var news_jsonText =
        await rootBundle.loadString('assets/json_data/news.json');
    setState(() {
      post_data = jsonDecode(news_jsonText);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this.loadPostData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          widget.category_name,
          style: GoogleFonts.podkova(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: post_data.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              print(index);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => Post_Details(
                    title: post_data[index]['title'],
                    category: post_data[index]['category'],
                    created_at: post_data[index]['created_at'],
                    thumbnail_image: post_data[index]['thumbnail_image'],
                    body: post_data[index]['body'],
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Post_Single_List(
                title: post_data[index]['title'],
                category: post_data[index]['category'],
                created_At: post_data[index]['created_at'],
                thumbnail_image: post_data[index]['thumbnail_image'],
              ),
            ),
          );
        },
      ),
    );
  }
}
