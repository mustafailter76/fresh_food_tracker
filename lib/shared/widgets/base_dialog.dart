import 'package:flutter/material.dart';

class BaseDialog extends StatelessWidget {
  const BaseDialog({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.cancelButtonTitle,
    required this.confirmButtonTitle,
    this.onCancel,
    this.onConfirm,
    this.confirmButtonStyle,
    this.cancelButtonStyle,
  });

  final Widget icon;
  final String title;
  final String description;
  final String cancelButtonTitle;
  final String confirmButtonTitle;
  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;
  final ButtonStyle? confirmButtonStyle;
  final ButtonStyle? cancelButtonStyle;

  static Future<bool?> show({
    required BuildContext context,
    required Widget icon,
    required String title,
    required String description,
    required String cancelButtonTitle,
    required String confirmButtonTitle,
    VoidCallback? onCancel,
    VoidCallback? onConfirm,
    ButtonStyle? confirmButtonStyle,
    ButtonStyle? cancelButtonStyle,
    bool barrierDismissible = true,
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (_) => BaseDialog(
        icon: icon,
        title: title,
        description: description,
        cancelButtonTitle: cancelButtonTitle,
        confirmButtonTitle: confirmButtonTitle,
        onCancel: onCancel,
        onConfirm: onConfirm,
        confirmButtonStyle: confirmButtonStyle,
        cancelButtonStyle: cancelButtonStyle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return AlertDialog(
      icon: icon,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: textTheme.titleLarge,
      ),
      content: Text(
        description,
        textAlign: TextAlign.center,
        style: textTheme.bodyMedium,
      ),
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
      actions: [
        TextButton(
          style:
              cancelButtonStyle ??
              TextButton.styleFrom(
                foregroundColor: colorScheme.onSurface.withValues(alpha: 0.72),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
                textStyle: textTheme.labelLarge,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
          onPressed: () {
            Navigator.of(context).pop(false);
            onCancel?.call();
          },
          child: Text(cancelButtonTitle),
        ),
        ElevatedButton(
          style:
              confirmButtonStyle ??
              theme.elevatedButtonTheme.style?.copyWith(
                textStyle: WidgetStatePropertyAll(textTheme.labelLarge),
              ),
          onPressed: () {
            Navigator.of(context).pop(true);
            onConfirm?.call();
          },
          child: Text(confirmButtonTitle),
        ),
      ],
      backgroundColor: theme.dialogTheme.backgroundColor,
      surfaceTintColor: theme.dialogTheme.surfaceTintColor,
      shape: theme.dialogTheme.shape,
    );
  }
}
