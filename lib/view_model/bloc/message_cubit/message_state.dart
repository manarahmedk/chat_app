part of 'message_cubit.dart';

@immutable
abstract class MessageState {}

class MessageInitial extends MessageState {}

class AddNewMessageLoadingState extends MessageState{}

class AddNewMessageSuccessState extends MessageState{}

class AddNewMessageErrorState extends MessageState{}

class GetAllMessagesLoadingState extends MessageState{}

class GetAllMessagesSuccessState extends MessageState{}

class GetAllMessagesErrorState extends MessageState{}

class ClearDataState extends MessageState{}
