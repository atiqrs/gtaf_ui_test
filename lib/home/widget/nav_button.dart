import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/util/colors.dart';

class CustomeBottomNavButton extends StatefulWidget {
  final int currentIndex;
  final int ownIndex;
  final String title;
  final String iconInfo;
  final VoidCallback onTap;

  const CustomeBottomNavButton({
    Key? key,
    required this.ownIndex,
    required this.currentIndex,
    required this.title,
    required this.iconInfo,
    required this.onTap,
  }) : super(key: key);

  @override
  State<CustomeBottomNavButton> createState() => _CustomeBottomNavButtonState();
}

class _CustomeBottomNavButtonState extends State<CustomeBottomNavButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    return Expanded(
      child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: widget.onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                widget.iconInfo,
                height: (height * .08) * .4,
                width: (height * .08) * .4,
                color: widget.currentIndex == widget.ownIndex
                    ? iconSelectedColor
                    : iconUnselectedColor,
              ),
              Text(
                widget.title,
                style: TextStyle(
                    color: widget.currentIndex == widget.ownIndex
                        ? iconSelectedColor
                        : iconUnselectedColor,
                    fontSize: 12),
              ),
            ],
          )),
    );
  }
}
