import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pantra_project/pages/student_search_result.dart';
import 'package:pantra_project/pages/subpages/account_detail.dart';
import 'package:pantra_project/pages/subpages/event.dart';
import 'package:pantra_project/pages/subpages/student.dart';
import 'package:pantra_project/utils/color.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> pageList = <Widget>[
    const EventPage(),
    const StudentPage(),
    const StudentSearchResult(),
    const AccountDetail()
  ];
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    //get authenticated user
    final user = FirebaseAuth.instance;
    print(user.currentUser!.email);
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: white,
        color: secondary,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        items: const [
          Icon(
            Icons.celebration_rounded,
            color: primary,
          ),
          Icon(
            Icons.people_alt,
            color: primary,
          ),
          Icon(
            Icons.person,
            color: primary,
          ),
          Icon(
            Icons.delete,
            color: primary,
          ),
        ],
      ),
      backgroundColor: white,
      body: pageList[pageIndex],
    );
  }
}
