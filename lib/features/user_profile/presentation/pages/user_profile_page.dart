import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '/core/util/colors.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  final String userProfilePageTitle = 'User Profile';
  final String userImageUrl =
      'https://avatars.githubusercontent.com/u/24214786?v=4';
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
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                imageUrl: userImageUrl,
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
              'NameNaame Name',
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
    );
  }
}
