import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gtaf_ui_test/core/network/response.dart';
import 'package:gtaf_ui_test/features/user_profile/data/models/user_profile_response.dart';
import 'package:gtaf_ui_test/features/user_profile/presentation/bloc/user_profile_bloc.dart';
import '/core/util/colors.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late UserProfileBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = UserProfileBloc();
  }

  onReload() {
    _bloc.fetchUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    debugPrint('width: ${width * 0.2}');

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => _bloc.fetchUserProfile(),
        child: StreamBuilder<Response<UserProfileResponse>>(
          stream: _bloc.chunkListStream,
          builder: (context, data) {
            if (data.hasData) {
              switch (data.data!.status) {
                case Status.LOADING:
                  return UserProfileBasicPage(onTap: onReload);
                // return InkWell(
                //   onTap: () => _bloc.fetchUserProfile(),
                //   child: Container(
                //     height: 50,
                //     width: 50,
                //     child: const Icon(
                //       Icons.refresh,
                //       color: Colors.white,
                //     ),
                //   ),
                // );

                case Status.COMPLETED:
                  debugPrint('data.data.data: ${data.data!.data}');
                  if (data.data!.data != null) {
                    return UserProfilePageView(
                      userProfileResponse: data.data!.data,
                    );
                  } else {
                    return Container();
                  }
                case Status.ERROR:
                  return UserProfileBasicPage(
                    onTap: onReload,
                  );
                // return InkWell(
                //   onTap: () => UserProfileBloc().fetchUserProfile(),
                //   child: Container(
                //     height: 50,
                //     width: 50,
                //     child:
                //   ),
                // );
              }
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class UserProfilePageView extends StatelessWidget {
  final UserProfileResponse? userProfileResponse;

  const UserProfilePageView({Key? key, required this.userProfileResponse})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        color: cardBackgroundColor,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  imageUrl: userProfileResponse!.avatarUrl,
                  fit: BoxFit.fill,
                  height: 168,
                  width: 168,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: cardDeviderColor,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                userProfileResponse!.login,
                style: TextStyle(color: primaryTextColor, fontSize: 24),
              ),
              const SizedBox(height: 4),
              Text(
                '@name',
                style: TextStyle(color: primaryTextColor, fontSize: 14),
              ),
              // cluster
              const SizedBox(height: 16),
              Text(
                'Bio: ',
                style: TextStyle(color: primaryTextColor, fontSize: 17),
              ),
              const SizedBox(height: 16),
              // cluster
              Text(
                'Public Repos: ',
                style: TextStyle(color: primaryTextColor, fontSize: 17),
              ),
              const SizedBox(height: 8),
              Text(
                'Public Gists: ',
                style: TextStyle(color: primaryTextColor, fontSize: 17),
              ),
              const SizedBox(height: 8),
              Text(
                'Private Repos: ',
                style: TextStyle(color: primaryTextColor, fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserProfileBasicPage extends StatelessWidget {
  final String userProfilePageTitle = 'User Profile';
  final String userImageUrl = '';
  final VoidCallback onTap;

  const UserProfileBasicPage({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: cardBackgroundColor,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            (userImageUrl.isNotEmpty)
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CachedNetworkImage(
                      imageUrl: userImageUrl,
                      fit: BoxFit.fill,
                      height: 168,
                      width: 168,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: cardDeviderColor,
                      ),
                    ),
                  )
                : const Icon(
                    Icons.error,
                    color: cardDeviderColor,
                    size: 168,
                  ),
            // SizedBox(
            //     height: 168,
            //     width: 168,
            //     child: Icon(
            //       icon: Icons.error,
            //       color: cardDeviderColor,
            //     ),
            //   ),

            const SizedBox(height: 16),
            const Text(
              '------- ----',
              style: TextStyle(color: primaryTextColor, fontSize: 24),
            ),
            const SizedBox(height: 4),
            Text(
              '@name',
              style: TextStyle(color: primaryTextColor, fontSize: 14),
            ),
            // cluster
            const SizedBox(height: 16),
            Text(
              'Bio: ',
              style: TextStyle(color: primaryTextColor, fontSize: 17),
            ),
            const SizedBox(height: 16),
            // cluster
            Text(
              'Public Repos: ',
              style: TextStyle(color: primaryTextColor, fontSize: 17),
            ),
            const SizedBox(height: 8),
            Text(
              'Public Gists: ',
              style: TextStyle(color: primaryTextColor, fontSize: 17),
            ),
            const SizedBox(height: 8),
            Text(
              'Private Repos: ',
              style: TextStyle(color: primaryTextColor, fontSize: 17),
            ),
            IconButton(
              onPressed: onTap,
              icon: const Icon(
                Icons.refresh,
                color: Colors.white70,
                size: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
