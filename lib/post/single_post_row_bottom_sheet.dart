import 'package:flutter/material.dart';

class Post_Single_List_Bottom_Sheet extends StatefulWidget {
  final String title;
  final String image;

  const Post_Single_List_Bottom_Sheet({Key key, this.title, this.image})
      : super(key: key);

  @override
  _Post_Single_List_Bottom_SheetState createState() =>
      _Post_Single_List_Bottom_SheetState();
}

class _Post_Single_List_Bottom_SheetState
    extends State<Post_Single_List_Bottom_Sheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 2),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(20),
          width: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(widget.image),
            ),
          ),
          child: Center(
            child: Text(
              widget.title,
              maxLines: 4,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
