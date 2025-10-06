import 'package:flutter/material.dart';

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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
