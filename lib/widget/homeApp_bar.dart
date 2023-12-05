import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return AppBar(
      leading: const Padding(
        padding: EdgeInsets.all(6.0),
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/images/profile.jpeg"),
        ),
      ),
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Good Morning",
            style: TextStyle(fontSize: 12.0),
          ),
          Text(
            "Sushma Shukla",
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(width: width * 0.04),
                Image.asset(
                  "assets/images/notification-bell.png",
                  width: width * 0.09,
                  height: height * 0.03,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                InkWell(
                  onTap: (){},
                  child: Image.asset(
                    "assets/images/bookmark.png",
                    height: height * 0.03,
                    width: width * 0.09,
                    color: Colors.black,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
