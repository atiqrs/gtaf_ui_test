import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '/core/util/colors.dart';

class InfoCard extends StatelessWidget {
  final String commitMessage;
  final String commitTime;
  final String imageUrl;
  final String userName;

  const InfoCard({Key? key, required this.commitMessage, required this.commitTime, required this.imageUrl, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    return Container(
      // ConstrainedBox(
      // constraints: BoxConstraints(
      //   minHeight: height * 0.09,
      //   maxHeight: height * 0.12,
      // ),
      height: height * 0.09,
      width: double.infinity,
      color: cardBackgroundColor,
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        commitMessage,
                        maxLines: 2,
                        style: TextStyle(
                          color: primaryTextColor,
                          fontSize: height * 0.021,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        commitTime,
                        style: TextStyle(
                          color: secondaryTextColor,
                          fontSize: height * 0.015,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl: imageUrl,
                          fit: BoxFit.fill,
                          height: 20,
                          width: 20,
                          progressIndicatorBuilder: (context, url, downloadProgress) => const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error,
                            color: cardDeviderColor,
                          ),
                        ),
                      ),
                      // CachedNetworkImage(
                      //   imageUrl:
                      //       'https://www.android-examples.com/wp-content/uploads/2016/03/demo_image.jpg',
                      //   fit: BoxFit.fill,
                      //   height: double.infinity,
                      //   width: double.infinity,
                      //   placeholder: (context, url) =>
                      //       // Indicator(),
                      //       CircleAvatar(
                      //     backgroundImage: AssetImage(FlutterLogo(
                      //       size: 10,
                      //     )),
                      //     child: Center(child: CircularProgressIndicator()),
                      //   ),
                      //   errorWidget: (context, url, error) => CircleAvatar(
                      //     backgroundImage: AssetImage(
                      //       iNoUserImage,
                      //     ),
                      //   ),
                      // ),

                      SizedBox(width: 08),
                      Text(
                        userName,
                        style: TextStyle(
                          color: secondaryTextColor,
                          fontSize: height * 0.015,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            color: cardDeviderColor,
            child: const SizedBox(
              height: 1,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
