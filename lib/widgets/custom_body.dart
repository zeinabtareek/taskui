
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taskui/widgets/centered_body.dart';
import '../../common/AppImages.dart';
import '../../widgets/custom_app_bar.dart';
import '../common/app_style.dart';
import '../core/utils/dimensions.dart';
import 'non_centered_body.dart';

class CustomBody extends StatefulWidget {
  final Widget body;
  final CustomAppBar? appBar;
  final bool? isCentered;
  final  Future  Function() ?onRefresh;
  Widget? bottomSheet;
  CustomBody({
    Key? key,
    required this.body,
    this.isCentered = true,
    this.appBar,
      this.onRefresh,
    this.bottomSheet,
  }) : super(key: key);

  @override
  State<CustomBody> createState() => _CustomBodyState();
}

class _CustomBodyState extends State<CustomBody>
    with SingleTickerProviderStateMixin {


  @override
  initState() {
    super.initState();
   }

  @override
  void dispose() {
     super.dispose();
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Dimensions dimensions = Dimensions.getInstance(context);
    return

      RefreshIndicator(
        onRefresh:widget.onRefresh??()async{},
          child:

                  Scaffold(
                        key: scaffoldKey,
                        backgroundColor:
                        Theme.of(context).scaffoldBackgroundColor,
                        appBar:
                        widget.appBar != null
                            ?
                        CustomAppBar(
                          title: widget.appBar?.title ?? '',

                          onBackPressed: widget.appBar?.onBackPressed,
                          onTap: widget.appBar?.onTap,
                          height: widget.appBar?.height,
                          regularAppBar:
                          widget.appBar?.regularAppBar ?? false,
                          noActions: widget.appBar?.noActions,
                          showBackButton: widget.appBar?.showBackButton,
                          centerTitle: widget.appBar?.centerTitle ?? true,
                        )
                            : null,

                        body: Container(
                          margin:
                          EdgeInsets.only(top: dimensions.paddingSizeDefault),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.only(
                              topStart: Radius.circular(dimensions.radiusDefault),
                              topEnd: Radius.circular(dimensions.radiusDefault),
                            ),
                          ),
                          child: Padding(
                              padding: K.fixedPadding1,
                              child: widget.isCentered == true
                                  ? CenteredBody(body: widget.body)
                                  : NonCenteredBody(body: widget.body)),
                        ),
                        bottomSheet:widget.bottomSheet??null,

    ));
  }

  }