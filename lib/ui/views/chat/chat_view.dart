import 'package:arm_test_1/app/app.locator.dart';
import 'package:arm_test_1/ui/common/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../common/textfields/chat_text_field.dart';
import 'chat_viewmodel.dart';

class ChatView extends StackedView<ChatViewModel> {
  const ChatView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ChatViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: ()=> locator<NavigationService>().back(),
          child: Icon(
            Icons.chevron_left_rounded,
            size: 30.sp,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            ClipOval(
              child: Icon(
                CupertinoIcons.person_alt_circle

              ),
            ),
            SizedBox(
              width: 8.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Interview Test Group",
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "Online",
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.green,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.phone_outlined,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(
              CupertinoIcons.ellipsis_vertical,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Expanded(
                child: GroupedListView<Message, DateTime>(
                  controller: viewModel.scrollController,
                  elements: viewModel.newMessage,
                  groupBy: (message) => DateTime(
                      message.date.year, message.date.month, message.date.day),
                  groupHeaderBuilder: (Message message) => Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 3.2,
                          child: const Divider(
                            thickness: 1.0,
                          )),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 10.h),
                        child: Text(DateFormat.yMMMd().format(message.date)),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3.2,
                        child: const Divider(
                          thickness: 1.0,
                        ),
                      ),
                    ],
                  ),
                  order: GroupedListOrder.ASC,
                  floatingHeader: true,
                  useStickyGroupSeparators: true,
                  itemBuilder: (context, Message message) => Align(
                    alignment: message.isSentByMe
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: message.isSentByMe
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Card(
                          color: message.isSentByMe ? colorPrimary : secondaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.r),
                              topLeft: Radius.circular(20.r),
                              bottomRight: !message.isSentByMe
                                  ? Radius.circular(20.r)
                                  : Radius.circular(0.r),
                              bottomLeft: message.isSentByMe
                                  ? Radius.circular(20.r)
                                  : Radius.circular(0.r),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                SizedBox(
                                  width: 250.w,
                                  child: Text(
                                    message.text,
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        Text(
                          formatDateTime(message.date),
                          style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black26),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                )),

            ChatFormField(
              hintText: "New Message",
              label: "",
              textEditingController: viewModel.messageController,
              onMessageSendBtnTap: () {
                viewModel.sendMessage(viewModel.messageController.text);
              },
            ),
            SizedBox(
              height: 20.h,
            )
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: _messages.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       return ListTile(
            //         title: Text(_messages[index]),
            //       );
            //     },
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: TextField(
            //           controller: _messageController,
            //           decoration: InputDecoration(
            //             hintText: 'Type your message...',
            //           ),
            //         ),
            //       ),
            //       IconButton(
            //         icon: Icon(Icons.attach_file),
            //         onPressed: () {
            //           // Handle file attachment here
            //         },
            //       ),
            //       IconButton(
            //         icon: Icon(Icons.send),
            //         onPressed: () {
            //           _sendMessage(_messageController.text);
            //         },
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  String formatDateTime(DateTime dateTime) {
    DateTime today = DateTime.now();

    if (dateTime.year == today.year &&
        dateTime.month == today.month &&
        dateTime.day == today.day) {
      // If the given dateTime is today, format as "Today 9:41 PM"
      return DateFormat("'Today' h:mm a").format(dateTime);
    } else {
      // Format as "MMM d, y 'at' h:mm a" for other dates
      return DateFormat("MMM d, y 'at' h:mm a").format(dateTime);
    }
  }

  @override
  ChatViewModel viewModelBuilder(
      BuildContext context,
      ) =>
      ChatViewModel();
}


class Message {
  final String text;
  final DateTime date;
  final bool isSentByMe;

  Message({required this.text, required this.date, required this.isSentByMe});
}


