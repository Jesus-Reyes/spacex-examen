import 'package:flutter/material.dart';
import 'package:spacex/models/launch.dart';
import 'package:spacex/services/lauch_data.dart';
import 'package:spacex/services/spaceX.dart';
import 'package:spacex/widgets/card_launch.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final streamData = LauchData();
  final spacex = SpaceX();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: StreamBuilder<List<Launch>>(
        stream: streamData.streamLaunch.stream,
        builder: (_, asyncSnapshot) {
          if (!asyncSnapshot.hasData) {
            return FutureBuilder<List<Launch>>(
              future: spacex.getData(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator(
                    color: Colors.red,
                  );
                }
                final data = snapshot.data!;
                streamData.streamLaunch.add(data);
                return Container();
              },
            );
          }
          final data = asyncSnapshot.data!;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final launch = data[index];
              return CardLaunch(
                name: launch.name,
                urlImage: (launch.links.patch.small != null) ? launch.links.patch.small! : launch.links.patch.large!,
                dateLaunch: "${launch.dateLocal.year}-${launch.dateLocal.month}-${launch.dateLocal.day}",
                details: (launch.details != null) ? launch.details! : "without details"  ,
                flightNumber: launch.flightNumber,
              );
              // return Card(
              //   child: ListTile(
              //     leading: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,

              //       children: [
              //         Container(
              //           color: Colors.red,
              //           child: FadeInImage(
              //             // height: 100,
              //             width: size.width * 0.15,
              //             fit: BoxFit.cover,
              //             placeholder: const AssetImage("assets/jar-loading.gif"),
              //             image: NetworkImage(
              //               (launch.links.patch.small != null) ? launch.links.patch.small! : launch.links.patch.large!,
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //     title: Text(launch.name),
              //     subtitle: Column(
              //       children: [
              //         Text("Fecha de Lanzamiento: ${launch.dateLocal.toLocal()}"),
              //         Text("Detalled del lanzamiento: ${launch.details}"),
              //       ],
              //     ),
              //   ),
              // );
            },
          );
        },
      ),
    );
  }
}
