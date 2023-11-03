import 'package:flutter/material.dart';
import '../../configs/colors.dart';
import '../../configs/theme.dart';

class ImageCard extends StatelessWidget {
  final String image;

  const ImageCard({required this.image, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 24),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Stack(children: [
              Image.network(
                image,
                width: double.infinity,
                fit: BoxFit.fill,
                loadingBuilder: (_, child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return Center(child: child);
                  } else {
                    return Center(
                      child: SizedBox(
                        height: 65,
                        width: 55,
                        child: CircularProgressIndicator(
                          color: Colors.white.withOpacity(0.8),
                          strokeWidth: 1.2,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      ),
                    );
                  }
                },
              )
            ]),
          ),
          Container(
            padding: const EdgeInsets.only(
                left: 18, right: 40, bottom: 14, top: 170),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          "assets/images/ic_profile.png",
                          width: 32,
                          height: 32,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Dav",
                        style: AppTheme.whiteTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: AppTheme.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "caption",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppTheme.whiteTextStyle.copyWith(
                    fontSize: 12,
                    fontWeight: AppTheme.regular,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "#c",
                  style: AppTheme.whiteTextStyle.copyWith(
                    color: AppColors.greenColor,
                    fontSize: 12,
                    fontWeight: AppTheme.medium,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
