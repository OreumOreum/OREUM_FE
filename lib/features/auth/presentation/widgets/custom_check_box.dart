import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:oreum_fe/core/constants/icon_path.dart';

class CustomCheckbox extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const CustomCheckbox({
    super.key,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onChanged(!isChecked),
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      icon: SvgPicture.asset(
        isChecked
            ? IconPath.checkBoxOn
            : IconPath.checkBoxOff,
        width: 24.r,
        height: 24.r,
        fit: BoxFit.scaleDown,
      ),
    );
  }
}
