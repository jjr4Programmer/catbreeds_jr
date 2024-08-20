import 'package:catbreeds_app/src/constants.dart';
import 'package:catbreeds_app/src/providers/breed_provider.dart';
import 'package:catbreeds_app/src/widgets/breed_information_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<BreedProvider>().loadInitialData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(appTitle),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                suffixIcon: InkWell(
                  onTap: () {
                    context.read<BreedProvider>().seachBreedsByFilter(
                          searchController.text.replaceAll(" ", "+"),
                        );
                  },
                  child: const Icon(Icons.search),
                ),
              ),
            ),
          ),
          const BreedInformationList()
        ],
      ),
    );
  }
}
