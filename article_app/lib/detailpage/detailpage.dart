import 'package:article_app/listcategorypage/category_list.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String foto;
  final String title;
  final String content;
  final String like;
  final String share;
  final String kategori;

  DetailPage(
      {required this.foto,
      required this.title,
      required this.content,
      required this.like,
      required this.share,
      required this.kategori});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isBookmarked = false;
  void toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: DetailContent(context),
        ),
      ),
    );
  }

  Column DetailContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        headerpage(context),
        ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    12.0), // Sesuaikan nilai radius sesuai keinginan Anda
              )),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CategoryList(
                            kategori: widget.kategori,
                          )));
            },
            child: Text(widget.kategori)),
        SizedBox(
          height: 10,
        ),
        gambarcontent(),
        SizedBox(height: 16.0),
        iconContent(),
        DescContent(),
      ],
    );
  }

  Column DescContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 18,
        ),
        Text(
          widget.content,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Container iconContent() {
    return Container(
      height: 50,
      child: Row(
        children: [
          TextButton.icon(
            icon: Icon(
              Icons.thumb_up_rounded,
            ),
            onPressed: () {},
            label: Text(
              widget.like,
            ),
          ),
          TextButton.icon(
            icon: Icon(
              color: Colors.green,
              Icons.share,
            ),
            onPressed: () {},
            label: Text(widget.share),
          )
        ],
      ),
    );
  }

  Container gambarcontent() {
    return Container(
      height: 200,
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          image: DecorationImage(
              image: AssetImage(widget.foto), fit: BoxFit.cover)),
    );
  }

  Container headerpage(BuildContext context) {
    return Container(
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          IconButton(
            icon: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: isBookmarked
                  ? Colors.black
                  : null, // Warna ikon ketika ditekan
            ),
            onPressed: toggleBookmark,
            tooltip:
                isBookmarked ? 'Hapus dari Bookmark' : 'Tambah ke Bookmark',
          ),
        ],
      ),
    );
  }
}
