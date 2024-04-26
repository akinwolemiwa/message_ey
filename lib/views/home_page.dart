import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:message_app/config/random_time.dart';
import 'package:message_app/customs/colors.dart';
import 'package:message_app/state/providers.dart';
import 'package:message_app/widgets/chat_list_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.mainTheme,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 15),
              child: Text(
                'Messages',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListView.separated(
            itemCount: ref.read(allChatsProvider).length,
            shrinkWrap: true,
            padding: const EdgeInsets.only(bottom: 20),
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(height: 5.h),
            itemBuilder: (context, index) {
              final randomTime = RandomTimeGenerator.generateRandomTime();
              return ConversationList(
                id: ref.read(allChatsProvider)[index].id!,
                randomTime: randomTime,
                topic: ref.read(allChatsProvider)[index].topic ??
                    ref.read(allChatsProvider)[index].members![0],
                lastMessage: ref.read(allChatsProvider)[index].lastMessage ??
                    'No Message',
              );
            },
          ),
        ]),
      ),
    );
  }
}
