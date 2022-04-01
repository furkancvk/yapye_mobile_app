import 'package:flutter/material.dart';

import '../constants.dart';

class Recipe extends StatelessWidget {
  const Recipe({Key? key, Map? this.food}) : super(key: key);
  final food;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.light,
        body: ListView(
          children: [
            Stack(
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  width: MediaQuery.of(context).size.width,
                  height: 440,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Image.network(
                    food['image'],
                    fit: BoxFit.cover,
                  ),
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
                          begin: Alignment.topCenter,
                          end: Alignment(0, 3),
                          colors: [
                            AppColors.dark,
                            Colors.black12,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  left: 5,
                  right: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_rounded, color: AppColors.light),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.share_rounded, color: AppColors.light),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 20,
                  right: 20,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        food['title'],
                        style: const TextStyle(
                          color: AppColors.light,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        "Nasıl yapılır?",
                        style: TextStyle(
                          color: AppColors.light,
                          fontSize: 18,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(Icons.favorite_border_rounded,
                          color: AppColors.light),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: const [
                          CircleAvatar(),
                          SizedBox(width: 10),
                          Text(
                            "Mehmet Doymuş",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: const [
                          Icon(Icons.star_border_rounded),
                          Icon(Icons.star_border_rounded),
                          Icon(Icons.star_border_rounded),
                          Icon(Icons.star_border_rounded),
                          Icon(Icons.star_border_rounded)
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Malzemeler",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () => {},
                        child: Row(
                          children: const [
                            Text(
                              "5 Kişilik",
                              style: TextStyle(
                                color: AppColors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(Icons.keyboard_arrow_down_rounded,
                                color: AppColors.orange)
                          ],
                        ),
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          side: const BorderSide(
                            color: AppColors.orange,
                            width: 3,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "- istediğiniz türden kemikli tavuk (kalçalı but, kanat vs.)",
                          style: TextStyle(
                            fontSize: 17,
                            color: Color.fromRGBO(13, 13, 13, .6),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "- istediğiniz türden kemikli tavuk (kalçalı but, kanat vs.)",
                          style: TextStyle(
                            fontSize: 17,
                            color: Color.fromRGBO(13, 13, 13, .6),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "- istediğiniz türden kemikli tavuk (kalçalı but, kanat vs.)",
                          style: TextStyle(
                            fontSize: 17,
                            color: Color.fromRGBO(13, 13, 13, .6),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          "- istediğiniz türden kemikli tavuk (kalçalı but, kanat vs.)",
                          style: TextStyle(
                            fontSize: 17,
                            color: Color.fromRGBO(13, 13, 13, .6),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  const Text(
                    "Tarif",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Tavuklar i̇yi̇ce yıkanıp suyu süzüldükten sonra deri̇n bir kaba alınır. Üzerine yağ ve baharatlar i̇lave edilerek iyice harmanlanır. 1 saat buzdolabında dinlendirdikten sonra 1 yemek kaşığı kızgın yağda kızartılır. Sıcak servis edilir.",
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromRGBO(13, 13, 13, .6),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "Yapılış Videosu",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        width: MediaQuery.of(context).size.width,
                        height: 190,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.network(
                          "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.orange.withOpacity(.5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.play_circle_outline_rounded,
                            size: 50,
                            color: AppColors.light,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "Yorumlar",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
