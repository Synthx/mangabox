import 'package:flutter/material.dart';

const kDefaultGridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
  crossAxisCount: 2,
  mainAxisSpacing: 10,
  crossAxisSpacing: 10,
  childAspectRatio: kCardRatio,
);

const kPictureRatio = 307 / 480;
const kCardRatio = 0.55;
