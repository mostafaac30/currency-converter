import 'package:flutter/material.dart';
import 'package:m_toast/m_toast.dart';

ShowMToast toast = ShowMToast();

void showErrorToast(BuildContext context,
    {String message = 'error', double width = double.infinity}) {
  toast.errorToast(
    context,
    message: message,
    alignment: Alignment.bottomCenter,
  );
}

void showSuccessToast(BuildContext context,
    {String message = 'success', double width = double.infinity}) {
  toast.successToast(
    context,
    message: message,
    alignment: Alignment.bottomCenter,
  );
}
