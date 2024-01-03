import 'package:bloc/bloc.dart';
import 'package:chat_app/model/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/firebase/firebase.dart';
import '../../data/local/shared_keys.dart';
import '../../data/local/shared_prefernce.dart';

part 'message_state.dart';

class MessageCubit extends Cubit<MessageState> {
  MessageCubit() : super(MessageInitial());

  static MessageCubit get(context) => BlocProvider.of<MessageCubit>(context);

  TextEditingController messageController = TextEditingController();

  ScrollController scrollController=ScrollController();

  List<Message> messages = [];

  Future<void> addMessageFireStore() async {
    emit(AddNewMessageLoadingState());
    Message message = Message(
      message: messageController.text,
      createdAt: DateTime.now(),
      id: LocalData.get(key: SharedKeys.email),
    );
    await FirebaseFirestore.instance
        .collection(FirebaseKeys.messages)
        .add(message.toJson())
        .then((value) {
      print(value);
      emit(AddNewMessageSuccessState());
      getAllMessagesFromFireStore();
    }).catchError((error) {
      print(error);
      emit(AddNewMessageErrorState());
      throw error;
    });
  }

  Future<void> getAllMessagesFromFireStore() async {
    emit(GetAllMessagesLoadingState());
    FirebaseFirestore.instance
        .collection(FirebaseKeys.messages)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .listen((value) {
          messages.clear();
      for (var i in value.docs) {
        print(i);
        print(i.data());
        messages.add(Message.fromJson(i.data()));
      }
      emit(GetAllMessagesSuccessState());
    }, onError: (error) {
      print(error);
      emit(GetAllMessagesErrorState());
      throw error;
    });
  }

  void clearData() {
    messageController.clear();
    emit(ClearDataState());
  }

}
