class AvailableDoctor {
  final String? name, sector, patients, image;
  final int? experience;

  AvailableDoctor({this.name,this.sector,this.patients,this.image,this.experience});
}

List<AvailableDoctor> availableDoctorslist = [
  AvailableDoctor(
    name: "Dr. Dheeraj Sharma",
    sector: "Medical Specialist",
    experience: 8,
    patients: "100",
    image: "assets/images/image8.png"
  ),
  AvailableDoctor(
    name: "Dr. Asma Khan",
    sector: "Medicine Specialist",
    experience: 5,
    patients: '2.7K',
    image: "assets/images/image7.png",
  ),
  AvailableDoctor(
    name: "Dr. Kiran Shakia",
    sector: "Medicine Specialist",
    experience: 5,
    patients: '2.7K',
    image: "assets/images/image3.png",
  ),
  AvailableDoctor(
    name: "Dr. Masuda Khan",
    sector: "Medicine Specialist",
    experience: 5,
    patients: '2.7K',
    image: "assets/images/image2.png",
  ),
  AvailableDoctor(
    name: "Dr. Johir Raihan",
    sector: "Medicine Specialist",
    experience: 5,
    patients: '2.7K',
    image: "assets/images/image4.png",
  ),
];