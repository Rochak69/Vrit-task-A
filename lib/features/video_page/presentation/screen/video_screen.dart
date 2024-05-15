import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/features/common/widgets/app_scaffold.dart';
import 'package:lookup/features/homepage/data/all_feeds_model.dart';
import 'package:lookup/features/homepage/data/model/picture_response.dart';
import 'package:lookup/features/homepage/presentation/widgets/home_app_bar.dart';
import 'package:lookup/features/video_page/presentation/widgets/feed_interaction_buttons.dart';

@RoutePage()
class FullPictureScreen extends StatefulWidget {
  const FullPictureScreen({required this.picture, super.key});
  final PictureResponse picture;

  @override
  State<FullPictureScreen> createState() => _FullPictureScreenState();
}

class _FullPictureScreenState extends State<FullPictureScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.picture.src?.large ?? ''),
          fit: BoxFit.cover,
        ),
      ),
      child: AppScaffold(
        appBar: const HomeAppBar(),
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.fromLTRB(22.w, 50.h, 22.w, 26.h),
          child: Column(
            children: [
              const Spacer(),
              FeedInteractionButtons(
                feed: FeedData(id: 1, image: 'as'),
                picture: widget.picture,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
