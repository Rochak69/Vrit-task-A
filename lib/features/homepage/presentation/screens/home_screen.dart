import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lookup/enum/the_states.dart';
import 'package:lookup/features/common/widgets/app_button.dart';
import 'package:lookup/features/common/widgets/app_scaffold.dart';
import 'package:lookup/features/homepage/data/model/picture_response.dart';
import 'package:lookup/features/homepage/presentation/bloc/home_bloc.dart';
import 'package:lookup/features/homepage/presentation/widgets/feed_card.dart';
import 'package:lookup/features/homepage/presentation/widgets/home_app_bar.dart';
import 'package:lookup/features/homepage/presentation/widgets/home_search_field.dart';
import 'package:lookup/res/colors.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(FetchAllData());
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: Colors.blueGrey,
      appBar: const HomeAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            const HomeSearchField(),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return Expanded(
                    child: state.theStates == TheStates.error
                        ? AppButton.blue(
                            text: state.errorMessage ?? '',
                            onTap: () {
                              BlocProvider.of<HomeBloc>(context)
                                  .add(FetchAllData());
                            },
                          )
                        : state.theStates == TheStates.sucess
                            ? GridView.builder(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                itemCount: state.pictures?.length ?? 0,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 16,
                                        mainAxisSpacing: 16,),
                                itemBuilder: (context, index) => FeedCard(
                                  picture: state.pictures?[index] ??
                                      PictureResponse(),
                                ),
                              )
                            : LoadingAnimationWidget.threeRotatingDots(
                                color: AppColors.white,
                                size: 40.r,
                              ),);
              },
            ),
          ],
        ),
      ),
    );
  }
}
