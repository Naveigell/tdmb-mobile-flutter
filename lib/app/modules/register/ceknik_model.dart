class DataCekNik {
  String? NIK_EKTP;
  String? NAMA_LGKP_EKTP;
  String? JENIS_KLMIN;
  String? TMPT_LHR_EKTP;
  String? TGL_LHR_EKTP;

  DataCekNik(
      {this.NIK_EKTP,
      this.NAMA_LGKP_EKTP,
      this.JENIS_KLMIN,
      this.TMPT_LHR_EKTP,
      this.TGL_LHR_EKTP});

  DataCekNik.fromJson(Map<String, dynamic> json) {
    NIK_EKTP = json['NIK_EKTP'];
    NAMA_LGKP_EKTP = json['NAMA_LGKP_EKTP'];
    JENIS_KLMIN = json['JENIS_KLMIN'];
    TMPT_LHR_EKTP = json['TMPT_LHR_EKTP'];
    TGL_LHR_EKTP = json['TGL_LHR_EKTP'];
  }

  Map<String, dynamic> toJson() {
    final data2 = <String, dynamic>{};
    data2['NIK_EKTP'] = NIK_EKTP;
    data2['NAMA_LGKP_EKTP'] = NAMA_LGKP_EKTP;
    data2['JENIS_KLMIN'] = JENIS_KLMIN;
    data2['TMPT_LHR_EKTP'] = TMPT_LHR_EKTP;
    data2['TGL_LHR_EKTP'] = TGL_LHR_EKTP;
    return data2;
  }
}
