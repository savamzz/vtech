import 'package:flutter/material.dart';
import 'package:vtech/src/constant/app_padding.dart';

class AppEdgeInsets {
  static final AppEdgeInsets instance = AppEdgeInsets._();
  AppEdgeInsets._();
  
  EdgeInsets get primary => EdgeInsets.all(AppPadding.instance.primary);
}