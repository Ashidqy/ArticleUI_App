import 'package:article_app/listcategorypage/category_list.dart';
import 'package:article_app/model/category.dart';
import 'package:article_app/model/data_category.dart';
import 'package:article_app/model/data_hero_container.dart';
import 'package:article_app/model/herocontainer.dart';
import 'package:flutter/material.dart';
import 'package:article_app/constants.dart';
import 'package:article_app/detailpage/detailpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<category> data = data_category.map((e) => category.fromJson(e)).toList();
  List<heroContainer> datalist =
      data_hero_container.map((e) => heroContainer.fromJson(e)).toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // bottomNavigationBar: BottomNavigasi(),
        body: SafeArea(
            child: Stack(children: [
          BackgroundHome(),
          HomeContainer(),
        ])));
  }

  Column BackgroundHome() {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 157, 116, 215),
                borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(50))),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            color: Color.fromARGB(255, 157, 116, 215),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(50))),
            ),
          ),
        ),
      ],
    );
  }

  Container HomeContainer() {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Header(),
              SizedBox(
                height: 10,
              ),
              Text(
                "Terbaru",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              ListViewKonten(),
              SizedBox(
                height: 40,
              ),
              Text(
                "Kategori",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              GridViewKategori()
            ]));
  }

  Expanded GridViewKategori() {
    return Expanded(
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          physics: ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.85),
          itemBuilder: (context, index) => CardCategory(index)),
    );
  }

  Container ListViewKonten() {
    return Container(
      width: double.maxFinite,
      height: 230,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          width: 15,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: datalist.length - 1,
        itemBuilder: (context, index) => CardList(index),
      ),
    );
  }

  Row Header() {
    return Row(
      children: [
        Expanded(
            child: Center(
          child: Text(
            "HOME",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        )),
      ],
    );
  }

  CardList(int index) {
    return InkWell(
        onTap: () {},
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            children: [
              Container(
                width: 300,
                height: 275,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(datalist[index].foto!,
                        height: 130, width: double.infinity, fit: BoxFit.cover),
                    Container(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                datalist[index].judul!,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[800],
                                ),
                              ),
                              Container(height: 10),
                              Text(
                                datalist[index].deskripsi!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[700],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailPage(
                                                  foto: datalist[index].foto!,
                                                  title: datalist[index].judul!,
                                                  content: datalist[index]
                                                      .deskripsi!,
                                                  like: datalist[index].like!,
                                                  share: datalist[index].share!,
                                                  kategori: datalist[index]
                                                      .kategori!)));
                                    },
                                    child: Text(
                                      "Read More",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ])),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: -10,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      elevation: 4,
                      backgroundColor: korange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                  child: Text(
                    datalist[index].kategori!,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  CardCategory(int index) {
    String category = data[index].namaCategory!;
    int categoryCount =
        datalist.where((item) => item.kategori == category).length;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CategoryList(
                        kategori: data[index].namaCategory!,
                      )));
        },
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: Color(int.parse(data[index].color!)),
              borderRadius: BorderRadius.circular(15.0)),
          child: Column(
            children: [
              Image.asset(
                data[index].gambar!,
                height: 100,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                data[index].namaCategory!,
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "$categoryCount Artikel",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
