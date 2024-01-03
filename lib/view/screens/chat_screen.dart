import 'package:chat_app/view/comonents/custom_text.dart';
import 'package:chat_app/view_model/bloc/message_cubit/message_cubit.dart';
import 'package:chat_app/view_model/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view_model/data/local/shared_keys.dart';
import '../../view_model/data/local/shared_prefernce.dart';
import '../comonents/chat_bubble.dart';
import '../comonents/custom_text_form_field.dart';
import '../comonents/second_chat_bubble.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var cubit = MessageCubit.get(context);
    return BlocProvider.value(
      value: MessageCubit.get(context)
        ..getAllMessagesFromFireStore(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.background,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/scholar.png',
              ),
              CustomText(text: 'Chat'),
            ],
          ),
        ),
        body: BlocConsumer<MessageCubit, MessageState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: cubit.scrollController,
                    itemBuilder: (context, index) {
                      return cubit.messages[index].id == LocalData.get(key: SharedKeys.email)
                          ? ChatBubble(
                        text: cubit.messages[index].message,
                      )
                          : SecondChatBubble(
                        text: cubit.messages[index].message,
                      );
                    },
                    itemCount: cubit.messages.length,
                  ),
                ),
                CustomTextFormField(
                  hintText: 'Send Message',
                  suffixIcon: Icons.send,
                  firstColor: AppColors.background,
                  keyboardType: TextInputType.text,
                  controller: cubit.messageController,
                  textInputAction: TextInputAction.next,
                  cursorColor: AppColors.black,
                  textColor: AppColors.black,
                  onPressed: () {
                    cubit.addMessageFireStore().then((value) => null);
                    cubit.scrollController.animateTo(
                      0,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                    cubit.clearData();
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
