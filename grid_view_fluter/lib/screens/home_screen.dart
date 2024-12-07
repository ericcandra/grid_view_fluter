import 'package:flutter/material.dart';
import 'package:grid_view_fluter/data/home_data.dart';
import 'package:grid_view_fluter/models/home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
              padding: const EdgeInsets.all(8),
              itemCount: homeList.length,
              itemBuilder: (context, index) {
                Home varHome = homeList[index];
                return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    margin: const EdgeInsets.all(6),
                    elevation: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Gambar Tempat
                        Expanded(
                            child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            varHome.imageAsset,
                            fit: BoxFit.cover,
                          ),
                        )),
                        // Nama Tempat
                        Padding(
                          padding: const EdgeInsets.only(left: 16, top: 8),
                          child: Text(
                            varHome.name,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        // Lokasi Tempat
                        Padding(
                          padding: const EdgeInsets.only(left: 16, bottom: 8),
                          child: Text(
                            varHome.location,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ));
              },
            )
          ],
        ),
      )),
    );
  }
}