import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/search/bloc/search_cubit.dart';

import '../bloc/search_state.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return TextField(
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
          decoration: InputDecoration(
              suffixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              hintText: "Search...",
              hintStyle: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(width: 1, color: Colors.white)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(width: 1, color: Colors.white)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: const BorderSide(width: 1, color: Colors.white))),
          onChanged: (value) {
            if (value.isNotEmpty) {
              context.read<SearchCubit>().search(value);
            }
          },
        );
      },
    );
  }
}
