import 'package:flutter/material.dart';
import 'package:spacex/models/launch.dart';

class LaunchPage extends StatelessWidget {
  const LaunchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final launch = ModalRoute.of(context)!.settings.arguments as Launch;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(launch.name),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${launch.dateLocal.year}-${launch.dateLocal.month}-${launch.dateLocal.day}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "${launch.flightNumber}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInImage(
                    width: size.width * 0.5,
                    fit: BoxFit.cover,
                    placeholder: const AssetImage("assets/jar-loading.gif"),
                    image: NetworkImage((launch.links.patch.small != null)
                        ? launch.links.patch.small!
                        : "https://via.placeholder.com/300.png/09f/fff"),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      "Detalles de lanzamiento: ${(launch.details != null) ? launch.details! : "without details"}",
                      style: const TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
