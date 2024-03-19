


import 'dart:async';

import '../../../common/AppImages.dart';
import '../../../core/bases/base_cubit.dart';

class ProfileCubit extends BaseCubit {
  @override
  // TODO: implement data
  get data => throw UnimplementedError();

  @override
  FutureOr<void> init() {}

  final images = [
    Images.doc,
    Images.f,
    Images.s,
    Images.bank,
    Images.setting,
  ];
  final labels = [
    'Contact Info',
    'Source of Funding Info',
   'Bank Account Info',
    'Document Info',
    'Settings',
  ];  final labelsContact = [
    {'title': 'Name','subtitle': 'John Doe'},
    {'title': 'Email','subtitle': 'q3b2M@example.com'},
    {'title': 'Gender','subtitle': 'Male'},
    {'title': 'Address','subtitle': '1234567890'},
    {'title': 'City','subtitle': 'Egypt'},
    {'title': 'BirthDay','subtitle': '05 November 1993'},
    {'title': 'Phone','subtitle': '1234567890'},

  ];

}