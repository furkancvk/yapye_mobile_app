import 'package:flutter/material.dart';

import '../constants.dart';
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
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            AppForm.appSearchField(
              hintText: isSwitched
                  ? "Malzeme ismi ile ara..."
                  : "Yemek ismi ile ara...",
              controller: _searchController,
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
            const SizedBox(height: 20),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppCards.shoppingListChip("Domates", false),
                    AppCards.shoppingListChip("Patates", true),
                    AppCards.shoppingListChip("Süt 1L", false),
                    AppCards.shoppingListChip("Salata", false),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppCards.shoppingListChip("Patlıcan", true),
                    AppCards.shoppingListChip("Su 5L", false),
                    AppCards.shoppingListChip("Yeşil Biber", false),
                    AppCards.shoppingListChip("Tereyağ", false),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppCards.shoppingListChip("Maydanoz", true),
                    AppCards.shoppingListChip("Toz Şeker 1kg", false),
                    AppCards.shoppingListChip("Un 5kg", false),
                    AppCards.shoppingListChip("Bal", false),
                  ],
                ),
              ],
            ),
            AppCards.shoppingListCard(
              name: "Patates",
              type: "Sebze",
              price: "15 TL",
              market: "ŞOK",
              image:
                  "https://images.pexels.com/photos/7774212/pexels-photo-7774212.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
            ),
            AppCards.shoppingListCard(
              name: "Patlıcan",
              type: "Sebze",
              price: "6 TL",
              market: "BİM",
              image:
                  "https://images.pexels.com/photos/5529605/pexels-photo-5529605.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940",
            ),
            AppCards.shoppingListCard(
              name: "Maydanoz",
              type: "Sebze",
              price: "6 TL",
              market: "Şehzade",
              image:
                  "https://images.pexels.com/photos/1275204/pexels-photo-1275204.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
            ),
            AppCards.shoppingListCard(
              name: "Domates",
              type: "Sebze",
              price: "10 TL",
              market: "BİM",
              image:
                  "https://images.pexels.com/photos/5945657/pexels-photo-5945657.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
            ),
          ],
        ),
      ),
    );
  }
}
