import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension AppTextStyles on TextTheme {
  /// HeadLine
  TextStyle get headLine1 => TextStyle(
    letterSpacing: (28.sp * -0.28 / 100).w,
    height: 36 / 28,
    fontSize: 28.sp,
    fontVariations: const <FontVariation>[
      FontVariation('wght', 700),
    ],
  );

  TextStyle get headLine2 => TextStyle(
    letterSpacing: (24.sp * -0.24 / 100).w,
    height: 32 / 24,
    fontSize: 24.sp,
    fontVariations: const <FontVariation>[
      FontVariation('wght', 700),
    ],
  );

  TextStyle get headLine3 => TextStyle(
    letterSpacing: (20.sp * -0.2 / 100).w,
    height: 28 / 20,
    fontSize: 20.sp,
    fontVariations: const <FontVariation>[
      FontVariation('wght', 700),
    ],
  );

  TextStyle get headLine4 => TextStyle(
    letterSpacing: (18.sp * -0.18 / 100).w,
    height: 26 / 18,
    fontSize: 18.sp,
    fontVariations: const <FontVariation>[
      FontVariation('wght', 700),
    ],
  );

  TextStyle get headLine5 => TextStyle(
    letterSpacing: 0,
    height: 38 / 32,
    fontSize: 32.sp,
    fontVariations: const <FontVariation>[
      FontVariation('wght', 600),
    ],
  );

  /// Label
  TextStyle get label1 => TextStyle(
    letterSpacing: (16.sp * -0.16 / 100).w,
    fontSize: 16.sp,
    height: 24 / 16,
    fontVariations: const <FontVariation>[
      FontVariation('wght', 700),
    ],
  );

  TextStyle get label2 => TextStyle(
    letterSpacing: 0,
    height: 16 / 12,
    fontSize: 12.sp,
    fontVariations: const <FontVariation>[
      FontVariation('wght', 700),
    ],
  );

  TextStyle get label3 => TextStyle(
    letterSpacing: (16.sp * -0.08 / 100).w,
    height: 24 / 16,
    fontSize: 16.sp,
    fontVariations: const <FontVariation>[
      FontVariation('wght', 600),
    ],
  );

  TextStyle get label4 => TextStyle(
    letterSpacing: (14.sp * 0.07 / 100).w,
    height: 20 / 14,
    fontSize: 14.sp,
    fontVariations: const <FontVariation>[
      FontVariation('wght', 600),
    ],
  );

  /// Body
  TextStyle get body1 => TextStyle(
    letterSpacing: (14.sp * -0.07 / 100).w,
    fontSize: 14.sp,
    height: 20 / 14,
    fontVariations: const <FontVariation>[
      FontVariation('wght', 500),
    ],
  );

  TextStyle get body2 => TextStyle(
    letterSpacing: 0,
    height: 22 / 14,
    fontSize: 14.sp,
    fontVariations: const <FontVariation>[
      FontVariation('wght', 400),
    ],
  );

  /// Caption
  TextStyle get caption1 => TextStyle(
    letterSpacing: (12.sp * 1.25 / 100).w,
    height: 16 / 12,
    fontSize: 12.sp,
    fontVariations: const <FontVariation>[
      FontVariation('wght', 500),
    ],
  );

  TextStyle get caption2 => TextStyle(
    letterSpacing: (12.sp * 1.25 / 100).w,
    height: 16 / 12,
    fontSize: 12.sp,
    fontVariations: const <FontVariation>[
      FontVariation('wght', 400),
    ],
  );

  TextStyle get caption3 => TextStyle(
    letterSpacing: 0,
    height: 14 / 12,
    fontSize: 10.sp,
    fontVariations: const <FontVariation>[
      FontVariation('wght', 600),
    ],
  );
}
