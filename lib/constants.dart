import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertok/view/screens/add_videos.dart';

// getRandomColor() => Colors.primaries[Random().nextInt(Colors.primaries.length)];

getRandomColor() => [
  Colors.blueAccent,
  Colors.redAccent,
  Colors.greenAccent,
][Random().nextInt(3)];

// COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

var pageindex = [
  Text('Home'),
  Text('Search'),
  addVideoScreen(),
  Text('Messages'),
  Text('Profile')
];