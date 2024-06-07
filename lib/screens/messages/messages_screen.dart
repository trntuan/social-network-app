import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/messages/messages_bloc.dart';
import '../../const/const_router.dart';
import '../../models/messages/messages_model.dart';
import '../../models/params/param_open_chat.dart';
import '../../services/get_it/get_instance.dart';
import '../../widgets/custom_appbar/button_appbar.dart';
import '../../widgets/custom_appbar/custom_appbar.dart';
import '../../widgets/custom_load.dart';
import '../../widgets/widget_post/widget_post.dart';
import '../chat/chat_view_manager.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> with ChatViewManager {
  late final MessagesBloc bloc = GetIt.instance.get<MessagesBloc>();

  @override
  void initState() {
    bloc.add(const MessagesEventGetMessages());

    listenMessageEvent(() {
      bloc.add(const MessagesEventGetMessages());
    });
    super.initState();
  }

  //
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child:
          BlocBuilder<MessagesBloc, MessagesState>(builder: (context, state) {
        return Scaffold(
            appBar: CustomAppbar(
              iconLeft: IconAppbar.back,
              title: 'Đoạn chat',
              onTapAction: () {
                GetStores.navigator.pushNamed(ConstRouter.messages);
              },
            ),
            body: refreshList(
              emptyContent: '',
              // onRefresh: getData,
              // onLoad: () => bloc.add(const GetMorePost()),
              child: ListView.builder(
                itemCount: state.messages.length,
                itemBuilder: (context, index) {
                  final item = state.messages[index];
                  return GestureDetector(
                    onTap: () async {
                      await GetStores.navigator.pushNamed<ParamOpenChat>(
                        ConstRouter.chat,
                        extra: ParamOpenChat(
                          '${item?.otherUserId}',
                          item?.otherUserName,
                        ),
                      );
                    },
                    child: Container(
                      height: 200.sp,
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: titlePost(
                        onTap: () {
                          GetStores.navigator.pushNamed<MessagesModel>(
                            ConstRouter.chat,
                            extra: item,
                          );
                        },
                        avatar: item?.otherUserAvatar,
                        name: item?.otherUserName,
                      ),
                    ),
                  );
                },
              ),
            ));
      }),
    );
  }
}
