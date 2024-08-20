import 'package:cached_network_image/cached_network_image.dart';
import 'package:catbreeds_app/src/models/breed_model/breed_model.dart';
import 'package:catbreeds_app/src/services/api_service.dart';
import 'package:flutter/material.dart';

class BreedInformationWidget extends StatelessWidget {
  final BreedModel model;

  const BreedInformationWidget(
    this.model, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      color: const Color.fromARGB(255, 226, 214, 247),
      margin: const EdgeInsets.all(10),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(model.name ?? "--"),
                TextButton(
                  onPressed: () {},
                  child: const Text("Más..."),
                )
              ],
            ),
            futureImageBreedWidget(size),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(model.origin ?? "--"),
                Text("${model.intelligence ?? '--'}"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget futureImageBreedWidget(Size size) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder(
        future: ApiService().getBreedImageUrl(model.id ?? ""),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SizedBox(
                width: size.width * 0.1,
                child: const CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              return CachedNetworkImage(
                imageUrl: snapshot.data ?? "",
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    SizedBox(
                  width: size.width * 0.1,
                  child: CircularProgressIndicator(
                      value: downloadProgress.progress),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              );
            } else {
              return const Text("Ocurrió un error");
            }
          }
        },
      ),
    );
  }
}
