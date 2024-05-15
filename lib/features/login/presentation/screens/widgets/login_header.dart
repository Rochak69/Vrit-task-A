import 'package:flutter/material.dart';
import 'package:lookup/res/index.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Vrit Technology',
      style: TextStyle(
          color: AppColors.white, fontWeight: FontWeight.w700, fontSize: 24,),
    );
  }
}
