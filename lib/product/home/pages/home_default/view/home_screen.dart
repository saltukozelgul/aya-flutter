import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aya_project/feature/components/default_tab_controller/default_tab_controller.dart';
import '../../../../../core/constants/other/colors.dart';
import '../../../../../feature/components/default_tab_controller/tab.dart';
import '../cubit/home_cubit.dart';
import '../service/home_repository.dart';
import '../states/home_states.dart';
import 'package:map/map.dart';
import 'package:latlng/latlng.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepositoryImpl()),
      child: _buildScaffold(context),
    );
  }

  BlocConsumer _buildScaffold(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,

          //single child scroll view kullanıldı çünkü ekran küçük olduğunda hata veriyordu, overflow oluyordu
          body: SafeArea(
            //single child scroll view kullanıldı çünkü ekran küçük olduğunda hata veriyordu, overflow oluyordu
            //eklenerek çözüldü. ayrıca scrollu engelliyordu, o da physics ile listvies içerisinde düzeltildi.
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        // isim kısmı olsa mı bilemedim açıkçası

                        // Text("Aya",
                        //     style: Theme.of(context)
                        //         .textTheme
                        //         .bodyMedium
                        //         ?.copyWith(fontSize: 20)),
                        // IconButton(
                        //   onPressed: () => print("filtreleme"),
                        //   icon: const Icon(Icons.help_center_outlined),
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Arama",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontSize: 18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                    child: DefaultTabController(
                      length: 100,
                      child: TabBar(
                        indicatorColor: colorPrimary,
                        labelColor: colorPrimary,
                        unselectedLabelColor: colorDisable,
                        tabs: [
                          //kategoriler listesi
                          //ama boyle tek tek tiklanmiyor sanirim, nasil cozeriz bilemedim burada saliyorm.
                          SizedBox(
                            height: 30,
                            width: MediaQuery.of(context).size.width * 0.99,
                            child: ListView.builder(
                              itemBuilder: (context, index) =>
                                  _kategoriler(context, _Strings.tagler[index]),
                              itemCount: 10,
                              scrollDirection: Axis.horizontal,
                            ),
                          ),
                        ],
                      ),
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
          floatingActionButton: FloatingActionButton(
            //ilan ekleme tuşu
            onPressed: () => print("Ekleme Butonu"),
            backgroundColor: colorPrimaryTint20,
            child: const Text("+",
                style: TextStyle(fontSize: 40, color: colorWhite)),
          ),
        );
      },
    );
  }

  Container _Ilan(BuildContext context, int index) => Container(
        height: 250,
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
              //ilan sahibi kısmı
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 5),
              child: Text("Seda Nur Taşkan",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 20,
                      )),
            ),
            Padding(
              //ilan açıklaması kısmı
              padding: const EdgeInsets.only(left: 15.0, right: 10, top: 5),
              child: Text(
                  "Battaniye lazım bana hemen seri Battaniye lazım bana hemen seri lazım bana hemen seri Battaniye lazım bana hemen seri Battaniye lazım bana hemen seri",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 18, color: colorDisable)),
            ),
            Padding(
              //tag ve konum kısmı
              padding: const EdgeInsets.only(left: 15.0, right: 15, top: 5),
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
            Container(
              //maps kısmı
              height: 100,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              clipBehavior: Clip.hardEdge,
              width: MediaQuery.of(context).size.width,
              child: MapLayout(
                controller: MapController(
                  location: const LatLng(0, 0),
                  zoom: 2,
                ),
                builder: (context, transformer) {
                  return TileLayer(
                    builder: (context, x, y, z) {
                      final tilesInZoom = pow(2.0, z).floor();

                      while (x < 0) {
                        x += tilesInZoom;
                      }
                      while (y < 0) {
                        y += tilesInZoom;
                      }

                      x %= tilesInZoom;
                      y %= tilesInZoom;

                      //Google Maps
                      final url =
                          'https://www.google.com/maps/vt/pb=!1m4!1m3!1i$z!2i$x!3i$y!2m3!1e0!2sm!3i420120488!3m7!2sen!5e1105!12m4!1e68!2m2!1sset!2sRoadmap!4e0!5m1!1e0!23i4111425';

                      return CachedNetworkImage(
                        imageUrl: url,
                        fit: BoxFit.cover,
                      );
                    },
                  );
                },
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

Container _kategoriler(BuildContext context, String index) => Container(
      //kategoriler için ayarlar
      padding: const EdgeInsets.all(1),
      margin: const EdgeInsets.only(right: 5),
      child: Text(index.toString(),
          style:
              Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 20)),
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
