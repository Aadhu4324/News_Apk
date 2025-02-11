import 'package:flutter/material.dart';

import 'package:news_api/Widgets/custom_text.dart';

class CatergoryTile extends StatelessWidget {
  final String name;
  final String imageurl;
  const CatergoryTile({super.key, required this.name, required this.imageurl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed("/categoryViewPage", arguments: name);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageurl,
                  height: 100,
                  width: 100,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(74, 0, 0, 0),
                    borderRadius: BorderRadius.circular(20)),
              ),
              Center(
                  child: CustomText(
                text: name,
                size: 15,
                color: Colors.white,
                weight: FontWeight.bold,
              ))
            ],
          ),
        ),
      ),
    );
  }
}
