import 'package:flutter/material.dart';
import 'package:market/core/app_color.dart';
import 'package:market/core/components/function/AppBar.dart';
import 'package:market/views/auth/ui/widget/customformfield.dart';

class EditName extends StatelessWidget {
  const EditName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Edit Name"),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            CustomTextFormField(labelText: "Edit Name", hintText: "Edit Name"),
            const SizedBox(height: 20),
            MaterialButton(
              padding: const EdgeInsets.symmetric(vertical: 10),
              color: AppColor.kPrimaryColor,
              textColor: AppColor.kWhiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),

              onPressed: () {},
              child: Text("Upgrade"),
            ),
          ],
        ),
      ),
    );
  }
}
