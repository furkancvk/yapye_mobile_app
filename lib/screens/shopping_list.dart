import 'package:flutter/material.dart';

import '../widgets/app_cards.dart';
import '../widgets/app_form.dart';

class ShoppingList extends StatefulWidget {
  const ShoppingList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ShoppingList();
  }
}

class _ShoppingList extends State<ShoppingList> {
  bool isSwitched = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void onSavedAppTextFormField(String? newValue) {
      print("Aranan Yemek:  " + searchController.text);
    }

    void dispose() {
      searchController.dispose();
      super.dispose();
    }

    return SafeArea(
        child: Scaffold(
            body: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              AppForm.AppTextFormField(
                hintText: 'Yemeğe göre malzeme ara...',
                controller: searchController,
                onSaved: onSavedAppTextFormField,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'yemek ismi',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: Color.fromRGBO(13, 13, 13, 0.4),
                    ),
                  ),
                  Switch(
                      activeColor: Color.fromRGBO(242, 135, 5, 1),
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          print("31");
                        });
                      }),
                  Text(
                    'malzeme ismi',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: Color.fromRGBO(13, 13, 13, 0.4),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppForm.AppTextButtonIcon(
                          icon: Icon(Icons.add, color: Colors.orange),
                          label: 'Domates',
                          onPressed: () => print('31')),
                      AppForm.AppTextButtonIcon(
                          icon: Icon(Icons.add, color: Colors.orange),
                          label: 'Patates',
                          onPressed: () => print('31')),
                      AppForm.AppTextButtonIcon(
                          icon: Icon(Icons.add, color: Colors.orange),
                          label: 'Süt 1L',
                          onPressed: () => print('31')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppForm.AppTextButtonIcon(
                          icon: Icon(Icons.add, color: Colors.orange),
                          label: 'Patlıcan',
                          onPressed: () => print('31')),
                      AppForm.AppTextButtonIcon(
                          icon: Icon(Icons.add, color: Colors.orange),
                          label: 'Su 5L',
                          onPressed: () => print('31')),
                      AppForm.AppTextButtonIcon(
                          icon: Icon(Icons.add, color: Colors.orange),
                          label: 'Yeşil Biber',
                          onPressed: () => print('31')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppForm.AppTextButtonIcon(
                          icon: Icon(Icons.add, color: Colors.orange),
                          label: 'Maydanoz',
                          onPressed: () => print('31')),
                      AppForm.AppTextButtonIcon(
                          icon: Icon(Icons.add, color: Colors.orange),
                          label: 'Toz Şeker',
                          onPressed: () => print('31')),
                      AppForm.AppTextButtonIcon(
                          icon: Icon(Icons.add, color: Colors.orange),
                          label: 'Un',
                          onPressed: () => print('31')),
                    ],
                  ),
                ],
              ),
              AppCards.ShoppingListCard(
                name: "Domates",
                type: "Sebze",
                price: "10 TL",
                market: "BİM",
                image: "https://tariflerleyemekler.com/yemek/barbeku-soslu-tavuk.webp"
              ),
              AppCards.ShoppingListCard(
                  name: "Domates",
                  type: "Sebze",
                  price: "10 TL",
                  market: "BİM",
                  image: "https://tariflerleyemekler.com/yemek/barbeku-soslu-tavuk.webp"
              ),
              AppCards.ShoppingListCard(
                  name: "Domates",
                  type: "Sebze",
                  price: "10 TL",
                  market: "BİM",
                  image: "https://tariflerleyemekler.com/yemek/barbeku-soslu-tavuk.webp"
              ),
              AppCards.ShoppingListCard(
                  name: "Domates",
                  type: "Sebze",
                  price: "10 TL",
                  market: "BİM",
                  image: "https://tariflerleyemekler.com/yemek/barbeku-soslu-tavuk.webp"
              ),
              AppCards.ShoppingListCard(
                  name: "Domates",
                  type: "Sebze",
                  price: "10 TL",
                  market: "BİM",
                  image: "https://tariflerleyemekler.com/yemek/barbeku-soslu-tavuk.webp"
              ),
            ],
          ),
        ),
      ],
    )));
  }
}
