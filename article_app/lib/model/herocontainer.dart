class heroContainer {
  int? id;
  String? foto;
  String? judul;
  String? deskripsi;
  String? kategori;
  String? like;
  String? share;

  heroContainer(
      {this.id,
      this.foto,
      this.judul,
      this.deskripsi,
      this.kategori,
      this.like,
      this.share});

  heroContainer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    foto = json['foto'];
    judul = json['judul'];
    deskripsi = json['deskripsi'];
    kategori = json['kategori'];
    like = json['like'];
    share = json['share'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['foto'] = this.foto;
    data['judul'] = this.judul;
    data['deskripsi'] = this.deskripsi;
    data['kategori'] = this.kategori;
    data['like'] = this.like;
    data['share'] = this.share;
    return data;
  }
}
