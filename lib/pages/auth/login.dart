import 'package:auto_route/auto_route.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/bloc/login_bloc/login_bloc.dart';
import 'package:news_app/routes/routes.gr.dart';
import 'package:presentation/presentation.dart';

class LoginPage extends StatelessWidget {
  final PageType pageType;
  LoginPage({
    Key? key,
    required this.pageType,
  }) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessful) {
          AutoRouter.of(context).replaceAll([const HomeRoute()]);
        }
      },
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async => false,
          child: SafeArea(
            child: Scaffold(
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
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
                          PrimaryTextField(
                            controller: emailController,
                            label: "Email",
                            hint: "Your Email",
                            isEmail: true,
                          ),
                          const SizedBox(height: 15),
                          PrimaryTextField(
                            controller: passwordController,
                            label: "Password",
                            hint: "Your password",
                            isPassword: true,
                          ),
                          const SizedBox(height: 15),
                          PrimaryButton(
                            isDisabled: emailController.text.isEmpty ||
                                passwordController.text.isEmpty,
                            isLoading: state is LoginLoading,
                            text: pageType == PageType.login
                                ? "Login"
                                : "Sign Up",
                            onPressed: () {
                              if (pageType == PageType.login) {
                                context.read<LoginBloc>().add(
                                      LoginWithEmailEvent(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                              } else {
                                context.read<LoginBloc>().add(
                                      SignUpWithEmailEvent(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                              }
                            },
                          ),
                          if (pageType == PageType.login) ...[
                            const SizedBox(height: 15),
                            PrimaryTextButton(
                              onPressed: () {},
                              text1: "Forgot password?",
                            ),
                          ],
                          const Spacer(),
                          PrimaryTextButton(
                            onPressed: () => AutoRouter.of(context).replace(
                              LoginRoute(
                                pageType: pageType == PageType.login
                                    ? PageType.signUp
                                    : PageType.login,
                              ),
                            ),
                            text1: pageType == PageType.login
                                ? "Don't have an account?"
                                : "Already have an account?",
                            text2: pageType == PageType.login
                                ? "Sign Up"
                                : "Login",
                          ),
                          const SizedBox(height: 25),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
