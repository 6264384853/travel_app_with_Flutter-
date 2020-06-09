class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;

  Hotel({this.imageUrl, this.name, this.address, this.price});
}

final List<Hotel> hotels = [
  Hotel(
      imageUrl: 'assets/hotelrishi.jpg',
      name: 'Rishi Regency Hotel',
      address: ' Opp. State Bank, Jabalpur 482001 India',
      price:  3412 ),
  Hotel(
      imageUrl: 'assets/hotelsatya.jpg',
      name: ' Hotel Satya Ashoka',
      address: ' Opp Wright Town Stadium, Jabalpur 482002 India',
      price: 4480),
  Hotel(
      imageUrl: 'assets/hoteltreebo.jpg',
      name: ' Annpurna Inn',
      address: ' 1292 1 Napier Town Near Ashish Hospital, Jabalpur 482001 India',
      price: 3026),
  Hotel(
      imageUrl: 'assets/hotelrahul.jpg',
      name: ' Hotel Rahul',
      address: ' Napier Town Opposite Jyoti Theatre, Jabalpur 482001 India',
      price: 4032),

];
