import 'package:flutter/material.dart';
import 'package:quiz_study_app/configs/themes/app_icon.dart';
import 'package:quiz_study_app/configs/themes/custul_text_style.dart';
import 'package:quiz_study_app/configs/themes/ui_parameters.dart';
import 'package:quiz_study_app/widgets/app_circle_button.dart';

class CustumAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustumAppBar({
    super.key,
    this.title = "",
    this.titleWidget,
    this.leading,
    this.showActionIcon = false,
    this.onMenuActionTap,
  });
  final String title;
  final Widget? titleWidget;
  final Widget? leading;
  final bool showActionIcon;
  final VoidCallback? onMenuActionTap;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: mobileScreenPadding, vertical: mobileScreenPadding),
        child: Stack(
          children: [
            Positioned.fill(
              child: titleWidget == null
                  ? const Center(
                      child: Text("title", style: appBarText),
                    )
                  : Center(
                      child: titleWidget,
                    ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                leading ??
                    Transform.translate(
                      offset: const Offset(-14, 0),
                      child: const BackButton(),
                    ),
                if (showActionIcon)
                  Transform.translate(
                    offset: const Offset(10, 0),
                    child: AppCircleButton(
                      child: Icon(
                        AppIcons.menuLeft,
                      ),
                      ontap: onMenuActionTap ?? null,
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => new Size(double.maxFinite, 80);
}
