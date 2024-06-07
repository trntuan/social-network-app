import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/chat_message/chat_message_bloc.dart';
import '../../helpers/helper_decode.dart';
import '../../models/params/param_open_chat.dart';
import '../../services/storage/my_data_storage.dart';
import 'chat_view_manager.dart';

class ChatView extends StatefulWidget {
  final ParamOpenChat message;
  const ChatView({required this.message, super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> with ChatViewManager {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  late final ChatMessageBloc bloc = GetIt.instance.get<ChatMessageBloc>();
  @override
  void initState() {
    bloc.add(GetChatData(
      widget.message,
    ));
    listenMessageEvent(() {
      bloc.add(const LoadChat());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //For pop button
      appBar: AppBar(
        title: Text('${widget.message.friendName}'),
      ),
      body: Column(
        children: <Widget>[Expanded(child: buildMessages()), buildInput()],
      ),
    );
  }

  Widget buildMessages() {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<ChatMessageBloc, ChatMessageState>(
        builder: (context, state) {
          return state.chat == null
              ? const SizedBox()
              : ListView.builder(
                  controller: _scrollController,
                  reverse: true,
                  itemCount: state.chat?.history?.length,
                  itemBuilder: (context, index) {
                    final item = state.chat?.history?[index];
                    return Align(
                      alignment: setMessageAlignment(item?.sender?.displayName,
                          MyDataStorage.singleton.displayName),
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: 100.sp, left: 20.sp, right: 20.sp),
                        child: Column(
                          crossAxisAlignment:
                              MyDataStorage.singleton.displayName ==
                                      item?.sender?.displayName
                                  ? CrossAxisAlignment.end
                                  : CrossAxisAlignment.start,
                          children: <Widget>[
                            // Text(
                            //   item?.sender?.displayName ?? '',
                            //   style: ThemeText.size40Black,
                            // ),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(item?.messageText ?? ''),
                              ),
                            ),
                            Text(HelperDecode.convertToVietnameseDateTime(
                                item?.timestamp.toString())),
                          ],
                        ),
                      ),
                    );
                  });
        },
      ),
    );
  }

  Widget buildInput() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(hintText: 'Enter message'),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () => {
                bloc.add(SendMessage(
                  _controller.text,
                )),
                _controller.clear(),
              },
            ),
          ],
        ),
      ),
    );
  }
}
