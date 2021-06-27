class TutionData {
  final String tution_id;
  final String tution_name;
  final String password;
  final String tution_address;
  final int pincode;
  final String tution_desc;
  final int is_seat_available;
  final int tution_mode_of_teaching;
  final String image;

  TutionData(
      {this.tution_id,
      this.tution_name,
      this.password,
      this.tution_address,
      this.pincode,
      this.tution_desc,
      this.is_seat_available,
      this.tution_mode_of_teaching,
      this.image});

  factory TutionData.fromJson(Map<String, dynamic> json) {
    return TutionData(
      tution_id: json['TutionID'].toString(),
      tution_name: json['TutionName'].toString(),
      password: json['Password'].toString(),
      tution_address: json['TutionAddress'].toString(),
      pincode: json['Pincode'] as int,
      tution_desc: json['TutionDesc'].toString(),
      is_seat_available: json['IsSeatAvailable'] as int,
      tution_mode_of_teaching:
          json['TutionTeachingMode'] as int, // 0 if online, 1 if offline
      image: json['TutionImage'].toString(),

      // uid: json['UID'].toString(),
      // displayName: json['DisplayName'].toString(),
      // creationDate: json['CreationDate'].toString(),
      // avatar: json['Avatar'] as int,
    );
  }
}
