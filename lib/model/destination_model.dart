import 'package:flutter/material.dart';

import 'activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;

  Destination({
    this.imageUrl,
    this.city,
    this.country,
    this.description,
    this.activities,
  });
}

List<Activity> activities = [
  Activity(
    imageUrl: 'assets/bagri-dam.jpg',
    name: 'Bargi Dam',
    type: 'Sight seeing tour',
    startTimes: ['8:00 am', '7:00 pm'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: "assets/mdn-mahal.jpg",
    name: 'Madan Mahal Fort',
    type: 'Sight seeing tour',
    startTimes: ['7:00 am' , '6:00 pm'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: "assets/blncerock.jpg",
    name: ' Balance Rock',
    type: 'Sight seeing tour',
    startTimes: ['9:00 am', '10:00 pm'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: "assets/kchnarcity.jpg",
    name: 'Kachnar City ',
    type: 'Sight seeing tour',
    startTimes: ['6:00 am', '9:00 pm'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: "assets/seaworld.jpg",
    name: 'Sea World Water Park',
    type: 'Sight seeing tour',
    startTimes: ['8:00 am', '7:00 pm'],
    rating: 5,
    price: 30,
  ),
];



List<Destination> destinations = [
  Destination(
    imageUrl: 'assets/jabalpur.jpg',
    city: 'Jabalpur',
    country: 'Madhya Pradesh',
    description: 'Visit to Sanskar Dhani of India, Jabalpur (Marble Rock City).',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/indore.jpg',
    city: 'Indore',
    country: 'Madhya Pradesh',
    description: 'Find out all about indore and explore indore city with the best city guide of ... ',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/bhopal.jpg',
    city: 'Bhopal',
    country: 'Madhya Pradesh',
    description: 'Bhopal welcomes all for visiting Taj-ul-Masajid for seeing its beauty and getting in touch with its history. ..',
    activities: activities,
  ),
  Destination(
    imageUrl: 'assets/gwalioer.jpg',
    city: 'Gwalior',
    country: 'Madhya Pradesh',
    description: 'See most popular tourist places to visit in Gwalior, top things to do, shopping ... by Sir Michael Filose under the guidance of Jayajirao to welcome Edward VII.',
    activities: activities,
  ),
];
