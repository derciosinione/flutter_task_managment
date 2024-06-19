import 'package:flutter/material.dart';
import 'package:im_task_managment/shared/toast_message.dart';

import '../utils/default_messages.dart';

void timeOutTostMessage(BuildContext context) {
  ToastMessage.showDismissed(
      context, timeOutTitle, timeOutMessage, Colors.red, () {});
}
