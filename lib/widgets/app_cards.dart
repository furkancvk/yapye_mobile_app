import 'package:flutter/material.dart';
import 'package:yapye_mobile_app/constants.dart';
import 'package:yapye_mobile_app/screens/recipe.dart';

class AppCards {
  static Widget ShoppingListCard({
    String name = "name",
    String type = "type",
    String price = "price",
    String market = "market",
    String image = "image",
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: 5,
      shadowColor: AppColors.dark,
      margin: EdgeInsets.only(top: 30),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(image),
                      fit: BoxFit.cover,
                    ),
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            )),
                        Text(type,
                            style: const TextStyle(
                              fontSize: 13,
                            )),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(market + " | ",
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            )),
                        Text(price,
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            )),
                      ],
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Icon(Icons.close),
                SizedBox(height: 17),
                Icon(
                  Icons.radio_button_unchecked_rounded,
                  color: AppColors.orange,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget homeCategoryCard(String name) {
    return Card(
      color: AppColors.orange,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.light,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  static Widget homeFoodCard(Map food, context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Recipe(food: food);
          }),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 40),
        elevation: 5,
        shadowColor: AppColors.dark,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Stack(
          children: [
            Image.network(
              food['image'],
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            Positioned.fill(
              child: Align(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0, .35),
                      end: Alignment.topCenter,
                      colors: [
                        Colors.white,
                        Colors.white10,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food['title'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(food['subtitle']),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          Icon(Icons.star_rate_rounded),
                          Icon(Icons.star_rate_rounded),
                          Icon(Icons.star_rate_rounded),
                          Icon(Icons.star_rate_rounded),
                          Icon(Icons.star_border_rounded)
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_rounded,
                        color: AppColors.dark,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget homeAdsCard(String image, String text) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 5,
        shadowColor: AppColors.dark,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Stack(
          children: [
            Image.network(
              image,
              width: double.infinity,
              height: 140,
              fit: BoxFit.cover,
            ),
            Positioned.fill(
              child: Align(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.orange.withOpacity(.6),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 60,
              right: 25,
              bottom: 20,
              child: Text(
                text,
                style: const TextStyle(
                  color: AppColors.light,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  shadows: [
                    Shadow(
                      color: AppColors.dark,
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
    );
  }
}
