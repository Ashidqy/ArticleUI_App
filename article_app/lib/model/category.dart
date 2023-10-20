class category {
  int? id;
  String? namaCategory;
  String? gambar;
  int? jumlahArtikel;
  String? color;

  category(
      {this.id,
      this.namaCategory,
      this.gambar,
      this.jumlahArtikel,
      this.color});

  category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaCategory = json['nama_category'];
    gambar = json['gambar'];
    jumlahArtikel = json['jumlah_artikel'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nama_category'] = this.namaCategory;
    data['gambar'] = this.gambar;
    data['jumlah_artikel'] = this.jumlahArtikel;
    data['color'] = this.color;
    return data;
  }
}
