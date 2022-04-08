import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:yapye_mobile_app/constants.dart';

import '../widgets/app_cards.dart';
import '../widgets/app_form.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  final Stream<QuerySnapshot> _foodsStream =
      FirebaseFirestore.instance.collection('foods').snapshots();
  TextEditingController searchController = TextEditingController();
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            GestureDetector(
              onTap: () {},
              child: Card(
                margin: EdgeInsets.zero,
                elevation: 5,
                shadowColor: AppColors.dark,
                clipBehavior: Clip.antiAlias,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Stack(
                  children: [
                    Image.network(
                      "https://images.unsplash.com/photo-1512152272829-e3139592d56f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80",
                      width: double.infinity,
                      height: 280,
                      fit: BoxFit.cover,
                    ),
                    Positioned.fill(
                      child: Align(
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment(.2, 1.5),
                              colors: [
                                AppColors.orange,
                                Colors.black12,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      top: 20,
                      left: 20,
                      child: Text(
                        " Günün\nMenüsü",
                        style: TextStyle(
                          fontSize: 30,
                          color: AppColors.light,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: AppColors.orangeAccent,
                              offset: Offset(0, 2),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  AppCards.homeAdsCard(
                    "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Zm9vZHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=600&q=60",
                    "Kayseri Doydum'da %50 indirim",
                  ),
                  const SizedBox(height: 20),
                  AppForm.appSearchField(
                    hintText: isSwitched
                        ? "Malzeme ismi ile ara..."
                        : "Yemek ismi ile ara...",
                    controller: searchController,
                    onSaved: (hello) => {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'yemek İsmi',
                        style: TextStyle(
                          color: AppColors.dark.withOpacity(.4),
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                          });
                        },
                        activeTrackColor: Colors.orangeAccent,
                        activeColor: AppColors.orange,
                      ),
                      Text(
                        'malzeme İsmi',
                        style: TextStyle(
                          color: AppColors.dark.withOpacity(.4),
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        AppCards.homeCategoryCard('Kurufasulye'),
                        AppCards.homeCategoryCard('Urfa Kebabı'),
                        AppCards.homeCategoryCard('Mercimek Çorbası'),
                        AppCards.homeCategoryCard('İmambayıldı'),
                        AppCards.homeCategoryCard('Adana Kebabı'),
                        AppCards.homeCategoryCard('Karnıyarık'),
                        AppCards.homeCategoryCard('İncik'),
                        AppCards.homeCategoryCard('Dalyan Köfte'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  StreamBuilder<QuerySnapshot>(
                    stream: _foodsStream,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text("Loading");
                      }
                      return Column(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> food =
                              document.data()! as Map<String, dynamic>;
                          return AppCards.homeFoodCard(food, context);
                        }).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
