import 'package:flutter/material.dart';
import '../../../core/constants/other/colors.dart';

// keeps all snackbars in one place for easy access
class CustomSnackbars {
  // call it if you want to show a success snackbar
  SnackBar snackBarSuccess(BuildContext context, String message) {
    FocusManager.instance.primaryFocus?.unfocus();
    return SnackBar(
      content: Text(message, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: colorWhite)),
      backgroundColor: Colors.green,
    );
  }

  SnackBar topSnackBar(BuildContext context, String message, String type) {
    FocusManager.instance.primaryFocus?.unfocus();
    return SnackBar(
      margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.8),
      behavior: SnackBarBehavior.floating,
      content: Text(message, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: colorWhite)),
      backgroundColor: type == 'success' ? Colors.green : colorRed,
    );
  }

  // call it if you want to show an error snackbar
  SnackBar snackBarError(BuildContext context, String message) {
    FocusManager.instance.primaryFocus?.unfocus();
    return SnackBar(
      content: Text(message, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: colorWhite)),
      backgroundColor: colorRed,
    );
  }

  SnackBar snackBarLoading(BuildContext context) {
    return const SnackBar(content: Center(child: CircularProgressIndicator()), backgroundColor: colorTransparent);
  }

  // loading snackbar with circular progress indicator
  SnackBar snackBarCircularIndicator(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    return SnackBar(
      backgroundColor: colorWhite,
      content: Center(
        widthFactor: MediaQuery.of(context).size.width,
        heightFactor: MediaQuery.of(context).size.height,
        child: const CircularProgressIndicator(),
      ),
    );
  }

  SnackBar snackBarYesNo(BuildContext context, Function fun, String? funAttr) {
    String areYouSure = 'Listeyi silmek istediginizden emin misiniz?';
    String yes = 'Evet';
    String no = 'Hayır';

    return SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(areYouSure, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: colorWhite)),
          Row(
            children: [
              InkWell(
                child: Text(no, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: colorWhite, fontStyle: FontStyle.normal)),
                onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
              ),
              const SizedBox(width: 10),
              InkWell(
                child: Text(yes, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: colorWhite, fontStyle: FontStyle.normal)),
                onTap: () {
                  fun(funAttr);
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              ),
            ],
          ),
        ],
      ),
      backgroundColor: colorRed,
    );
  }
}
