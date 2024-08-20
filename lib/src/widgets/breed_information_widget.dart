import 'package:cached_network_image/cached_network_image.dart';
import 'package:catbreeds_app/src/models/breed_model/breed_model.dart';
import 'package:catbreeds_app/src/screens/breed_detail_screen.dart';
import 'package:catbreeds_app/src/utils/app_text_styles.dart';
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
                Text(
                  model.name ?? '--',
                  style: AppTextStyles.headline2,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BreedDetailScreen(model),
                      ),
                    );
                  },
                  child: const Text("Más..."),
                )
              ],
            ),
            Hero(
              tag: "__${model.id}__",
              child: CachedNetworkImage(
                imageUrl: model.getImageUrl(),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    SizedBox(
                  width: size.width * 0.1,
                  child: CircularProgressIndicator(
                      value: downloadProgress.progress),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  model.origin ?? '--',
                  style: AppTextStyles.headline2,
                ),
                Text(
                  "${model.intelligence ?? '--'}",
                  style: AppTextStyles.headline2,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
