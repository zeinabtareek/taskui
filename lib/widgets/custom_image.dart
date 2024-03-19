import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/AppImages.dart';
 class CustomImage extends StatelessWidget {
  final String? image;
  final double? height;
  final double? width;
  final BoxFit fit;
  final double radius;//859864
 final bool isAssets;
  final String placeholder;
  final String? svg;
  const CustomImage({
    super.key,
    this.image,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.placeholder = Images.placeholder,
    this.radius = 0,
    this.svg,   this.isAssets=false
  });

  @override
  Widget build(BuildContext context) {
    bool isSvg = svg != null;
    return isSvg
        ? SvgPicture.asset(
            svg!,
            height: height,
            width: width,
            fit: fit,
            placeholderBuilder: (context) => Image.asset(
                Images.placeholder,
                height: height,
                width: width,
                fit: fit),
                
          )
        : ClipRRect(
            borderRadius: BorderRadius.circular(radius),
            child:
            isAssets?Image.asset(image??''):
            CachedNetworkImage(
              imageUrl: image??'',
              height: height,
              width: width,
              // httpHeaders: getAuthHeader(),
              fit: fit,
              placeholder: (context, url) => Image.asset(Images.placeholder,
                  height: height, width: width, fit: fit),
              errorWidget: (context, url, error) => Image.asset(placeholder,
                  height: height, width: width, fit: fit),
            ),
          );

  }

  // Map<String, String>? getAuthHeader() {
  //   Map<String, String>? result = {};
  //
  //   sl<AuthCases>().isAuthenticated().then(
  //     (isAuthenticated) {
  //       if (!isAuthenticated) {
  //         result = null;
  //       } else {
  //         sl<AuthCases>().getUserData().then((userOrNull) {
  //           if (userOrNull == null) {
  //             result = null;
  //           } else {
  //             result?['Authorization'] = 'Bearer ${userOrNull.token}';
  //           }
  //         });
  //       }
  //     },
  //   );
  //
  //   return result;
  // }
}
