import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Single_Category_Item extends StatefulWidget {
  final String name;
  final String image;

  const Single_Category_Item({Key key, this.name, this.image})
      : super(key: key);

  @override
  _Single_Category_ItemState createState() => _Single_Category_ItemState();
}

class _Single_Category_ItemState extends State<Single_Category_Item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      height: 200,
      width: 300,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: NetworkImage(widget.image), fit: BoxFit.cover),
              ),
            ),
            Positioned(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.name,
                      style: GoogleFonts.podkova(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
