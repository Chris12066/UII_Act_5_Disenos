import 'package:flutter/material.dart';

class SliverTabBar extends StatefulWidget {
  const SliverTabBar({Key? key}) : super(key: key);

  @override
  _SliverTabBarState createState() => _SliverTabBarState();
}

class _SliverTabBarState extends State<SliverTabBar>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int index = 0;
  String image =
      "https://www.telemundo.com/sites/nbcutelemundo/files/styles/fit-760w/public/images/article/cover/2018/04/19/tigre-caminando.jpg?ramen_itok=iqwQftIcTf";

  List<String> miImages = [
    "https://www.fundacionaquae.org/wp-content/uploads/2018/10/proteger-a-los-animales.jpg",
    "https://www.tiendanimal.es/articulos/wp-content/uploads/2023/05/coyote.jpg",
    "https://s1.elespanol.com/2021/08/05/curiosidades/naturaleza-planeta-tierra/601957550_199460114_1706x960.jpg",
    "https://e00-elmundo.uecdn.es/assets/multimedia/imagenes/2023/09/28/16959013724520.jpg"
  ];

  void _tabListener() {
    setState(() {
      index = tabController!.index;
      image = miImages[index];
    });
  }

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController?.addListener(_tabListener);
    super.initState();
  }

  @override
  void dispose() {
    tabController!.removeListener(_tabListener);
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0.0,
            pinned: true,
            backgroundColor: Colors.deepPurple,
            expandedHeight: 350.0,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Naturaleza Extraordinaria"),
              background: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverAppBar(
            pinned: true,
            primary: false,
            elevation: 8.0,
            backgroundColor: Colors.deepPurple,
            title: Align(
              alignment: AlignmentDirectional.center,
              child: TabBar(
                controller: tabController,
                indicatorColor: Colors.greenAccent,
                unselectedLabelColor: Colors.white,
                labelStyle: TextStyle(color: Colors.white),
                isScrollable: true,
                tabs: const [
                  Tab(text: "Lobos"),
                  Tab(text: "Tigres"),
                  Tab(text: "Guacamayas"),
                  Tab(text: "Leones"),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 800.0,
              child: Padding(
                padding: const EdgeInsets.all(50.0),
                child: TabBarView(
                  controller: tabController,
                  children: const [
                    Text("Hola 1"),
                    Text("Hola 2"),
                    Text("Hola 3"),
                    Text("Hola 4")
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
