import 'package:flutter/material.dart';

class CardLaunch extends StatelessWidget {
  const CardLaunch({
    Key? key,
    required this.name,
    required this.urlImage,
    required this.dateLaunch,
    required this.details,
    required this.flightNumber,
  }) : super(key: key);

  final String name;
  final String urlImage;
  final String dateLaunch;
  final String details;
  final int flightNumber;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Card(
      child: Container(
        height: size.height * 0.28,
        color: Colors.red,
        child: Row(
          children: [
            //Image Rockets
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FadeInImage(
                    width: size.width * 0.28,
                    fit: BoxFit.cover,
                    placeholder: const AssetImage("assets/jar-loading.gif"),
                    image: NetworkImage(urlImage),
                  ),
                )
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
