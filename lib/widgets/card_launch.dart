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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: Card(
        child: SizedBox(
          height: size.height * 0.3,
          // color: Colors.red,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
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

              SizedBox(
                width: size.width * 0.6,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            name,
                            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Fecha de lanzamiento: $dateLaunch",
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            "Detalles de lanzamiento: ${details.length > 60 ? details.substring(0, 60) + '...' : details}",
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Número de vuelo: $flightNumber",
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
