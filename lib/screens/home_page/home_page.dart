import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/home_page/home_page_bloc.dart';
import '../../const/const_router.dart';
import '../../services/get_it/get_instance.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomePageBloc bloc = GetIt.instance.get<HomePageBloc>();

  @override
  void initState() {
    super.initState();

    getData();
  }

  void getData() {
    bloc.add(const GetPost());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          return Scaffold(
              body: SingleChildScrollView(
            child: Container(
              color: Colors.grey,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // GetInstance.navigator.pop();
                      GetInstance.navigator.pushNamed(
                        ConstRouter.postNewletter,
                      );
                    },
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 0.8.sw,
                            height: 120.sp,
                            margin: EdgeInsets.only(
                              left: 50.sp,
                              right: 20.sp,
                              top: 20.sp,
                              bottom: 20.sp,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            child: const Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Bạn có muốn đăng 1 bản tin mới không?',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Icon(
                            Icons.post_add,
                            size: 80.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Center(
                      child: Text(
                    'Home Page',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
