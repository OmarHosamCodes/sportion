import 'package:sportion/library.dart';

class CustomPopups extends ConsumerWidget {
  const CustomPopups.dialog({
    super.key,
    this.title,
    this.content,
    this.dialogType = DialogType.info,
  })  : message = null,
        snackBarType = null,
        popupType = PopupType.dialog,
        onConfirm = null;

  const CustomPopups.loadingDialog({
    super.key,
  })  : title = null,
        content = null,
        message = null,
        dialogType = null,
        snackBarType = null,
        popupType = PopupType.loadingDialog,
        onConfirm = null;

  const CustomPopups.loadingIndicator({
    super.key,
  })  : title = null,
        content = null,
        message = null,
        dialogType = null,
        snackBarType = null,
        popupType = PopupType.loadingIndicator,
        onConfirm = null;

  const CustomPopups.snackBar({
    super.key,
    this.message,
    this.snackBarType = SnackBarType.info,
  })  : title = null,
        content = null,
        dialogType = null,
        popupType = PopupType.snackBar,
        onConfirm = null;

  const CustomPopups.confirmationDialog({
    super.key,
    this.title,
    this.content,
    this.onConfirm,
  })  : message = null,
        dialogType = null,
        snackBarType = null,
        popupType = PopupType.confirmationDialog;

// Dialog

  final String? title;
  final String? content;
  final DialogType? dialogType;

// SnackBar

  final String? message;
  final SnackBarType? snackBarType;

// Popup
  final PopupType? popupType;

// Confirmation Dialog
  final void Function()? onConfirm;

  @override
  Widget build(BuildContext context, ref) {
    return switch (popupType!) {
      PopupType.dialog => _buildDialog(),
      PopupType.snackBar => _buildSnackBar(),
      PopupType.loadingDialog => _buildLoadingDialog(),
      PopupType.loadingIndicator => _buildLoadingIndicator(),
      PopupType.confirmationDialog => _buildConfirmationDialog(),
    };
  }

  Widget _buildDialog() {
    return AlertDialog(
      backgroundColor: switch (dialogType!) {
        DialogType.success => Colors.green,
        DialogType.error => Colors.red,
        DialogType.warning => Colors.deepOrange,
        DialogType.info => RoutingRepository.context.theme.colorScheme.primary,
        DialogType.question =>
          RoutingRepository.context.theme.colorScheme.primary,
      },
      title: CustomText(
        text: title!,
      ),
      content: CustomText(
        text: content!,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            RoutingRepository.context.pop();
          },
          child: const CustomText(
            text: 'OK',
          ),
        ),
      ],
    );
  }

  Widget _buildSnackBar() {
    return SnackBar(
      content: CustomText(
        text: message!,
      ),
      backgroundColor: switch (snackBarType!) {
        SnackBarType.success => Colors.green,
        SnackBarType.error => Colors.red,
        SnackBarType.warning => Colors.orange,
        SnackBarType.info => Colors.blue,
      },
    );
  }

  Widget _buildLoadingDialog() {
    return const AlertDialog(
        content: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        CircularProgressIndicator(),
        SizedBox(height: 10),
        CustomText(
          text: 'Please wait...',
        ),
      ],
    ));
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildConfirmationDialog() {
    return AlertDialog(
      title: CustomText(
        text: title!,
      ),
      content: CustomText(
        text: content!,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            RoutingRepository.context.pop();
          },
          child: const CustomText(
            text: 'Cancel',
          ),
        ),
        TextButton(
          onPressed: () {
            RoutingRepository.context.pop();
            onConfirm!();
          },
          child: const CustomText(
            text: 'OK',
          ),
        ),
      ],
    );
  }

  static void show(
    CustomPopups customPopup,
  ) {
    switch (customPopup.popupType!) {
      case PopupType.dialog:
        showDialog<void>(
          context: RoutingRepository.context,
          builder: (BuildContext context) {
            return customPopup;
          },
        );
      case PopupType.loadingDialog:
        showDialog<void>(
          context: RoutingRepository.context,
          builder: (context) {
            return customPopup;
          },
        );
      case PopupType.snackBar:
        ScaffoldMessenger.of(RoutingRepository.context)
            .showSnackBar(customPopup as SnackBar);
      case PopupType.loadingIndicator:
        showDialog<void>(
          context: RoutingRepository.context,
          builder: (context) {
            return customPopup;
          },
        );
      case PopupType.confirmationDialog:
        showDialog<void>(
          context: RoutingRepository.context,
          builder: (BuildContext context) {
            return customPopup;
          },
        );
    }
  }
}

enum DialogType {
  success,
  error,
  warning,
  info,
  question,
}

enum SnackBarType {
  success,
  error,
  warning,
  info,
}

enum PopupType {
  dialog,
  loadingDialog,
  snackBar,
  loadingIndicator,
  confirmationDialog,
}
