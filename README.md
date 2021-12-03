# DataBase_AutoThrill
This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

Lab: Write your first Flutter app
Cookbook: Useful Flutter samples
For help getting started with Flutter, view our online documentation, which offers tutorials, samples, guidance on mobile development, and a full API reference.


More Abut Project:

The main.js file should be made in that folder in which your flutter app is placed.
make server folder run then run these commands and you should be in server folder while running these commands in command prompt or do:
mkdir server
cd server
npm init
npm install mysql2 express
npm install -g nodemon
nodemon main.js

Make sure to uppdate pubsec.yaml file by adding HTTP


In Lib>Modules>Http.dart the domain should be your_net_ip:9000 you can find your net ip by typing ipconfig in cmd and for 9000 you can write any number but make sure to update in server>main.js applisten as well.
