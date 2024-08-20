import 'package:cached_network_image/cached_network_image.dart';
import 'package:catbreeds_app/src/models/breed_model/breed_model.dart';
import 'package:catbreeds_app/src/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class BreedDetailScreen extends StatelessWidget {
  final BreedModel breedModel;
  const BreedDetailScreen(this.breedModel, {super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(breedModel.name ?? "--"),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.chevron_left_rounded,
          ),
        ),
      ),
      body: Column(
        children: [
          Hero(
            tag: "__${breedModel.id}__",
            child: CachedNetworkImage(
              imageUrl: breedModel.getImageUrl(),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  SizedBox(
                width: size.width * 0.1,
                child:
                    CircularProgressIndicator(value: downloadProgress.progress),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          BreedDetailInformationWidget(breedModel: breedModel)
        ],
      ),
    );
  }
}

class BreedDetailInformationWidget extends StatelessWidget {
  const BreedDetailInformationWidget({
    super.key,
    required this.breedModel,
  });

  final BreedModel breedModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scrollbar(
        thickness: 6.0,
        radius: const Radius.circular(10.0),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              detailText(
                "Description",
                breedModel.description ?? "--",
              ),
              detailText(
                "Origin",
                breedModel.origin ?? "--",
              ),
              detailText(
                "Intelligence",
                "${breedModel.intelligence}",
              ),
              detailText(
                "Adaptability",
                "${breedModel.adaptability}",
              ),
              detailText(
                "Life Span",
                "${breedModel.lifeSpan}",
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget detailText(String title, String text) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$title:",
            style: AppTextStyles.headline1,
          ),
          Text(
            text,
            style: AppTextStyles.bodyText1,
          ),
        ],
      ),
    );
  }
}
