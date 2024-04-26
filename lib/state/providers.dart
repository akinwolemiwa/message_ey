import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:message_app/models/all_chat_model.dart';
import 'package:message_app/models/chat_detail_model.dart';

final allChatsProvider = StateProvider<List<AllChatsModel>>((ref) => []);
final chatRoomProvider = StateProvider<ChatRoomModel?>((ref) => null);
