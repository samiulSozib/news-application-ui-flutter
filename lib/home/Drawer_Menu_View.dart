import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class DrawerMenuView extends StatefulWidget {
  const DrawerMenuView({Key key}) : super(key: key);

  @override
  _DrawerMenuViewState createState() => _DrawerMenuViewState();
}

class _DrawerMenuViewState extends State<DrawerMenuView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          DrawerHeader(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 50,
                  child: CircleAvatar(
                    radius: 45,
                    backgroundColor: Colors.white,
                    child: Text(
                      "News",
                      style: GoogleFonts.podkova(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            BoxShadow(
                              blurRadius: 5,
                              color: Colors.green.shade900,
                              offset: Offset(3, 3),
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          listTile(icon: Icons.home_outlined, title: "Home"),
          listTile(
            icon: Icons.star,
            title: "Rating & Review",
          ),
          listTile(icon: Icons.favorite_outline, title: "Bookmarks"),
          Divider(
            thickness: 2,
          ),
          Container(
            height: 350,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Contuct Us",
                  style: GoogleFonts.podkova(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      "Email Us:",
                      style: GoogleFonts.podkova(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "encodescriptsoft@gmail.com",
                      style: GoogleFonts.podkova(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget listTile({IconData icon, String title, Function ontap}) {
    return ListTile(
      onTap: ontap,
      leading: Icon(
        icon,
        color: Colors.black,
        size: 24,
      ),
      title: Text(
        title,
        style: GoogleFonts.podkova(
          fontSize: 18,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
