




import 'package:flutter/cupertino.dart';

class CenteredBody extends StatelessWidget {
  final Widget body;
  const CenteredBody({
    required this.body,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Center(
      child: SingleChildScrollView(
        physics:   const AlwaysScrollableScrollPhysics(),
        child:  body,
      ),
    );
  }
}