
class Sinif {
    List<Dersler> dersler;
    String sinif;

    Sinif({this.dersler, this.sinif});

    factory Sinif.fromJson(Map<String, dynamic> json) {
        return Sinif(
            dersler: json['dersler'] != null ? (json['dersler'] as List).map((i) => Dersler.fromJson(i)).toList() : null,
            sinif: json['sinif'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['sinif'] = this.sinif;
        if (this.dersler != null) {
            data['dersler'] = this.dersler.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Dersler {
    String ders;
    List<Konular> konular;

    Dersler({this.ders, this.konular});

    factory Dersler.fromJson(Map<String, dynamic> json) {
        return Dersler(
            ders: json['ders'],
            konular: json['konular'] != null ? (json['konular'] as List).map((i) => Konular.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['ders'] = this.ders;
        if (this.konular != null) {
            data['konular'] = this.konular.map((v) => v.toJson()).toList();
        }
        return data;
    }
}

class Konular {
    bool durum;
    String konu;

    Konular({this.durum, this.konu});

    factory Konular.fromJson(Map<String, dynamic> json) {
        return Konular(
            durum: json['durum'],
            konu: json['konu'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['durum'] = this.durum;
        data['konu'] = this.konu;
        return data;
    }
}
