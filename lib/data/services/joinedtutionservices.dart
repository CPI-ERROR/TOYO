import 'package:toyo/data/models/joinedtutionmodel.dart';

class JoinedTutionServices {
  static List<JoinedTution> getJoinedTutionList() {
    return [
      new JoinedTution(
        tution_id: 3,
        tution_name: "Muthari Tution Bhandar",
        tution_address: "Near Arunoday Nagar, Delhi",
        pincode: 999001,
        tution_desc:
            "Super 30 is an Indian educational program started in Patna, India under the banner of Ramanujan School of Mathematics. It was founded by Anand Kumar, a mathematics teacher, and Abhayanand, the former D.G.P of Bihar.[1][2] The program selects 30 talented candidates each year from economically underprivileged sections of Indian society and trains them for the JEE. The program is portrayed in the 2019 film, Super 30, starring Hrithik Roshan as Anand Kumar, and his school, have been the subject of several smear campaigns, some of which have been carried in Indian media sources",
        is_seat_available: 1,
        tution_mode_of_teaching: "offline",
        image:
            "https://image.shutterstock.com/image-photo/lovely-girl-wearing-summer-clothes-260nw-1284995812.jpg",
      ),
      new JoinedTution(
        tution_id: 4,
        tution_name: "Kapil Extra Classes",
        tution_address:
            "Near IIIT Baroda, Sabar Campus k pass, Gandhinagar vali gali, Vadodara",
        pincode: 999001,
        tution_desc:
            "Super 30 is an Indian educational program started in Patna, India under the banner of Ramanujan School of Mathematics. It was founded by Anand Kumar, a mathematics teacher, and Abhayanand, the former D.G.P of Bihar.[1][2] The program selects 30 talented candidates each year from economically underprivileged sections of Indian society and trains them for the JEE. The program is portrayed in the 2019 film, Super 30, starring Hrithik Roshan as Anand Kumar, and his school, have been the subject of several smear campaigns, some of which have been carried in Indian media sources",
        is_seat_available: 1,
        tution_mode_of_teaching: "online",
        image: "https://c.stocksy.com/a/jV3000/z9/13499.jpg",
      ),
    ];
  }

  // Tution getById(int id) =>
  //     items.firstWhere((element) => element.tution_id == id, orElse: null);

  // Tution getByPosition(int pos) => items[pos];
}
