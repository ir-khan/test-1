import 'package:flutter/material.dart';

import '../../../../constants/sizes.dart';
import '../../../../theme/colors.dart';

class StudentCard extends StatelessWidget {
  const StudentCard({
    super.key,
    required this.name,
    required this.onTap,
    required this.onEditTap,
    required this.onDeleteTap,
  });

  final String name;
  final VoidCallback onTap;
  final VoidCallback onEditTap;
  final VoidCallback onDeleteTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      visualDensity: VisualDensity.compact,
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      onTap: onTap,
      leading: CircleAvatar(
        backgroundImage: NetworkImage(
          'https://media.istockphoto.com/id/814423752/photo/eye-of-model-with-colorful-art-make-up-close-up.jpg?s=612x612&w=0&k=20&c=l15OdMWjgCKycMMShP8UK94ELVlEGvt7GmB_esHWPYE=',
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: kRadius10),
      title: Text(name, style: textTheme.bodySmall),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.edit_rounded),
            color: AppColors.green,
            onPressed: onEditTap,
          ),
          IconButton(
            icon: Icon(Icons.delete_rounded),
            color: AppColors.red,
            onPressed: onDeleteTap,
          ),
        ],
      ),
    );
  }
}
