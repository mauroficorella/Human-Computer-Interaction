class WatchProvidersModel {
  int id;
  Results results;

  WatchProvidersModel({this.id, this.results});

  WatchProvidersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    results =
        json['results'] != null ? new Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.results != null) {
      data['results'] = this.results.toJson();
    }
    return data;
  }
}

class Results {
  AR aR;
  AR aT;
  AR aU;
  AR bE;
  AR bR;
  AR cA;
  AR cL;
  AR cO;
  AR dE;
  AR dK;
  AR eS;
  AR fI;
  AR fR;
  AR gB;
  AR iE;
  AR iT;
  //JP jP;
  AR mX;
  AR nL;
  AR nO;
  AR nZ;
  AR pT;
  AR sE;
  AR uS;

  Results(
      {this.aR,
      this.aT,
      this.aU,
      this.bE,
      this.bR,
      this.cA,
      this.cL,
      this.cO,
      this.dE,
      this.dK,
      this.eS,
      this.fI,
      this.fR,
      this.gB,
      this.iE,
      this.iT,
      //this.jP,
      this.mX,
      this.nL,
      this.nO,
      this.nZ,
      this.pT,
      this.sE,
      this.uS});

  Results.fromJson(Map<String, dynamic> json) {
    aR = json['AR'] != null ? new AR.fromJson(json['AR']) : null;
    aT = json['AT'] != null ? new AR.fromJson(json['AT']) : null;
    aU = json['AU'] != null ? new AR.fromJson(json['AU']) : null;
    bE = json['BE'] != null ? new AR.fromJson(json['BE']) : null;
    bR = json['BR'] != null ? new AR.fromJson(json['BR']) : null;
    cA = json['CA'] != null ? new AR.fromJson(json['CA']) : null;
    cL = json['CL'] != null ? new AR.fromJson(json['CL']) : null;
    cO = json['CO'] != null ? new AR.fromJson(json['CO']) : null;
    dE = json['DE'] != null ? new AR.fromJson(json['DE']) : null;
    dK = json['DK'] != null ? new AR.fromJson(json['DK']) : null;
    eS = json['ES'] != null ? new AR.fromJson(json['ES']) : null;
    fI = json['FI'] != null ? new AR.fromJson(json['FI']) : null;
    fR = json['FR'] != null ? new AR.fromJson(json['FR']) : null;
    gB = json['GB'] != null ? new AR.fromJson(json['GB']) : null;
    iE = json['IE'] != null ? new AR.fromJson(json['IE']) : null;
    iT = json['IT'] != null ? new AR.fromJson(json['IT']) : null;
    //jP = json['JP'] != null ? new JP.fromJson(json['JP']) : null;
    mX = json['MX'] != null ? new AR.fromJson(json['MX']) : null;
    nL = json['NL'] != null ? new AR.fromJson(json['NL']) : null;
    nO = json['NO'] != null ? new AR.fromJson(json['NO']) : null;
    nZ = json['NZ'] != null ? new AR.fromJson(json['NZ']) : null;
    pT = json['PT'] != null ? new AR.fromJson(json['PT']) : null;
    sE = json['SE'] != null ? new AR.fromJson(json['SE']) : null;
    uS = json['US'] != null ? new AR.fromJson(json['US']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.aR != null) {
      data['AR'] = this.aR.toJson();
    }
    if (this.aT != null) {
      data['AT'] = this.aT.toJson();
    }
    if (this.aU != null) {
      data['AU'] = this.aU.toJson();
    }
    if (this.bE != null) {
      data['BE'] = this.bE.toJson();
    }
    if (this.bR != null) {
      data['BR'] = this.bR.toJson();
    }
    if (this.cA != null) {
      data['CA'] = this.cA.toJson();
    }
    if (this.cL != null) {
      data['CL'] = this.cL.toJson();
    }
    if (this.cO != null) {
      data['CO'] = this.cO.toJson();
    }
    if (this.dE != null) {
      data['DE'] = this.dE.toJson();
    }
    if (this.dK != null) {
      data['DK'] = this.dK.toJson();
    }
    if (this.eS != null) {
      data['ES'] = this.eS.toJson();
    }
    if (this.fI != null) {
      data['FI'] = this.fI.toJson();
    }
    if (this.fR != null) {
      data['FR'] = this.fR.toJson();
    }
    if (this.gB != null) {
      data['GB'] = this.gB.toJson();
    }
    if (this.iE != null) {
      data['IE'] = this.iE.toJson();
    }
    if (this.iT != null) {
      data['IT'] = this.iT.toJson();
    }
    /*if (this.jP != null) {
      data['JP'] = this.jP.toJson();
    }*/
    if (this.mX != null) {
      data['MX'] = this.mX.toJson();
    }
    if (this.nL != null) {
      data['NL'] = this.nL.toJson();
    }
    if (this.nO != null) {
      data['NO'] = this.nO.toJson();
    }
    if (this.nZ != null) {
      data['NZ'] = this.nZ.toJson();
    }
    if (this.pT != null) {
      data['PT'] = this.pT.toJson();
    }
    if (this.sE != null) {
      data['SE'] = this.sE.toJson();
    }
    if (this.uS != null) {
      data['US'] = this.uS.toJson();
    }
    return data;
  }
}

class AR {
  String link;
  List<Providers> providers = [];

  AR({this.link, this.providers});

  AR.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    if (json['flatrate'] != null) {
      //providers = new List<Providers>();
      json['flatrate'].forEach((v) {
        providers.add(new Providers.fromJson(v));
      });
    }

    if (json['rent'] != null) {
      //providers = new List<Providers>();
      json['rent'].forEach((v) {
        providers.add(new Providers.fromJson(v));
      });
    }

    /*if (json['buy'] != null) {
      //providers = new List<Providers>();
      json['buy'].forEach((v) {
        if (!providers.contains(Providers.fromJson(v))) {
          providers.add(new Providers.fromJson(v));
        }
      });
    }*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link'] = this.link;
    if (this.providers != null) {
      data['providers'] = this.providers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Providers {
  int displayPriority;
  String logoPath;
  int providerId;
  String providerName;

  Providers(
      {this.displayPriority,
      this.logoPath,
      this.providerId,
      this.providerName});

  Providers.fromJson(Map<String, dynamic> json) {
    displayPriority = json['display_priority'];
    logoPath = json['logo_path'];
    providerId = json['provider_id'];
    providerName = json['provider_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display_priority'] = this.displayPriority;
    data['logo_path'] = this.logoPath;
    data['provider_id'] = this.providerId;
    data['provider_name'] = this.providerName;
    return data;
  }
}

/*class AR {
  String link;
  List<Providers> providers;

  AR({this.link, this.providers});

  AR.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    if (json['providers'] != null) {
      providers = new List<Providers>();
      json['providers'].forEach((v) {
        providers.add(new Providers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link'] = this.link;
    if (this.providers != null) {
      data['providers'] = this.providers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Providers {
  int displayPriority;
  String logoPath;
  int providerId;
  String providerName;

  Providers(
      {this.displayPriority,
      this.logoPath,
      this.providerId,
      this.providerName});

  Providers.fromJson(Map<String, dynamic> json) {
    displayPriority = json['display_priority'];
    logoPath = json['logo_path'];
    providerId = json['provider_id'];
    providerName = json['provider_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['display_priority'] = this.displayPriority;
    data['logo_path'] = this.logoPath;
    data['provider_id'] = this.providerId;
    data['provider_name'] = this.providerName;
    return data;
  }
}*/

/*class JP {
  String link;
  List<Flatrate> flatrate;

  JP({this.link, this.flatrate});

  JP.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    if (json['flatrate'] != null) {
      flatrate = new List<Flatrate>();
      json['flatrate'].forEach((v) {
        flatrate.add(new Flatrate.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['link'] = this.link;
    if (this.flatrate != null) {
      data['flatrate'] = this.flatrate.map((v) => v.toJson()).toList();
    }
    return data;
  }
}*/