import 'package:delivery/features/authentication/presentation/providers/auth_provider.dart';
import 'package:delivery/features/authentication/presentation/providers/states/auth_state.dart';
import 'package:delivery/features/authentication/presentation/widget/login_widget.dart';
import 'package:delivery/features/authentication/presentation/widget/signup_info.dart';
import 'package:delivery/features/home/presentation/screen/home.dart';
import 'package:delivery/shared/utils/context_extension.dart';
import 'package:delivery/shared/widgets/strips.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends ConsumerWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authStateNotifierProvider);
    ref.listen(
      authStateNotifierProvider.select((value) => value),
      ((previous, next) {
        //show Snackbar on failure
        if (next is Failure) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(next.exception.message.toString())));
        } else if (next is Success) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const Home(),
            ),
          );
        }
      }),
    );
    return Scaffold(
      body: Column(
        children: [
          const Strips(
            strips: "assets/strips.svg",
          ),
          SvgPicture.asset(
            "assets/stack.svg",
            height: 237.h,
          ),
          SizedBox(height: 97.h),
          Text(
            "Welcome to E-Bikes",
            style: GoogleFonts.inter(
              textStyle:
                  context.textTheme.titleLarge!.copyWith(fontSize: 24.sp),
            ),
          ),
          SizedBox(height: 8.h),
          SizedBox(
            width: 304.w,
            child: Text(
              "Buying Electric bikes just got a lot easier, Try us today.",
              style: GoogleFonts.inter(
                textStyle: context.textTheme.bodyMedium!.copyWith(
                  height: 1.4,
                  fontSize: 14.sp,
                ),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 48.h),
          state.maybeMap(
            loading: (_) => const Center(child: CircularProgressIndicator()),
            orElse: () => loginButton(ref),
          ),
          SizedBox(height: 48.h),
          const SignUpInfo()
        ],
      ),
    );
  }

  Widget loginButton(WidgetRef ref) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: ElevatedButton(
        onPressed: () {
          ref.read(authStateNotifierProvider.notifier).loginUser();
        },
        child: const LoginWidget(),
      ),
    );
  }
}
