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
            Container(
              decoration: const BoxDecoration(
                color: Color.fromRGBO(242, 135, 5, 1),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.30,
              child: Text('Günün Menüsü'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    child: const Center(child: Text('Reklamsssss')),
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(242, 135, 5, 1),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  const SizedBox(height: 20),
                  AppForm.AppTextFormField(
                    hintText: 'Yemek ara...',
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
                            print(isSwitched);
                          });
                        },
                        activeTrackColor: Colors.orangeAccent,
                        activeColor: Color.fromRGBO(242, 125, 5, 1),
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
