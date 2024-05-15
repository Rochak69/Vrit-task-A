import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lookup/features/homepage/presentation/bloc/home_bloc.dart';
import 'package:lookup/res/colors.dart';

class HomeSearchField extends StatelessWidget {
  const HomeSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: TextField(
        onChanged: (value) {
          EasyDebounce.debounce('search', Durations.medium1, () {
            BlocProvider.of<HomeBloc>(context).add(FetchAllData(search: value));
          });
        },
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.textfieldHintGrey,
          ),
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 6.h),
          hintText: 'Search photos',
        ),
      ),
    );
  }
}
