import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_application/home/single_category_item.dart';
import 'package:news_application/post/single_post_row.dart';
import 'package:news_application/post/single_post_row_bottom_sheet.dart';
import 'package:simple_moment/simple_moment.dart';

class Post_Details extends StatefulWidget {
  final String title;
  final String thumbnail_image;
  final String category;
  final String created_at;
  final String body;

  const Post_Details(
      {Key key,
      this.title,
      this.thumbnail_image,
      this.category,
      this.created_at,
      this.body})
      : super(key: key);

  @override
  _Post_DetailsState createState() => _Post_DetailsState();
}

class _Post_DetailsState extends State<Post_Details> {
  List post_data = List();
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
    this.loadPostData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                flex: 15,
                child: Container(
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 220,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 15,
                                  top: 5,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.arrow_back,
                                      size: 32,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(widget.thumbnail_image),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Text(
                              widget.title,
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8),
                                      child: Row(
                                        children: [
                                          Icon(Icons.calendar_today),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            widget.created_at,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Expanded(
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Icon(Icons.category),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          widget.category,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Card(
                                    elevation: 5,
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.arrow_circle_up,
                                              size: 28,
                                              color: Colors.green,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "201",
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Card(
                                    elevation: 5,
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.arrow_circle_down,
                                              size: 28,
                                              color: Colors.red,
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "201",
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Card(
                                    elevation: 5,
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.favorite_outline,
                                              size: 28,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: HtmlWidget(
                              widget.body, textStyle: TextStyle(fontSize: 22),

                              // turn on `webView` if you need IFRAME support
                              webView: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                    width: double.infinity,
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Related News",
                            style: GoogleFonts.podkova(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      padding: EdgeInsets.only(top: 10),
                                      height: 150,
                                      child: SingleChildScrollView(
                                        physics: BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        child: ListView.builder(
                                          itemCount: post_data.length,
                                          shrinkWrap: true,
                                          physics: ClampingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (_) =>
                                                        Post_Details(
                                                      title: post_data[index]
                                                          ['title'],
                                                      category: post_data[index]
                                                          ['category'],
                                                      created_at:
                                                          post_data[index]
                                                              ['created_at'],
                                                      thumbnail_image: post_data[
                                                              index]
                                                          ['thumbnail_image'],
                                                      body: post_data[index]
                                                          ['body'],
                                                    ),
                                                  ),
                                                );
                                              },
                                              child:
                                                  Post_Single_List_Bottom_Sheet(
                                                title: post_data[index]
                                                    ['title'],
                                                image: post_data[index]
                                                    ['thumbnail_image'],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Icon(
                              Icons.arrow_upward,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
