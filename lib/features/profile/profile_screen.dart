import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:lookup/features/app/app.dart';
import 'package:lookup/features/app/bloc/app_profile_bloc.dart';
import 'package:lookup/features/common/widgets/app_scaffold.dart';
import 'package:lookup/features/homepage/presentation/widgets/home_app_bar.dart';
import 'package:lookup/res/colors.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const HomeAppBar(
        showProfile: false,
      ),
      body: BlocBuilder<AppProfileBloc, AppProfileState>(
        builder: (context, state) {
          return Center(
            child: Column(
              children: [
                Text(
                  'Email: ${state.user?.email ?? ''}',
                  style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  'Name: ${state.user?.name ?? ''}',
                  style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
