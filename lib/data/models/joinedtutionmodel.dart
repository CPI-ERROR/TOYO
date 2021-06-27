class JoinedTution {
  final int tution_id;
  final String tution_name;
  final String tution_address;
  final int pincode;
  final String tution_desc;
  final int is_seat_available;
  final String tution_mode_of_teaching;
  final String image;

  JoinedTution(
      {this.tution_id,
      this.tution_name,
      this.tution_address,
      this.pincode,
      this.tution_desc,
      this.is_seat_available,
      this.tution_mode_of_teaching,
      this.image});

  // factory JoinedTution.fromMap(Map<String,dynamic> map){
  //   return JoinedTution(
  //     tution_id : map['tution_id'],
  //     tution_name : map['tution_name'],
  //     tution_address : map['tution_address'],
  //     pincode : map['pincode'],
  //     tution_desc : map['tution_desc'],
  //     is_seat_available : map['is_seat_available'],
  //     tution_mode_of_teaching : map['tution_mode_of_teaching'],
  //     image : map['image'],
  //   );
  // }

  // toMap() => {
  //   "tution_id" : tution_id,
  //   "tution_name" : tution_name,
  //   "tution_address" : tution_address,
  //   "pincode" : pincode,
  //   "tution_desc" : tution_desc,
  //   "is_seat_available" : is_seat_available,
  //   "tution_mode_of_teaching" : tution_mode_of_teaching,
  //   "image" : image,
  // };

  // factory JoinedTution.fromMap(Map<String, dynamic> json) {
  //   return JoinedTution({
  //     json['tution_id'],
  //     json['tution_name'],
  //     json['tution_address'],
  //     json['pincode'],
  //     json['tution_desc'],
  //     json['is_seat_available'],
  //     json['tution_mode_of_teaching'],
  //     json['image'],
  //   });
  // }
  // factory JoinedTution.fromJson(Map<String, dynamic> json) {
  //   return JoinedTution({
  //     json['tution_id'],
  //     json['tution_name'],
  //     json['tution_address'],
  //     json['pincode'],
  //     json['tution_desc'],
  //     json['is_seat_available'],
  //     json['tution_mode_of_teaching'],
  //     json['image'],
  //   });
  // }
}
