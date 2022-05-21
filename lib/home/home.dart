import 'package:flutter/material.dart';

import '../core/util/colors.dart';
import '../core/util/constants.dart';

import 'widget/nav_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String userProfileButtonText = 'User Profile';
  String commitsButtonText = 'Commits';
  static const _commitIndex = 0;
  static const _userIndex = 1;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: const [
          // CommitPage(),
          // UserProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: navBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: SizedBox(
            height: height * .08,
            width: double.infinity,
            child: Row(
              children: <Widget>[
                const Spacer(),
                // commit
                CustomeBottomNavButton(
                  ownIndex: _commitIndex,
                  currentIndex: _currentIndex,
                  title: commitsButtonText,
                  iconInfo: iCommit,
                  onTap: () {
                    setState(() {
                      _currentIndex = _commitIndex;
                      debugPrint('$_currentIndex');
                    });
                  },
                ),
                SizedBox(width: width * .18),
                // User Profile
                CustomeBottomNavButton(
                  ownIndex: _userIndex,
                  currentIndex: _currentIndex,
                  title: userProfileButtonText,
                  iconInfo: iUser,
                  onTap: () {
                    setState(() {
                      _currentIndex = _userIndex;
                      debugPrint('$_currentIndex');
                    });
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
