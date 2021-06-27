import 'package:toyo/data/models/tutionmodel.dart';

class TutionServices {
  static List<TutionData> getTutionList() {
    return [
      new TutionData(
        tution_id: "1",
        tution_name: "Nirala Coaching Center",
        tution_address: "Mandir ke piche vali gali, Patna , Bihar",
        pincode: 999001,
        tution_desc:
            "Super 30 is an Indian educational program started in Patna, India under the banner of Ramanujan School of Mathematics. It was founded by Anand Kumar, a mathematics teacher, and Abhayanand, the former D.G.P of Bihar.[1][2] The program selects 30 talented candidates each year from economically underprivileged sections of Indian society and trains them for the JEE. The program is portrayed in the 2019 film, Super 30, starring Hrithik Roshan as Anand Kumar, and his school, have been the subject of several smear campaigns, some of which have been carried in Indian media sources",
        is_seat_available: 1,
        tution_mode_of_teaching: 1,
        image: "https://images.indianexpress.com/2018/07/coaching.jpg",
      ),
      new TutionData(
        tution_id: "2",
        tution_name: "Nishant Classes",
        tution_address:
            "Near Jantar Mantar Palace, Hawai Mahal, Sanganer Road, Jaipur",
        pincode: 999002,
        tution_desc:
            "Super 30 is an Indian educational program started in Patna, India under the banner of Ramanujan School of Mathematics. It was founded by Anand Kumar, a mathematics teacher, and Abhayanand, the former D.G.P of Bihar.[1][2] The program selects 30 talented candidates each year from economically underprivileged sections of Indian society and trains them for the JEE. The program is portrayed in the 2019 film, Super 30, starring Hrithik Roshan as Anand Kumar, and his school, have been the subject of several smear campaigns, some of which have been carried in Indian media sources",
        is_seat_available: 1,
        tution_mode_of_teaching: 0,
        image:
            "https://content.jdmagicbox.com/comp/kolkata/n1/033pxx33.xx33.151205154613.q6n1/catalogue/jha-coaching-class-new-alipur-kolkata-tutorials-wn0iccdl0k.jpg?clr=333333",
      ),
      new TutionData(
        tution_id: "3",
        tution_name: "Muthari Tution Bhandar",
        tution_address: "Near Arunoday Nagar, Delhi",
        pincode: 999001,
        tution_desc:
            "Super 30 is an Indian educational program started in Patna, India under the banner of Ramanujan School of Mathematics. It was founded by Anand Kumar, a mathematics teacher, and Abhayanand, the former D.G.P of Bihar.[1][2] The program selects 30 talented candidates each year from economically underprivileged sections of Indian society and trains them for the JEE. The program is portrayed in the 2019 film, Super 30, starring Hrithik Roshan as Anand Kumar, and his school, have been the subject of several smear campaigns, some of which have been carried in Indian media sources",
        is_seat_available: 1,
        tution_mode_of_teaching: 1,
        image:
            "https://image.shutterstock.com/image-photo/lovely-girl-wearing-summer-clothes-260nw-1284995812.jpg",
      ),
      new TutionData(
        tution_id: "4",
        tution_name: "Kapil Extra Classes",
        tution_address:
            "Near IIIT Baroda, Sabar Campus k pass, Gandhinagar vali gali, Vadodara",
        pincode: 999001,
        tution_desc:
            "Super 30 is an Indian educational program started in Patna, India under the banner of Ramanujan School of Mathematics. It was founded by Anand Kumar, a mathematics teacher, and Abhayanand, the former D.G.P of Bihar.[1][2] The program selects 30 talented candidates each year from economically underprivileged sections of Indian society and trains them for the JEE. The program is portrayed in the 2019 film, Super 30, starring Hrithik Roshan as Anand Kumar, and his school, have been the subject of several smear campaigns, some of which have been carried in Indian media sources",
        is_seat_available: 1,
        tution_mode_of_teaching: 0,
        image: "https://c.stocksy.com/a/jV3000/z9/13499.jpg",
      ),
      new TutionData(
        tution_id: "5",
        tution_name: "Arunoday Kumar Classes of UPSC",
        tution_address:
            "Ek mint me UPSC nikal dunga classes k pass vali building, Delhi",
        pincode: 999002,
        tution_desc:
            "Super 30 is an Indian educational program started in Patna, India under the banner of Ramanujan School of Mathematics. It was founded by Anand Kumar, a mathematics teacher, and Abhayanand, the former D.G.P of Bihar.[1][2] The program selects 30 talented candidates each year from economically underprivileged sections of Indian society and trains them for the JEE. The program is portrayed in the 2019 film, Super 30, starring Hrithik Roshan as Anand Kumar, and his school, have been the subject of several smear campaigns, some of which have been carried in Indian media sources",
        is_seat_available: 1,
        tution_mode_of_teaching: 1,
        image:
            "https://foreignpolicy.com/wp-content/uploads/2020/07/india-coronavirus-education-girls-GettyImages-1227704551-1.jpg",
      )
    ];
  }

  // Tution getById(int id) =>
  //     items.firstWhere((element) => element.tution_id == id, orElse: null);

  // Tution getByPosition(int pos) => items[pos];
}
