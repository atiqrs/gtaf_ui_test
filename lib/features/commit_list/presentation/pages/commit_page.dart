import 'package:flutter/material.dart';
import '../../../commit_list/presentation/widgets/info_card.dart';

class CommitPage extends StatefulWidget {
  const CommitPage({Key? key}) : super(key: key);

  @override
  State<CommitPage> createState() => _CommitPageState();
}

class _CommitPageState extends State<CommitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Commit Page',
                ),
                // const SizedBox(height: 75),
                Container(
                  color: Colors.blueAccent,
                  child: ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      ...List.generate(
                        20, // Replace this with 1, 2 to see min height works.
                        (index) => const InfoCard(
                          commitMessage: 'Fix All bugs',
                          commitTime: '18:04',
                          imageUrl:
                              'https://www.android-examples.com/wp-content/uploads/2016/03/demo_image.jpg',
                          userName: 'Francisco Miles',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
