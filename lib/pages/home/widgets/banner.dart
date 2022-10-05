import 'package:flutter/material.dart';

class WBanner extends StatelessWidget {
  const WBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(width: 10.0),
          BannerImage('lib/images/banners/1.jpg'),
          BannerImage('lib/images/banners/2.jpg'),
          SizedBox(width: 10.0),
        ],
      )
    );
  }

  TextButton BannerImage(imageAsset) {
    return TextButton(
          onPressed: () {},
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  imageAsset,
                  width: 250.0,
                ),
              ),
            ],
          )
        );
  }
}