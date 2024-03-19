





import 'package:flutter/cupertino.dart';

class NonCenteredBody extends StatelessWidget {
  final Widget body;
  const NonCenteredBody({
    required this.body,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    SingleChildScrollView(
      physics:   const AlwaysScrollableScrollPhysics(),
      child:  body,
    );
  }
}
