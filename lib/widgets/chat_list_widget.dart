import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:message_app/customs/colors.dart';
import 'package:message_app/views/chat_page.dart';

class ConversationList extends ConsumerStatefulWidget {
  final String lastMessage;
  final String topic;
  final TimeOfDay randomTime;
  final int id;

  const ConversationList(
      {super.key,
      required this.lastMessage,
      required this.topic,
      required this.randomTime,
      required this.id});

  @override
  ConsumerState<ConversationList> createState() => _ConversationListState();
}

class _ConversationListState extends ConsumerState<ConversationList> {
  @override
  Widget build(BuildContext context) {
    String capTopic =
        widget.topic.substring(0, 1).toUpperCase() + widget.topic.substring(1);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
              id: widget.id,
              title: widget.topic,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
            color: MyColors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: MyColors.grey),
          ),
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: MyColors.mainTheme),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          capTopic[0],
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: Container(
                        color: Colors.transparent,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              capTopic,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              widget.lastMessage,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                color: MyColors.textGrey,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                '${widget.randomTime.hour}:${widget.randomTime.minute}',
                style: const TextStyle(
                  color: MyColors.textGrey,
                  fontSize: 10,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
