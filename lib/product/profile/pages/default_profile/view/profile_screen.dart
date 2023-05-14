import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aya_project/product/profile/pages/default_profile/states/profile_states.dart';
import '../cubit/profile_cubit.dart';
import '../service/profile_service.dart';
import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/other/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(ProfileServiceImpl()),
      child: _buildScaffold(context),
    );
  }

  BlocConsumer _buildScaffold(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,

          //single child scroll view kullanıldı çünkü ekran küçük olduğunda hata veriyordu, overflow oluyordu
          body: SafeArea(
            //add username and logout button
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildProfile(context),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15, top: 5, bottom: 8),
                    child: Column(
                      children: [
                        Text("Listeli İlanlarım",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontSize: 18,
                                    color: colorPrimaryDark,
                                    fontWeight: FontWeight.bold)),
                        Divider(
                            color: Theme.of(context).disabledColor,
                            thickness: 2,
                            height: 20),
                      ],
                    ),
                  ),
                  ListView.builder(
                    //physics sayesinde single child scroll view ile oluşan aşağı inememe problemi çözüldü
                    physics: const NeverScrollableScrollPhysics(),
                    //ilanlar listesi
                    shrinkWrap: true,
                    itemBuilder: (context, index) => _Ilan(context, index),
                    itemCount: 3,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Container _Ilan(BuildContext context, int index) => Container(
        height: 200,
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
        decoration: BoxDecoration(
          color: colorPrimary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              //ilan açıklaması kısmı
              padding: const EdgeInsets.only(left: 15.0, right: 10, top: 20),
              child: Text(
                  "Battaniye lazım bana hemen seri Battaniye lazım bana hemen seri lazım bana hemen seri Battaniye lazım bana hemen seri Battaniye lazım bana hemen seri",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 18, color: colorDisable)),
            ),
            Padding(
              //tag ve konum kısmı
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15, top: 5, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 30,
                    width: 150,
                    child: ListView.builder(
                      itemBuilder: (context, index) =>
                          _ilanTag(context, _Strings.tagler[index]),
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  Text("Merkez/Erzincan",
                      textAlign: TextAlign.right,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 18, color: colorDisable)),
                ],
              ),
            ),
          ],
        ),
      );

  Container _ilanTag(BuildContext context, String index) => Container(
        //tagler için ayarlar
        decoration: BoxDecoration(
          color: colorPrimaryTint20,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(right: 5),
        child: Text(index.toString(),
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontSize: 15, color: colorDisable)),
      );
}

//show username and user phone number
Container _buildProfile(BuildContext context) => Container(
      //profil kısmı
      height: 100,
      decoration: const BoxDecoration(
        color: colorLightThemeBackground,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("Seda Nur Taşkan",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 18,
                          color: colorDisable,
                          fontWeight: FontWeight.bold,
                        )),
                Row(
                  children: [
                    const Icon(Icons.call, color: colorDisable, size: 20),
                    Text("505 505 50 50",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 18,
                              color: colorDisable,
                            )),
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.location_on,
                        color: colorDisable, size: 20),
                    Text("Merkez / Erzincan",
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 18,
                              color: colorDisable,
                            )),
                  ],
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings, color: colorDisable, size: 40),
              padding: const EdgeInsets.only(bottom: 40),
            ),
          ],
        ),
      ),
    );

class _Strings {
  static const List<String> tagler = [
    //geçici olarak eklediğimiz tagler
    "barınma",
    "ısınma",
    "bebek",
    "giyim",
    "diger",
    "barınma",
    "ısınma",
    "bebek",
    "giyim",
    "diger"
  ];
}
