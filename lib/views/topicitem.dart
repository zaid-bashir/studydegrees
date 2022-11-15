import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studydegrees/constants/colors.dart';
import 'package:studydegrees/constants/styles.dart';

Widget topicItem(String title, String image, void Function() onTap, bool flag) {
  return Column(
    children: [
      InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                border: flag == true
                    ? Border.all(color: primaryColor, width: 2)
                    : Border.all(color: Colors.transparent, width: 0),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0XFFFFFFFF),
                    blurRadius: 2.0,
                    spreadRadius: 2,
                    offset: Offset(
                      0,
                      0,
                    ),
                  ),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Center(
                  child: SvgPicture.asset(
                    image,
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
            ),
            flag == true
                ? Positioned(
                    right: 0,
                    child: Center(
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: primaryColor),
                        child: const Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Text(
        title,
        style: AppStyles().headingh2,
      ),
    ],
  );
}
