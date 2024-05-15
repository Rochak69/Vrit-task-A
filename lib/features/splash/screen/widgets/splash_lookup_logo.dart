import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/features/login/presentation/screens/widgets/login_header.dart';

class SplashLookupLogo extends StatelessWidget {
  const SplashLookupLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 57.w),
        child: const LoginHeader(),
      ),
    );
  }
}
