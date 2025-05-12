import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/core/app_color.dart';
import 'package:market/core/components/function/show_mes.dart';
import 'package:market/views/auth/logic/cubit/authentication_cubit.dart';
import 'package:market/views/auth/ui/login_view.dart';
import 'package:market/views/auth/ui/widget/customformfield.dart';
import 'package:market/views/auth/ui/widget/login_type.dart';
import 'package:market/views/nav_bar/ui/main_home_view.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainHomeView(),
            ),
          );
        }
        if (state is SignupError) {
          showMessage(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is SignupLoding) {
          return Center(child: CircularProgressIndicator());
        }
        return Scaffold(
          backgroundColor: AppColor.kScaffoldColor,
          body:
              state is SignupLoding
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
                                        controller: _nameController,
                                        keybordType: TextInputType.name,
                                        hintText: "Name",
                                        labelText: "Name",
                                      ),
                                    ),
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
                                        isPassword: true,
                                        hintText: "Password",
                                        labelText: "Password",
                                        suffixIcon: IconButton(
                                          onPressed: () {},
                                          icon: IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.visibility_off),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 25),
                                    LoginType(
                                      text: "Sign up",
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          context
                                              .read<AuthenticationCubit>()
                                              .register(
                                                name: _nameController.text,
                                                email: _emailController.text,
                                                password:
                                                    _passwordController.text,
                                              );
                                        }
                                      },
                                    ),
                                    SizedBox(height: 20),
                                    LoginType(
                                      text: "Sign up With Google",
                                      onPressed: () {},
                                    ),
                                    SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Already have an account?",
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
                                                builder:
                                                    (context) => LoginView(),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            "Login",
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
    _nameController.dispose();
    super.dispose();
  }
}
