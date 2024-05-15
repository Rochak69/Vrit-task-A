import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lookup/core/route/app_router.gr.dart';
import 'package:lookup/features/homepage/data/model/picture_response.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({required this.picture, super.key});
  final PictureResponse picture;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AutoRouter.of(context).push(FullPictureRoute(picture: picture));
      },
      child: Image.network(
        picture.src?.medium ?? '',
        fit: BoxFit.cover,
      ),
    );
  }
}
