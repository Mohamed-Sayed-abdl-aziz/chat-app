import 'package:chat_app/core/network/resulet_firebase.dart';
import 'package:chat_app/features/chat/data/repo/repository/chat_repository_imp.dart';
import 'package:chat_app/features/chat/domain/entity/message_entity.dart';
import 'package:chat_app/features/chat/domain/repo/repository/chat_repository.dart';

class SendMessageUseCase {
  SendMessageUseCase({required ChatRepository repo}) : _repo = repo;

  final ChatRepository _repo;
  Future<ResultFirebase<bool>> invoke(
    String chatId,
    MessageEntity message,
    List<String> chatMembers,
  ) => _repo.sendMessage(chatId, message, chatMembers);
}
// chatRepositoryInjectable

SendMessageUseCase sendMessageUseCaseInjectable() =>
    SendMessageUseCase(repo: chatRepositoryInjectable());
