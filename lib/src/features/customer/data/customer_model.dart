class CustomerModel {
  CustomerModel({
    required this.id,
    required this.role,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.profileImg,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  final String id;
  final String role;
  final String firstName;
  final String lastName;
  final String email;
  final String profileImg;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int v;

  factory CustomerModel.fromJson(Map<String, dynamic> json) {
    return CustomerModel(
      id: json["_id"] ?? "",
      role: json["role"] ?? "",
      firstName: json["first_name"] ?? "",
      lastName: json["last_name"] ?? "",
      email: json["email"] ?? "",
      profileImg: json["profile_img"] ?? "",
      createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
      updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      v: json["__v"] ?? 0,
    );
  }
}

final kDummyUsers = <Map<String, dynamic>>[
  {
    "_id": "60ecfe19ff177438b1c490e5",
    "role": "user",
    "first_name": "Ima_Raynor61",
    "last_name": "Grand Caravan",
    "email": "Ollie_Kunze@gmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/quailandquasar/128.jpg",
    "createdAt": "2021-07-13T02:44:41.576Z",
    "updatedAt": "2021-07-13T02:44:41.576Z",
    "__v": 0
  },
  {
    "_id": "60ecfe19ff177438b1c490e7",
    "role": "user",
    "first_name": "Roxane_Quitzon40",
    "last_name": "Fiesta",
    "email": "Tiana_Reichel@hotmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/bolzanmarco/128.jpg",
    "createdAt": "2021-07-13T02:44:41.842Z",
    "updatedAt": "2021-07-13T02:44:41.842Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1aff177438b1c490e9",
    "role": "user",
    "first_name": "Edwin66",
    "last_name": "XC90",
    "email": "Pierce.Herman@gmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/panghal0/128.jpg",
    "createdAt": "2021-07-13T02:44:42.056Z",
    "updatedAt": "2021-07-13T02:44:42.056Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1aff177438b1c490eb",
    "role": "user",
    "first_name": "Seamus.Schuster90",
    "last_name": "Alpine",
    "email": "Major_Considine@gmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/thierrykoblentz/128.jpg",
    "createdAt": "2021-07-13T02:44:42.288Z",
    "updatedAt": "2021-07-13T02:44:42.288Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1aff177438b1c490ed",
    "role": "user",
    "first_name": "Grace.Waters",
    "last_name": "Land Cruiser",
    "email": "Nico_Nicolas29@gmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/imammuht/128.jpg",
    "createdAt": "2021-07-13T02:44:42.495Z",
    "updatedAt": "2021-07-13T02:44:42.495Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1aff177438b1c490ef",
    "role": "user",
    "first_name": "Jordane_Marvin",
    "last_name": "Cruze",
    "email": "Adan.Bernhard27@hotmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/iamgarth/128.jpg",
    "createdAt": "2021-07-13T02:44:42.721Z",
    "updatedAt": "2021-07-13T02:44:42.721Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1aff177438b1c490f1",
    "role": "user",
    "first_name": "Edyth_Romaguera",
    "last_name": "El Camino",
    "email": "Morton_Medhurst24@hotmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/artvavs/128.jpg",
    "createdAt": "2021-07-13T02:44:42.933Z",
    "updatedAt": "2021-07-13T02:44:42.933Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1bff177438b1c490f3",
    "role": "user",
    "first_name": "Oliver57",
    "last_name": "XC90",
    "email": "Flossie29@yahoo.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/kevinoh/128.jpg",
    "createdAt": "2021-07-13T02:44:43.169Z",
    "updatedAt": "2021-07-13T02:44:43.169Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1bff177438b1c490f5",
    "role": "user",
    "first_name": "Elijah61",
    "last_name": "Model T",
    "email": "Jedidiah.Stroman54@gmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/foczzi/128.jpg",
    "createdAt": "2021-07-13T02:44:43.373Z",
    "updatedAt": "2021-07-13T02:44:43.373Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1bff177438b1c490f7",
    "role": "user",
    "first_name": "Bernadine79",
    "last_name": "Element",
    "email": "Josiah10@gmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/romanbulah/128.jpg",
    "createdAt": "2021-07-13T02:44:43.581Z",
    "updatedAt": "2021-07-13T02:44:43.581Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1bff177438b1c490f9",
    "role": "user",
    "first_name": "Giovanny.Schiller",
    "last_name": "Camaro",
    "email": "Elvis_Crooks@yahoo.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/edkf/128.jpg",
    "createdAt": "2021-07-13T02:44:43.792Z",
    "updatedAt": "2021-07-13T02:44:43.792Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1bff177438b1c490fb",
    "role": "user",
    "first_name": "Helena_Schmidt",
    "last_name": "Mustang",
    "email": "Eusebio8@hotmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/michaelcolenso/128.jpg",
    "createdAt": "2021-07-13T02:44:43.998Z",
    "updatedAt": "2021-07-13T02:44:43.998Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1cff177438b1c490fd",
    "role": "user",
    "first_name": "Calista.Feest",
    "last_name": "Camaro",
    "email": "Juanita.Glover99@yahoo.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/agustincruiz/128.jpg",
    "createdAt": "2021-07-13T02:44:44.210Z",
    "updatedAt": "2021-07-13T02:44:44.210Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1cff177438b1c490ff",
    "role": "user",
    "first_name": "Jessie.Schamberger",
    "last_name": "911",
    "email": "Clark.Hirthe@yahoo.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/derienzo777/128.jpg",
    "createdAt": "2021-07-13T02:44:44.417Z",
    "updatedAt": "2021-07-13T02:44:44.417Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1cff177438b1c49101",
    "role": "user",
    "first_name": "Mabelle.Weimann",
    "last_name": "Durango",
    "email": "Haley23@yahoo.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/iamjdeleon/128.jpg",
    "createdAt": "2021-07-13T02:44:44.621Z",
    "updatedAt": "2021-07-13T02:44:44.621Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1cff177438b1c49103",
    "role": "user",
    "first_name": "Kylie_Nader",
    "last_name": "Grand Caravan",
    "email": "Miller_Cremin@gmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/chaensel/128.jpg",
    "createdAt": "2021-07-13T02:44:44.829Z",
    "updatedAt": "2021-07-13T02:44:44.829Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1dff177438b1c49105",
    "role": "user",
    "first_name": "Johnathan_Hegmann67",
    "last_name": "El Camino",
    "email": "Blaze.Watsica@yahoo.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/ganserene/128.jpg",
    "createdAt": "2021-07-13T02:44:45.072Z",
    "updatedAt": "2021-07-13T02:44:45.072Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1dff177438b1c49107",
    "role": "user",
    "first_name": "Federico_Breitenberg76",
    "last_name": "Fiesta",
    "email": "Garrett_Bechtelar70@gmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/bargaorobalo/128.jpg",
    "createdAt": "2021-07-13T02:44:45.282Z",
    "updatedAt": "2021-07-13T02:44:45.282Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1dff177438b1c49109",
    "role": "user",
    "first_name": "Kendall82",
    "last_name": "Ranchero",
    "email": "Zachery_Kemmer10@gmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/shanehudson/128.jpg",
    "createdAt": "2021-07-13T02:44:45.490Z",
    "updatedAt": "2021-07-13T02:44:45.490Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1dff177438b1c4910b",
    "role": "user",
    "first_name": "Bennie_Blick",
    "last_name": "Jetta",
    "email": "Amina38@hotmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/tjrus/128.jpg",
    "createdAt": "2021-07-13T02:44:45.712Z",
    "updatedAt": "2021-07-13T02:44:45.712Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1dff177438b1c4910d",
    "role": "user",
    "first_name": "Cecelia_Grimes6",
    "last_name": "Impala",
    "email": "Gerda.OHara@yahoo.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/paulfarino/128.jpg",
    "createdAt": "2021-07-13T02:44:45.918Z",
    "updatedAt": "2021-07-13T02:44:45.918Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1eff177438b1c4910f",
    "role": "user",
    "first_name": "Elna.Lynch45",
    "last_name": "Escalade",
    "email": "Candido69@hotmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/belyaev_rs/128.jpg",
    "createdAt": "2021-07-13T02:44:46.122Z",
    "updatedAt": "2021-07-13T02:44:46.122Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1eff177438b1c49111",
    "role": "user",
    "first_name": "Ceasar93",
    "last_name": "V90",
    "email": "Patience.Maggio@yahoo.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/sawrb/128.jpg",
    "createdAt": "2021-07-13T02:44:46.328Z",
    "updatedAt": "2021-07-13T02:44:46.328Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1eff177438b1c49113",
    "role": "user",
    "first_name": "Terence_Gibson20",
    "last_name": "911",
    "email": "Delilah36@yahoo.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/_dwite_/128.jpg",
    "createdAt": "2021-07-13T02:44:46.543Z",
    "updatedAt": "2021-07-13T02:44:46.543Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1eff177438b1c49115",
    "role": "user",
    "first_name": "Lester_Anderson",
    "last_name": "PT Cruiser",
    "email": "Chelsey_Von@hotmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/rpeezy/128.jpg",
    "createdAt": "2021-07-13T02:44:46.748Z",
    "updatedAt": "2021-07-13T02:44:46.748Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1eff177438b1c49117",
    "role": "user",
    "first_name": "Kamille_Reynolds88",
    "last_name": "Wrangler",
    "email": "Favian71@yahoo.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/laasli/128.jpg",
    "createdAt": "2021-07-13T02:44:46.962Z",
    "updatedAt": "2021-07-13T02:44:46.962Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1fff177438b1c49119",
    "role": "user",
    "first_name": "Henri45",
    "last_name": "Accord",
    "email": "Anthony_Gleason@hotmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/dannol/128.jpg",
    "createdAt": "2021-07-13T02:44:47.168Z",
    "updatedAt": "2021-07-13T02:44:47.168Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1fff177438b1c4911b",
    "role": "user",
    "first_name": "Robbie_Strosin",
    "last_name": "Land Cruiser",
    "email": "Matt_Ritchie@yahoo.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/jay_wilburn/128.jpg",
    "createdAt": "2021-07-13T02:44:47.372Z",
    "updatedAt": "2021-07-13T02:44:47.372Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1fff177438b1c4911d",
    "role": "user",
    "first_name": "Larry28",
    "last_name": "Altima",
    "email": "Trudie87@gmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/scips/128.jpg",
    "createdAt": "2021-07-13T02:44:47.573Z",
    "updatedAt": "2021-07-13T02:44:47.573Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1fff177438b1c4911f",
    "role": "user",
    "first_name": "Lydia.Wiza",
    "last_name": "Fiesta",
    "email": "Jamarcus4@gmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/dixchen/128.jpg",
    "createdAt": "2021-07-13T02:44:47.794Z",
    "updatedAt": "2021-07-13T02:44:47.794Z",
    "__v": 0
  },
  {
    "_id": "60ecfe1fff177438b1c49121",
    "role": "user",
    "first_name": "Noah13",
    "last_name": "Mercielago",
    "email": "Kacie_Doyle25@gmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/guiiipontes/128.jpg",
    "createdAt": "2021-07-13T02:44:47.994Z",
    "updatedAt": "2021-07-13T02:44:47.994Z",
    "__v": 0
  },
  {
    "_id": "60ecfe20ff177438b1c49123",
    "role": "user",
    "first_name": "Francis.Fahey",
    "last_name": "LeBaron",
    "email": "Camryn_OKeefe25@gmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/elliotlewis/128.jpg",
    "createdAt": "2021-07-13T02:44:48.197Z",
    "updatedAt": "2021-07-13T02:44:48.197Z",
    "__v": 0
  },
  {
    "_id": "60ecfe20ff177438b1c49125",
    "role": "user",
    "first_name": "Junius78",
    "last_name": "Expedition",
    "email": "Otilia8@gmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/phillapier/128.jpg",
    "createdAt": "2021-07-13T02:44:48.411Z",
    "updatedAt": "2021-07-13T02:44:48.411Z",
    "__v": 0
  },
  {
    "_id": "60ecfe20ff177438b1c49127",
    "role": "user",
    "first_name": "Blanche41",
    "last_name": "Charger",
    "email": "Larue.Grant@gmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/abotap/128.jpg",
    "createdAt": "2021-07-13T02:44:48.614Z",
    "updatedAt": "2021-07-13T02:44:48.614Z",
    "__v": 0
  },
  {
    "_id": "60ecfe20ff177438b1c49129",
    "role": "user",
    "first_name": "Reina.Pfannerstill33",
    "last_name": "Golf",
    "email": "Erwin50@gmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/cadikkara/128.jpg",
    "createdAt": "2021-07-13T02:44:48.814Z",
    "updatedAt": "2021-07-13T02:44:48.814Z",
    "__v": 0
  },
  {
    "_id": "60ecfe21ff177438b1c4912b",
    "role": "user",
    "first_name": "Frankie79",
    "last_name": "LeBaron",
    "email": "Raphaelle37@hotmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/arpitnj/128.jpg",
    "createdAt": "2021-07-13T02:44:49.021Z",
    "updatedAt": "2021-07-13T02:44:49.021Z",
    "__v": 0
  },
  {
    "_id": "60ecfe21ff177438b1c4912d",
    "role": "user",
    "first_name": "Noemie2",
    "last_name": "Fortwo",
    "email": "Austen.Heaney@gmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/jjsiii/128.jpg",
    "createdAt": "2021-07-13T02:44:49.226Z",
    "updatedAt": "2021-07-13T02:44:49.226Z",
    "__v": 0
  },
  {
    "_id": "60ecfe21ff177438b1c4912f",
    "role": "user",
    "first_name": "Wilson.Leannon",
    "last_name": "Expedition",
    "email": "Cordie_Conroy@hotmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/maximsorokin/128.jpg",
    "createdAt": "2021-07-13T02:44:49.434Z",
    "updatedAt": "2021-07-13T02:44:49.434Z",
    "__v": 0
  },
  {
    "_id": "60ecfe21ff177438b1c49131",
    "role": "user",
    "first_name": "Ian65",
    "last_name": "Countach",
    "email": "Eleanora_Lueilwitz28@yahoo.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/bboy1895/128.jpg",
    "createdAt": "2021-07-13T02:44:49.643Z",
    "updatedAt": "2021-07-13T02:44:49.643Z",
    "__v": 0
  },
  {
    "_id": "60ecfe21ff177438b1c49133",
    "role": "user",
    "first_name": "Iva8",
    "last_name": "Silverado",
    "email": "Dane.Sauer75@hotmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/robinclediere/128.jpg",
    "createdAt": "2021-07-13T02:44:49.856Z",
    "updatedAt": "2021-07-13T02:44:49.856Z",
    "__v": 0
  },
  {
    "_id": "60ecfe22ff177438b1c49135",
    "role": "user",
    "first_name": "Blake55",
    "last_name": "Golf",
    "email": "Christ37@gmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/davecraige/128.jpg",
    "createdAt": "2021-07-13T02:44:50.065Z",
    "updatedAt": "2021-07-13T02:44:50.065Z",
    "__v": 0
  },
  {
    "_id": "60ecfe22ff177438b1c49137",
    "role": "user",
    "first_name": "Anastacio.Hessel64",
    "last_name": "Cruze",
    "email": "Gonzalo_Keebler77@hotmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/dnezkumar/128.jpg",
    "createdAt": "2021-07-13T02:44:50.270Z",
    "updatedAt": "2021-07-13T02:44:50.270Z",
    "__v": 0
  },
  {
    "_id": "60ecfe22ff177438b1c49139",
    "role": "user",
    "first_name": "Kaya_Konopelski",
    "last_name": "PT Cruiser",
    "email": "Gino.Schmidt36@hotmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/phillapier/128.jpg",
    "createdAt": "2021-07-13T02:44:50.477Z",
    "updatedAt": "2021-07-13T02:44:50.477Z",
    "__v": 0
  },
  {
    "_id": "60ecfe22ff177438b1c4913b",
    "role": "user",
    "first_name": "Ervin.Brekke",
    "last_name": "Malibu",
    "email": "Arely95@gmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/johannesneu/128.jpg",
    "createdAt": "2021-07-13T02:44:50.686Z",
    "updatedAt": "2021-07-13T02:44:50.686Z",
    "__v": 0
  },
  {
    "_id": "60ecfe22ff177438b1c4913d",
    "role": "user",
    "first_name": "Foster.Hauck",
    "last_name": "V90",
    "email": "Mekhi_Rutherford45@gmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/chaabane_wail/128.jpg",
    "createdAt": "2021-07-13T02:44:50.897Z",
    "updatedAt": "2021-07-13T02:44:50.897Z",
    "__v": 0
  },
  {
    "_id": "60ecfe23ff177438b1c4913f",
    "role": "user",
    "first_name": "Janie_Gislason",
    "last_name": "CTS",
    "email": "Grover25@gmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/timmillwood/128.jpg",
    "createdAt": "2021-07-13T02:44:51.100Z",
    "updatedAt": "2021-07-13T02:44:51.100Z",
    "__v": 0
  },
  {
    "_id": "60ecfe23ff177438b1c49142",
    "role": "user",
    "first_name": "Nicolette11",
    "last_name": "Escalade",
    "email": "Edwardo.Orn@hotmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/jedbridges/128.jpg",
    "createdAt": "2021-07-13T02:44:51.415Z",
    "updatedAt": "2021-07-13T02:44:51.415Z",
    "__v": 0
  },
  {
    "_id": "60ecfe23ff177438b1c49144",
    "role": "user",
    "first_name": "Wilfrid_Schultz95",
    "last_name": "Taurus",
    "email": "Darlene.Goldner12@yahoo.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/enricocicconi/128.jpg",
    "createdAt": "2021-07-13T02:44:51.655Z",
    "updatedAt": "2021-07-13T02:44:51.655Z",
    "__v": 0
  },
  {
    "_id": "60ecfe23ff177438b1c49146",
    "role": "user",
    "first_name": "Annabel94",
    "last_name": "Ranchero",
    "email": "Luther41@hotmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/angelceballos/128.jpg",
    "createdAt": "2021-07-13T02:44:51.859Z",
    "updatedAt": "2021-07-13T02:44:51.859Z",
    "__v": 0
  },
  {
    "_id": "60ecfe24ff177438b1c49148",
    "role": "user",
    "first_name": "Paige.Wyman75",
    "last_name": "Model 3",
    "email": "Ibrahim.Lesch5@yahoo.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/overra/128.jpg",
    "createdAt": "2021-07-13T02:44:52.064Z",
    "updatedAt": "2021-07-13T02:44:52.064Z",
    "__v": 0
  },
  {
    "_id": "60ecfe24ff177438b1c4914a",
    "role": "user",
    "first_name": "Maxwell49",
    "last_name": "Alpine",
    "email": "Jessika48@hotmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/terrorpixel/128.jpg",
    "createdAt": "2021-07-13T02:44:52.302Z",
    "updatedAt": "2021-07-13T02:44:52.302Z",
    "__v": 0
  },
  {
    "_id": "60ecfe24ff177438b1c4914c",
    "role": "user",
    "first_name": "Melyssa86",
    "last_name": "Charger",
    "email": "Darius53@hotmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/mrebay007/128.jpg",
    "createdAt": "2021-07-13T02:44:52.510Z",
    "updatedAt": "2021-07-13T02:44:52.510Z",
    "__v": 0
  },
  {
    "_id": "60ecfe24ff177438b1c4914e",
    "role": "user",
    "first_name": "Beth30",
    "last_name": "A8",
    "email": "Maddison54@gmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/robinlayfield/128.jpg",
    "createdAt": "2021-07-13T02:44:52.715Z",
    "updatedAt": "2021-07-13T02:44:52.715Z",
    "__v": 0
  },
  {
    "_id": "60ecfe24ff177438b1c49150",
    "role": "user",
    "first_name": "Kelly_Heathcote7",
    "last_name": "Ranchero",
    "email": "Laverne_Mosciski46@hotmail.com",
    "profile_img": "https://s3.amazonaws.com/uifaces/faces/twitter/finchjke/128.jpg",
    "createdAt": "2021-07-13T02:44:52.954Z",
    "updatedAt": "2021-07-13T02:44:52.954Z",
    "__v": 0
  },
  {
    "_id": "60ecfe52ff177438b1c49152",
    "role": "admin",
    "first_name": "Admin",
    "last_name": "Chunlee",
    "email": "admin@gmail.com",
    "phone_number": "0971234567",
    "createdAt": "2021-07-13T02:45:38.953Z",
    "updatedAt": "2021-07-13T02:45:38.953Z",
    "__v": 0
  },
  {
    "_id": "61b4df3efd91978b0d21db3c",
    "role": "admin",
    "first_name": "Test",
    "last_name": "user",
    "email": "tester@gmail.com",
    "phone_number": "0971234567",
    "profile_img": "61b4df3efd91978b0d21db3a.jpg",
    "createdAt": "2021-12-11T17:26:22.293Z",
    "updatedAt": "2021-12-11T17:26:22.293Z",
    "__v": 0
  }
];
