import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/core/network/response.dart';
import '/core/util/colors.dart';

import '../../../commit_list/presentation/bloc/commit_list_bloc.dart';
import '../../../commit_list/presentation/widgets/info_card.dart';
import '../../../commit_list/data/models/commit_list_response.dart';

class CommitPage extends StatefulWidget {
  const CommitPage({Key? key}) : super(key: key);

  @override
  State<CommitPage> createState() => _CommitPageState();
}

class _CommitPageState extends State<CommitPage> {
  final String commitPageTitle = 'Flutter Commit List';
  final String commitBranchTitle = 'master';

  CommitListBloc? _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = CommitListBloc(10);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    debugPrint('width: ${width * 0.2}');

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => _bloc!.fetchCommitList(1),
        child: StreamBuilder<Response<CommitListResponse>>(
          stream: _bloc!.chunkListStream,
          builder: (context, data) {
            if (data.hasData) {
              switch (data.data!.status) {
                case Status.LOADING:
                  return SizedBox();
                case Status.COMPLETED:
                  return Container(
                    child: Column(
                      children: [
                        Text('${data.data!.data}'),
                      ],
                    ),
                  );
                case Status.ERROR:
                  return SizedBox();
              }
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class CommitBasicPage extends StatelessWidget {
  final String commitPageTitle = 'Flutter Commit List';
  final String commitBranchTitle = 'master';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    debugPrint('width: ${width * 0.2}');

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: height * 0.055,
                  width: double.infinity,
                  color: cardBackgroundColor,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      Text(
                        commitPageTitle,
                        style: TextStyle(
                          color: primaryTextColor,
                          fontSize: height * 0.021,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 1,
                        ),
                        // height: height * 0.03,
                        // width: width * 0.2,
                        child: Text(
                          commitBranchTitle,
                          style: TextStyle(
                            color: primaryTextColor,
                            fontSize: height * 0.021,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
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
                          imageUrl: 'https://www.android-examples.com/wp-content/uploads/2016/03/demo_image.jpg',
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
