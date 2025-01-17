import 'package:flutter/material.dart';
import 'package:tech_labs_task/generated/l10n.dart';
import 'package:tech_labs_task/src/config/theme/colors_manager.dart';

class ProfileActionWidget extends StatelessWidget {
  final Function() onEdit;
  final Function() onCancel;
  final Function() onSave;
  final bool isEditing;

  const ProfileActionWidget({
    super.key,
    required this.isEditing,
    required this.onEdit,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return isEditing
        ? Row(
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsManager.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: ColorsManager.primary,
                  width: 1,
                ),
              ),
            ),
            onPressed: () {
              onCancel();
            },
            child: Text(S.of(context).cancel,
                style: TextStyle(
                  color: ColorsManager.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              onSave();
            },
            child: Text(S.of(context).save,
                style: TextStyle(
                  color: ColorsManager.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
      ],
    )
        : ElevatedButton(
      style: Theme.of(context)
          .elevatedButtonTheme
          .style
          ?.copyWith(
        fixedSize: WidgetStateProperty.all(
          Size(
            MediaQuery.sizeOf(context).width,
            48,
          ),
        ),
      ),
      onPressed: () {
       onEdit();
      },
      child: Text(
        S.of(context).edit,
        style: TextStyle(
          color: ColorsManager.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
