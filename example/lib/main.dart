import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'dart:ui';

import 'package:yandex_mapkit_example/examples/widgets/map_page.dart';
import 'package:yandex_mapkit_example/examples/circle_map_object_page.dart';
import 'package:yandex_mapkit_example/examples/clusterized_placemark_collection_page.dart';
import 'package:yandex_mapkit_example/examples/bicycle_page.dart';
import 'package:yandex_mapkit_example/examples/driving_page.dart';
import 'package:yandex_mapkit_example/examples/map_controls_page.dart';
import 'package:yandex_mapkit_example/examples/map_object_collection_page.dart';
import 'package:yandex_mapkit_example/examples/placemark_map_object_page.dart';
import 'package:yandex_mapkit_example/examples/polyline_map_object_page.dart';
import 'package:yandex_mapkit_example/examples/polygon_map_object_page.dart';
import 'package:yandex_mapkit_example/examples/reverse_search_page.dart';
import 'package:yandex_mapkit_example/examples/search_page.dart';
import 'package:yandex_mapkit_example/examples/suggest_page.dart';
import 'package:yandex_mapkit_example/examples/user_layer_page.dart';

void main() {
  runApp(MaterialApp(home: MainPage()));
}

const List<MapPage> _allPages = <MapPage>[
  MapControlsPage(),
  ClusterizedPlacemarkCollectionPage(),
  MapObjectCollectionPage(),
  PlacemarkMapObjectPage(),
  PolylineMapObjectPage(),
  PolygonMapObjectPage(),
  CircleMapObjectPage(),
  UserLayerPage(),
  SuggestionsPage(),
  SearchPage(),
  ReverseSearchPage(),
  BicyclePage(),
  DrivingPage(),
];

class MainPage extends StatelessWidget {
  void _pushPage(BuildContext context, MapPage page) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
            builder: (_) => Scaffold(
                appBar: AppBar(title: Text(page.title)),
                body:
                    Container(padding: const EdgeInsets.all(8), child: page))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('YandexMap examples')),
        drawer: Drawer(),
        body: Stack(alignment: AlignmentDirectional.bottomCenter, children: [
          BackdropFilter(
              filter: ImageFilter.blur(
            sigmaX: 2,
            sigmaY: 2,
          )),
          Container(
              //padding: const EdgeInsets.all(8),
              child: const YandexMap()),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: _allPages.length,
          //     itemBuilder: (_, int index) => ListTile(
          //       title: Text(_allPages[index].title),
          //       onTap: () => _pushPage(context, _allPages[index]),
          //     ),
          //   )
          // )
          Container(
            height: 100,
            decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.5)),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 181, 214, 248).withOpacity(0.85),
                    Color.fromARGB(255, 225, 225, 225).withOpacity(0.85),
                  ],
                )),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                      child: Icon(
                    Icons.save,
                    size: 50,
                  )),
                  GestureDetector(
                      child: Icon(
                    Icons.check,
                    size: 50,
                  )),
                  GestureDetector(
                      child: Icon(
                    Icons.add,
                    size: 50,
                  )),
                  GestureDetector(
                      child: Icon(
                    Icons.map,
                    size: 50,
                  )),
                ]),
          ),
        ]));
  }
}
