import 'package:flutter/widgets.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errorMessage});
 final String errorMessage;
  @override
  Widget build(BuildContext context) {
   return Center(child: Text(errorMessage),);
  }
}