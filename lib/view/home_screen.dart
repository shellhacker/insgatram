import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:insgatram/configs/url.dart';
import 'package:insgatram/model/post_model.dart';
import 'package:insgatram/view/widgets/image_card_post.dart';
import 'package:insgatram/view/widgets/video_card.dart';

import '../configs/colors.dart';
import '../configs/theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    allDatas.shuffle();
    log(allDatas.length.toString());
    return Scaffold(
      appBar: AppBar(
          leading: Row(
            children: [
              const SizedBox(width: 8),
              Image.asset(
                'assets/images/ic_logo.png',
                width: 30,
                height: 30,
              ),
            ],
          ),
          title: Row(children: [
            Image.asset("assets/images/ic_notification.png",
                width: 20, height: 20),
            const SizedBox(width: 12),
            Image.asset("assets/images/ic_search.png", width: 20, height: 20),
          ]),
          actions: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: AppColors.backgroundColor,
              ),
              child: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.whiteColor,
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.blackColor.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 10),
                        ),
                      ],
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/images/img_profile.jpeg",
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    "Sajon.co",
                    style: AppTheme.blackTextStyle
                        .copyWith(fontWeight: AppTheme.bold, fontSize: 12),
                  ),
                  const SizedBox(width: 2),
                  Image.asset(
                    "assets/images/ic_checklist.png",
                    width: 16,
                  ),
                  const SizedBox(width: 4),
                ],
              ),
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                child: ListView.separated(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (context, index) {
                      return const SizedBox();
                    },
                    itemCount: allDatas.length,
                    itemBuilder: (context, index) {
                      return allDatas[index].toString().endsWith('.mp4')
                          ? VideoCard(
                              index: index,
                              post: PostModel(
                                  name: index.isEven ? "Ashik" : "Varun",
                                  imgProfile: "assets/images/ic_profile.png",
                                  data: allDatas[index],
                                  pictureHash: "pictureHash",
                                  caption: "caption",
                                  hashtags: ["cc"],
                                  like: "like",
                                  comment: "comment",
                                  share: "share"))
                          : ImageCard(image: allDatas[index]);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
