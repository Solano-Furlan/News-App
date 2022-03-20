import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:presentation/presentation.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          // physics: const NeverScrollableScrollPhysics(),
          physics: ClampingScrollPhysics(),

          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    SvgPicture.asset(
                      AppSvgIcons.securityIcon,
                      package: "presentation",
                      height: 180,
                    ),
                    const SizedBox(height: 35),
                    const Text(
                      "Welcome to Pressage",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Keep informed about world news",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.kGrey,
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    const PrimaryTextField(
                      initVal: "",
                      label: "Email",
                      hint: "Your Email",
                      isEmail: true,
                    ),
                    const SizedBox(height: 15),
                    const PrimaryTextField(
                      initVal: "",
                      label: "Password",
                      hint: "Your password",
                      isPassword: true,
                    ),
                    const SizedBox(height: 15),
                    PrimaryButton(
                      text: "Login",
                      onPressed: () {},
                    ),
                    const SizedBox(height: 15),
                    PrimaryTextButton(
                      onPressed: () {},
                      text1: "Forgot password?",
                    ),
                    const Spacer(),
                    PrimaryTextButton(
                      onPressed: () {},
                      text1: "Don't have an account?",
                      text2: "Sign Up",
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
