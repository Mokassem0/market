import 'package:flutter/material.dart';
import 'package:market/product/ui/widget/user_comment.dart';

class CommentList extends StatelessWidget {
  const CommentList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => UserComment(),
      separatorBuilder: (context, index) => Divider(),
      itemCount: 10,
    );
  }
}
