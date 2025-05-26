import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/core/app_color.dart';
import 'package:market/core/components/function/AppBar.dart';
import 'package:market/views/auth/logic/cubit/authentication_cubit.dart';
import 'package:market/views/auth/ui/widget/custom_material_button.dart';
import 'package:market/views/auth/ui/widget/customformfield.dart';

class ForgetView extends StatefulWidget {
  ForgetView({Key? key}) : super(key: key);

  @override
  State<ForgetView> createState() => _ForgetViewState();
}

class _ForgetViewState extends State<ForgetView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocConsumer<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is PasswordResetSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Password reset email sent")),
            );
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: buildCustomAppBar(context, "Forgot Password"),
            body:
                state is PasswordResetLoading
                    ? Center(child: CircularProgressIndicator())
                    : SafeArea(
                      child: ListView(
                        children: [
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(height: 75),
                                Container(
                                  margin: EdgeInsets.all(20),
                                  child: Text(
                                    "Enter Your Email To Reset Password",
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.kBlackColor,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColor.kScaffoldColor,
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Container(
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
                                            keybordType:
                                                TextInputType.emailAddress,
                                            hintText: "Email",
                                            labelText: "Email",
                                          ),
                                        ),
                                        SizedBox(height: 15),
                                        Container(
                                          margin: EdgeInsets.all(20),
                                          child: Custom_Material_Button(
                                            text: "Send",
                                            onPressed: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                context
                                                    .read<AuthenticationCubit>()
                                                    .resetPassword(
                                                      email:
                                                          _emailController.text,
                                                    );
                                              }
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
