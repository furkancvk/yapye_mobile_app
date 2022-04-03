import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'app_cards.dart';

class ProfileRecipe extends StatelessWidget {
  final Stream<QuerySnapshot> _foodsStream =
  FirebaseFirestore.instance.collection('foods').snapshots();

  ProfileRecipe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
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
    );
  }
}

