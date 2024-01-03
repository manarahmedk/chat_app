import 'package:chat_app/view/comonents/custom_text.dart';
import 'package:chat_app/view_model/utils/colors.dart';
import 'package:flutter/material.dart';

class SecondChatBubble extends StatelessWidget {
  String? text;

  SecondChatBubble({required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.background2,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
        ),
        child: CustomText(
          text: text??'',
        ),
      ),
    );
  }
}
