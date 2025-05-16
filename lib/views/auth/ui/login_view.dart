import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/core/app_color.dart';
import 'package:market/core/components/function/show_mes.dart';
import 'package:market/views/auth/logic/cubit/authentication_cubit.dart';
import 'package:market/views/auth/ui/forget_view.dart' show ForgetView;
import 'package:market/views/auth/ui/widget/customformfield.dart';
import 'package:market/views/auth/ui/signin_view.dart';
import 'package:market/views/auth/ui/widget/login_type.dart';
import 'package:market/views/nav_bar/ui/main_home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is LoginSuccess || state is GoogleSignInSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MainHomeView()),
          );
        }
        if (state is LoginError) {
          showMessage(context, state.message);
        }
      },
      builder: (context, state) {
        AuthenticationCubit cubit = context.read<AuthenticationCubit>();
        return Scaffold(
          backgroundColor: AppColor.kScaffoldColor,
          body:
              state is LoginLoding
                  ? Center(child: CircularProgressIndicator())
                  : ListView(
                    children: [
                      Form(
                        key: _formKey,
                        child: Container(
                          color: AppColor.kScaffoldColor,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 75),
                              Text(
                                "Welcom To Mo Market",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.kBlackColor,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColor.kWhiteColor,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                margin: EdgeInsets.all(35),
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    SizedBox(height: 20),
                                    Container(
                                      margin: EdgeInsets.all(20),
                                      child: CustomTextFormField(
                                        controller: _emailController,
                                        keybordType: TextInputType.emailAddress,
                                        hintText: "Email",
                                        labelText: "Email",
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(20),
                                      child: CustomTextFormField(
                                        controller: _passwordController,
                                        keybordType:
                                            TextInputType.visiblePassword,
                                        isPassword: isPasswordHidden,
                                        hintText: "Password",
                                        labelText: "Password",
                                        suffixIcon: IconButton(
                                          onPressed: () {},
                                          icon: IconButton(
                                            onPressed: () {
                                              setState(() {
                                                isPasswordHidden =
                                                    !isPasswordHidden;
                                              });
                                            },
                                            icon: Icon(
                                              isPasswordHidden
                                                  ? Icons.visibility_off
                                                  : Icons.visibility,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => ForgetView(),
                                          ),
                                        );
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            textAlign: TextAlign.end,
                                            "Forget Password?",
                                            style: TextStyle(
                                              color: AppColor.kPrimaryColor,
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 25),
                                    LoginType(
                                      text: "Login",
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          cubit.login(
                                            email: _emailController.text,
                                            password: _passwordController.text,
                                          );
                                        }
                                      },
                                    ),
                                    SizedBox(height: 20),
                                    LoginType(
                                      text: "Login With Google",
                                      onPressed: () {
                                        cubit.googleSignIn();
                                      },
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Don't have an account?",
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: AppColor.kBlackColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Signup(),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            "Sign Up",
                                            style: TextStyle(
                                              color: AppColor.kPrimaryColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
        );
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
