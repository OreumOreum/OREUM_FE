import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {}); // 텍스트 변화 감지해서 rebuild
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isTyping = _controller.text.isNotEmpty;

    return TextField(
      controller: _controller,
      focusNode: _focusNode,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      style: context.textStyles.body1.copyWith(color: AppColors.gray400),
      cursorColor: AppColors.secondary,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: 10.h, horizontal: AppSizes.defaultPadding),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(AppSizes.radiusSM)),
        hintText: AppStrings.searchBarHintText,
        hintStyle: context.textStyles.body1.copyWith(color: AppColors.gray200),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(AppSizes.radiusSM)),
        filled: true,
        fillColor: AppColors.gray100,
        isDense: true,
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                onPressed: () {
                  if (isTyping) {
                    _controller.clear();
                  }
                },
                icon: isTyping
                    ? SvgPicture.asset(
                        IconPath.cancel,
                        width: 16.r,
                      )
                    : SizedBox(
                        height: 24.r,
                        width: 24.r,
                        child: Center(
                          child: SvgPicture.asset(
                            IconPath.search,
                            width: 18.r,
                          ),
                        ),
                      )),
            SizedBox(
              width: AppSizes.defaultPadding,
            ),
          ],
        ),
        suffixIconConstraints: BoxConstraints(
          minWidth: 0,
          minHeight: 0,
        ),
      ),
    );
  }
}
