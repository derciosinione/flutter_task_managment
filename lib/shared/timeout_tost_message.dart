import 'package:flutter/material.dart';
import 'package:wb/shared/components/toast_message.dart';

import '../../default_messages.dart';

void timeOutTostMessage(BuildContext context) {
  ToastMessage.showDismissed(
      context, timeOutTitle, timeOutMessage, Colors.red, () {});
}
