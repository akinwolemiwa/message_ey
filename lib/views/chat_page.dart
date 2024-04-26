import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:message_app/customs/colors.dart';
import 'package:message_app/services/chat_services.dart';
import 'package:message_app/state/providers.dart';

class ChatPage extends ConsumerStatefulWidget {
  final int id;
  final String title;
  const ChatPage({
    super.key,
    required this.id,
    required this.title,
  });

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  final _chatController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // _loadChat();
  }

  _loadChat() {
    switch (widget.id.toString()) {
      case '1':
        return ref.read(chatsApiProvider).getChat1(
              ref: ref,
              onError: (message) {},
            );
      case '2':
        return ref.read(chatsApiProvider).getChat2(
              ref: ref,
              onError: (message) {},
            );
      case '3':
        return ref.read(chatsApiProvider).getChat3(
              ref: ref,
              onError: (message) {},
            );
      case '4':
        return ref.read(chatsApiProvider).getChat4(
              ref: ref,
              onError: (message) {},
            );
      default:
        return Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    String capTitle =
        widget.title.substring(0, 1).toUpperCase() + widget.title.substring(1);

    return Scaffold(
      backgroundColor: MyColors.mainTheme,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: true,
        backgroundColor: MyColors.mainTheme,
        title: Text(capTitle),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    _chatController.text.isEmpty
                        ? const SizedBox()
                        : Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: MyColors.textGrey.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Text(
                                      _chatController.text,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 5.h),
                              const Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  'ME',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                    SizedBox(height: 20.h),
                    _chatController.text.isEmpty
                        ? const SizedBox()
                        : Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: MyColors.yellow.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.all(16),
                                child: Text(
                                  ref.watch(chatRoomProvider)?.message ?? '',
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ),
                          ),
                    SizedBox(height: 5.h),
                    _chatController.text.isEmpty
                        ? const SizedBox()
                        : Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              ref
                                      .read(chatRoomProvider)
                                      ?.sender!
                                      .toUpperCase() ??
                                  '',
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.normal),
                            ),
                          ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: MyColors.grey,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: TextField(
                  controller: _chatController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(12),
                    border: InputBorder.none,
                    hintText: 'Type here...',
                  ),
                  onSubmitted: (value) {
                    setState(() {
                      Future.delayed(const Duration(seconds: 2), () {
                        _loadChat();
                      });
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// the message isn't coming in a list and keeps changing as well so it's tricky to make it act like a list
