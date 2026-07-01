import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/chat/data/repo/repository/chat_repository_imp.dart';
import 'package:chat_app/features/chat/domain/entity/message_entity.dart';
import 'package:chat_app/features/chat/domain/repo/repository/chat_repository.dart';

class GetMessagesUseCase {
  GetMessagesUseCase({required ChatRepository repo}) : _repo = repo;

  final ChatRepository _repo;
  Stream<ResultFirebase<List<MessageEntity>>> invoke(String chatId) =>
      _repo.getMessages(chatId);
}

GetMessagesUseCase getMessagesUseCaseInjectable() =>
    GetMessagesUseCase(repo: chatRepositoryInjectable());
