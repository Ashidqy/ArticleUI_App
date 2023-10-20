import 'package:article_app/detailpage/detailpage.dart';
import 'package:article_app/model/data_hero_container.dart';
import 'package:article_app/model/herocontainer.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryList extends StatelessWidget {
  CategoryList({super.key, required this.kategori});
  final String kategori;

  List<heroContainer> datalist =
      data_hero_container.map((e) => heroContainer.fromJson(e)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(context),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(12),
          child: Container(
            width: 500,
            height: double.maxFinite,
            child: ListViewData(),
          ),
        )));
  }

  AppBar Header(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 157, 116, 215),
      title: Text(kategori),
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back)),
      centerTitle: true,
    );
  }

  ListView ListViewData() {
    return ListView.builder(
      itemCount: datalist.length,
      itemBuilder: (context, index) {
        if (datalist[index].kategori == kategori) {
          return CardDetail(context, index);
        } else {
          return Container();
        }
      },
    );
  }

  CardDetail(BuildContext context, int index) {
    return InkWell(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(datalist[index].foto!,
                height: 160, width: double.infinity, fit: BoxFit.cover),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    datalist[index].judul!,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[800],
                    ),
                  ),
                  Container(height: 10),
                  Text(
                    datalist[index].deskripsi!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.share),
                          label: Text(datalist[index].share!)),
                      TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.thumb_up_sharp),
                          label: Text(datalist[index].like!)),
                      const Spacer(),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.transparent,
                        ),
                        child: const Text(
                          "READMORE",
                          style: TextStyle(color: Colors.blueAccent),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                        foto: datalist[index].foto!,
                                        title: datalist[index].judul!,
                                        content: datalist[index].deskripsi!,
                                        like: datalist[index].like!,
                                        share: datalist[index].share!,
                                        kategori: datalist[index].kategori!,
                                      )));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(height: 5),
          ],
        ),
      ),
    );
  }
}
