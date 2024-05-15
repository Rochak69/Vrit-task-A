import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lookup/core/route/app_router.gr.dart';
import 'package:lookup/features/profile/profile_screen.dart';
import 'package:lookup/res/colors.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showProfile;
  const HomeAppBar({super.key, this.showProfile = true});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blueGrey,
      title: const Text(
        'Vrit Tech.',
        style: TextStyle(
          color: AppColors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        if (showProfile)
          IconButton(
              onPressed: () {
                AutoRouter.of(context).push(const ProfileRoute());
              },
              icon: Icon(Icons.person_outline))
      ],
      iconTheme: const IconThemeData(color: AppColors.white),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
