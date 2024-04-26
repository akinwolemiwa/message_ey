import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:message_app/flavors.dart';
import 'package:message_app/models/all_chat_model.dart';
import 'package:message_app/models/chat_detail_model.dart';
import 'package:message_app/state/providers.dart';
import 'package:message_app/utils/network.dart';

final chatsApiProvider = Provider<ChatService>((ref) => ChatService());

class ChatService {
  Network network = NetworkImplementation();

  Future<void> getAllChats({
    required WidgetRef ref,
    required void Function(String message) onError,
  }) async {
    List<AllChatsModel> allChats = [];

    try {
      var response = await network.get(
        '${F.baseUrl}chat_room',
      );

      var data = response['data'];

      for (var e in data) {
        allChats.add(AllChatsModel.fromJson(e));
      }

      try {
        ref.read(allChatsProvider.notifier).state = allChats;
      } catch (_) {}

      return response;
    } catch (e) {
      onError(e.toString());
    }
  }

  Future<void> getChat1({
    required WidgetRef ref,
    required void Function(String message) onError,
  }) async {
    try {
      var response = await network.get(
        '${F.baseUrl}chat_room/1',
      );
      ref.read(chatRoomProvider.notifier).state =
          ChatRoomModel.fromJson(response['data']);

      return response;
    } catch (e) {
      onError(e.toString());
    }
  }

  Future<void> getChat2({
    required WidgetRef ref,
    required void Function(String message) onError,
  }) async {
    try {
      var response = await network.get(
        '${F.baseUrl}chat_room/2',
      );

      ref.read(chatRoomProvider.notifier).state =
          ChatRoomModel.fromJson(response['data']);

      return response;
    } catch (e) {
      onError(e.toString());
    }
  }

  Future<void> getChat3({
    required WidgetRef ref,
    required void Function(String message) onError,
  }) async {
    try {
      var response = await network.get(
        '${F.baseUrl}chat_room/3',
      );
      ref.read(chatRoomProvider.notifier).state =
          ChatRoomModel.fromJson(response['data']);

      return response;
    } catch (e) {
      onError(e.toString());
    }
  }

  Future<void> getChat4({
    required WidgetRef ref,
    required void Function(String message) onError,
  }) async {
    try {
      var response = await network.get(
        '${F.baseUrl}chat_room/4',
      );

      ref.read(chatRoomProvider.notifier).state =
          ChatRoomModel.fromJson(response['data']);

      return response;
    } catch (e) {
      onError(e.toString());
    }
  }
}
