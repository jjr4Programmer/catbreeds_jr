import 'package:catbreeds_app/src/models/breed_model/breed_model.dart';
import 'package:catbreeds_app/src/providers/breed_provider.dart';
import 'package:catbreeds_app/src/widgets/breed_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BreedInformationList extends StatelessWidget {
  const BreedInformationList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final BreedProvider breedProvider = context.watch<BreedProvider>();
    final List<BreedModel> breeds = breedProvider.breeds;

    if (breedProvider.isLoading) {
      return const CircularProgressIndicator();
    } else {
      return Expanded(
        child: ListView.builder(
            itemCount: breeds.length,
            itemBuilder: (context, index) {
              return BreedInformationWidget(breeds[index]);
            }),
      );
    }
  }
}
