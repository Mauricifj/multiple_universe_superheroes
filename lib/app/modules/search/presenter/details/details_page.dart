import 'package:flutter/material.dart';
import 'package:multiple_universe_superheroes/app/modules/search/infra/models/super_hero_model.dart';

class DetailsPage extends StatelessWidget {
  final SuperHeroModel superHero;

  const DetailsPage({Key? key, required this.superHero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(superHero.codeName),
            Text("#${superHero.id.toString()}"),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildImage(width),
              _buildInfoBox(width),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage(double width) {
    return Expanded(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image(
            // width: width * 0.8,
            image: NetworkImage(superHero.image),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoBox(double width) {
    return Expanded(
      child: Container(
        width: width * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: "REAL NAME: ", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
                    TextSpan(text: superHero.name, style: TextStyle(color: Colors.black))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: "GENDER: ", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
                    TextSpan(text: superHero.gender, style: TextStyle(color: Colors.black))
                  ],
                ),
              ),
            ),
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: "OCCUPATION: ", style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
                    TextSpan(text: superHero.occupation, style: TextStyle(color: Colors.black))
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
