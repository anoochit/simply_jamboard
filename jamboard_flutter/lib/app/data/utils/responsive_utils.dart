import 'package:flutter/material.dart';

abstract class ResponsiveUtils {
  static int gridItem(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width;
    if (size < 600) {
      return 1;
    } else if (size < 905) {
      return 2;
    } else if (size < 1240) {
      return 3;
    } else if (size < 1440) {
      return 4;
    } else {
      return 6;
    }
  }
}
