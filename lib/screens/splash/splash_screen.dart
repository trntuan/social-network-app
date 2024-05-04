import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_it/get_it.dart';

import '../../bloc/splash/splash_bloc.dart';
import '../../theme/theme_image.dart';
import '../../theme/theme_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late final SplashBloc bloc = GetIt.instance.get<SplashBloc>();

  @override
  void initState() {
    super.initState();
    bloc.add(const StartApp());

    bloc.login();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocBuilder<SplashBloc, SplashState>(
        builder: (context, state) {
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 30.sp),
                        child: StreamBuilder<bool>(
                            initialData: false,
                            stream: bloc.internetStatus.stream,
                            builder: (context, snapshot) {
                              final isConnected = snapshot.data ?? false;
                              return Padding(
                                padding: EdgeInsets.only(
                                  bottom: 50.sp,
                                ),
                                child: Column(
                                  children: [
                                    // ============= title cannot connect network ==============
                                    if (isConnected)
                                      Padding(
                                        padding: EdgeInsets.only(
                                          bottom: 80.sp,
                                        ),
                                        child: Text(
                                          'không kể kết nối internet',
                                          style: ThemeText.size50Black,
                                        ),
                                      ),
                                    // ============== version and icon load screen ==============
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Center(
                                          child: SpinKitWave(
                                            color: Colors.black,
                                            size: 50.sp,
                                          ),
                                        ),
                                        Positioned(
                                          left: 20.sp,
                                          bottom: 0,
                                          child: Text(
                                            '1.0.0',
                                            style: ThemeText.size80BlackBold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
                Positioned(
                  child: Center(
                    child: Image(
                      image: ImageAssets.iconApp,
                      fit: BoxFit.cover,
                      width: 700.sp,
                      height: 700.sp,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
