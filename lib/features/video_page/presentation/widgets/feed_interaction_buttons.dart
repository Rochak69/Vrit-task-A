import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/enum/the_states.dart';
import 'package:lookup/features/common/widgets/vertical_spacing.dart';
import 'package:lookup/features/homepage/data/all_feeds_model.dart';
import 'package:lookup/features/homepage/data/model/picture_response.dart';
import 'package:lookup/features/video_page/enum/user_feed_intereaction.dart';
import 'package:lookup/features/video_page/presentation/bloc/video_feed_bloc.dart';
import 'package:lookup/features/video_page/presentation/bloc/video_feed_state.dart';
import 'package:lookup/features/video_page/presentation/widgets/feed_interaction.dart';
import 'package:lookup/res/app_images.dart';
import 'package:lookup/res/colors.dart';
import 'package:lookup/utils/ui_helper.dart';
import 'package:wallpaper_handler/wallpaper_handler.dart';

class FeedInteractionButtons extends StatelessWidget {
  const FeedInteractionButtons(
      {required this.feed, required this.picture, super.key,});
  final FeedData feed;
  final PictureResponse picture;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: BlocConsumer<VideoFeedBloc, VideoFeedState>(
        listener: (context, state) => UiHelper.showSnackbar(
          context,
          message: state.errorMessage,
        ),
        listenWhen: (previous, current) => current.theStates == TheStates.error,
        buildWhen: (previous, current) =>
            previous.theStates != current.theStates ||
            previous.likeShareCount != current.likeShareCount,
        builder: (context, state) {
          return Column(
            children: [
              FeedInteraction(
                imagewidth: 44.w,
                count: state.theStates == TheStates.sucess
                    ? '${state.likeShareCount?.like ?? 0}'
                    : '..',
                image: AppImages.like,
                imageColor: (state.likeShareCount?.like ?? 0) > 0 &&
                        state.theStates == TheStates.sucess
                    ? AppColors.error
                    : AppColors.white,
                onTap: () => BlocProvider.of<VideoFeedBloc>(context).add(
                  LikeShareEvent(
                    feed: feed,
                    userFeedIntereaction: UserFeedIntereaction.like,
                  ),
                ),
              ),
              VerticalSpacing(24.h),
              FeedInteraction(
                imagewidth: 34.w,
                count: 'Set Wallpaper',
                image: AppImages.action,
                onTap: () async {
                  try {
                    var url = picture.src?.large ?? '';
                    var file = await DefaultCacheManager().getSingleFile(url);
                    var result =
                        await WallpaperHandler.instance.setWallpaperFromFile(
                      file.path,
                      WallpaperLocation.homeScreen,
                    );
                  } catch (e) {
                    debugPrint(e.toString());
                  }

                  // try {
                  //   final result = await AsyncWallpaper.setWallpaper(
                  //     url: picture.src?.large ?? '',
                  //     wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
                  //     toastDetails: ToastDetails.success(),
                  //     errorToastDetails: ToastDetails.error(),
                  //   )
                  //       ? 'Wallpaper set'
                  //       : 'Failed to get wallpaper.';
                  // } on PlatformException {
                  //   debugPrint('Error');
                  // }
                },
              ),
              VerticalSpacing(40.h),
            ],
          );
        },
      ),
    );
  }
}
