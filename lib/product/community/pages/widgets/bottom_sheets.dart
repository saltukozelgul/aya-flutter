import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/other/colors.dart';
import '../../../../feature/components/bottom_sheet_divider/bottom_sheet_divider.dart';

class CustomBottomSheets {
  Future<dynamic> bottomSheetMoweetOwner(BuildContext context, String moweetId, Function deleteFun) async {
    Icon iconEdit = const Icon(Icons.edit, color: colorPrimary);
    Icon iconDelete = const Icon(Icons.delete, color: colorRed);

    String edit = 'Moweeti Düzenle';
    String delete = 'Moweeti Sil';

    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01, left: MediaQuery.of(context).size.height * 0.01),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BottomSheetDivider(),
            ListTile(leading: iconEdit, title: Text(edit), onTap: () {}),
            ListTile(
                leading: iconDelete,
                title: Text(delete),
                onTap: () {
                  deleteFun(moweetId).then((value) => context.router.pop());
                  // context.router.pop();
                  // context.read<CommunityMoweetCubit>().deleteMoweet(moweetId);
                }),
          ],
        ),
      ),
    );
  }

  Future<dynamic> bottomSheetNotMoweetOwner(BuildContext context, String userId, String communityOwnerId, String moweetId, Function deleteFun) async {
    Icon iconPersonRemove = const Icon(Icons.person_remove_alt_1);
    Icon iconReport = const Icon(Icons.report);
    Icon iconBlock = const Icon(Icons.block, color: colorRed);
    Icon iconRemove = const Icon(Icons.delete);

    String unfollow = 'Takibi Bırak';
    String report = 'Şikayet Et';
    String block = 'Kullanıcıyı Engelle';
    String remove = 'Moweeti Sil';

    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      isScrollControlled: true,
      builder: (_) => Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01, left: MediaQuery.of(context).size.height * 0.01),
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          children: [
            const BottomSheetDivider(),
            ListTile(leading: iconPersonRemove, title: Text(unfollow), onTap: () {}),
            ListTile(leading: iconReport, title: Text(report), onTap: () {}),
            ListTile(leading: iconBlock, title: Text(block), onTap: () {}),
            userId == communityOwnerId
                ? ListTile(leading: iconRemove, title: Text(remove), onTap: () => deleteFun(moweetId).then((value) => context.router.pop()))
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
