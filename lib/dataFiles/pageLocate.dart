import 'package:flutter/cupertino.dart';
import 'package:sweetraga/dataFiles/companyPolicies.dart';
import 'package:sweetraga/dataFiles/productInfo.dart';
import 'package:sweetraga/pages/aboutUs.dart';
import 'package:sweetraga/pages/cartPage.dart';
import 'package:sweetraga/pages/companyPage.dart';
import 'package:sweetraga/pages/assortedDetailPage.dart';
import 'package:sweetraga/pages/contacts.dart';
import 'package:sweetraga/pages/favourites.dart';
import 'package:sweetraga/pages/forgotPass.dart';
import 'package:sweetraga/pages/fullMenu.dart';
import 'package:sweetraga/pages/home.dart';
import 'package:sweetraga/pages/loginPage.dart';
import 'package:sweetraga/pages/productDetails.dart';
import 'package:sweetraga/pages/signUp.dart';
import 'package:sweetraga/pages/policyPage.dart';

Map<String, WidgetBuilder> pages = {
  "/": (context) => HomePage(),
  "/login": (context) => LoginPage(),
  "/signup": (context) => SignUpPage(),
  "/forgotPassword": (context) => ForgotPassword(),
  "/contacts": (context) => ContactPage(),
  "/favourite": (context) => FavouritePage(),
  "/company": (context) => CompanyPage(),
  "/aboutus": (context) => Aboutus(),
  "/cancellation": (context) =>
      PolicyPage(title: "Cancellation Policy", content: cancellation),
  "/terms": (context) =>
      PolicyPage(title: "Terms & Conditions", content: termsConditions),
  "/shipping": (context) =>
      PolicyPage(title: "Shipping & Delivery", content: shipping),
  "/privacy": (context) =>
      PolicyPage(title: "Privacy Policy", content: privacy),

  "/cart": (context) => CartPage(),

  //Full Menus
  "/ladoos": (context) => FullMenu(items: assorted[0]),
  "/scubes": (context) => FullMenu(items: assorted[1]),
  "/chocolates": (context) => FullMenu(items: assorted[2]),

  //Product Detail Pages
  //Assorted
  "/ladooAssorted": (context) => AssortedDetailPage(
        items: assorted[0],
        listItems: assorted[0]["menu"],
        gallery: assorted[0]["gallery"],
      ),
  "/scubesAssorted": (context) => AssortedDetailPage(
      items: assorted[1],
      listItems: assorted[1]["menu"],
      gallery: assorted[1]["gallery"]),
  "/chocolateAssorted": (context) => AssortedDetailPage(
      items: assorted[2],
      listItems: assorted[2]["menu"],
      gallery: assorted[2]["gallery"]),
  "/gujiyaAssorted": (context) => AssortedDetailPage(
      items: assorted[3],
      listItems: assorted[3]["menu"],
      gallery: assorted[3]["gallery"]),

  //Individuals
  "/ladooChocolateAlmondFantasy": (context) => ProductDetails(
      items: ladoos[0],
      ingredients: ladoos[0]["ingredients"],
      gallery: ladoos[0]["gallery"]),
  "/ladooRoyalPistaPleasure": (context) => ProductDetails(
      items: ladoos[1],
      ingredients: ladoos[1]["ingredients"],
      gallery: ladoos[1]["gallery"]),
  "/ladooBrownSugarBesan": (context) => ProductDetails(
      items: ladoos[2],
      ingredients: ladoos[2]["ingredients"],
      gallery: ladoos[2]["gallery"]),
  "/ladooDillTillMotichur": (context) => ProductDetails(
      items: ladoos[3],
      ingredients: ladoos[3]["ingredients"],
      gallery: ladoos[3]["gallery"]),
  "/ladooOatsWalnutHoney": (context) => ProductDetails(
      items: ladoos[4],
      ingredients: ladoos[4]["ingredients"],
      gallery: ladoos[4]["gallery"]),
  "/ladooRoseRoyale": (context) => ProductDetails(
      items: ladoos[5],
      ingredients: ladoos[5]["ingredients"],
      gallery: ladoos[5]["gallery"]),
  "/ladooDryFruitBonanza": (context) => ProductDetails(
      items: ladoos[6],
      ingredients: ladoos[6]["ingredients"],
      gallery: ladoos[6]["gallery"]),
  "/ladooKajuDelight": (context) => ProductDetails(
      items: ladoos[7],
      ingredients: ladoos[7]["ingredients"],
      gallery: ladoos[7]["gallery"]),
  "/ladooDateAnjeerPower": (context) => ProductDetails(
      items: ladoos[8],
      ingredients: ladoos[8]["ingredients"],
      gallery: ladoos[8]["gallery"]),
  "/scubeBlueberryBonanaza": (context) => ProductDetails(
      items: scubes[0],
      ingredients: scubes[0]["ingredients"],
      gallery: scubes[0]["gallery"]),
  "/scubeChocolateAlmondCube": (context) => ProductDetails(
      items: scubes[1],
      ingredients: scubes[1]["ingredients"],
      gallery: scubes[1]["gallery"]),
  "/scubeClassicBesanCube": (context) => ProductDetails(
      items: scubes[2],
      ingredients: scubes[2]["ingredients"],
      gallery: scubes[2]["gallery"]),
  "/scubePistaGold": (context) => ProductDetails(
      items: scubes[3],
      ingredients: scubes[3]["ingredients"],
      gallery: scubes[3]["gallery"]),
  "/scubeHealthyCube": (context) => ProductDetails(
      items: scubes[4],
      ingredients: scubes[4]["ingredients"],
      gallery: scubes[4]["gallery"]),
  "/scubeBakedAlmondDate": (context) => ProductDetails(
      items: scubes[5],
      ingredients: scubes[5]["ingredients"],
      gallery: scubes[5]["gallery"]),
  "/scubeBakedCashewAnjeer": (context) => ProductDetails(
      items: scubes[6],
      ingredients: scubes[6]["ingredients"],
      gallery: scubes[6]["gallery"]),
  "/scubeRoseCoconut": (context) => ProductDetails(
      items: scubes[7],
      ingredients: scubes[7]["ingredients"],
      gallery: scubes[7]["gallery"]),
  "/scubeCashewButterscocth": (context) => ProductDetails(
      items: scubes[8],
      ingredients: scubes[8]["ingredients"],
      gallery: scubes[8]["gallery"]),
  "/chocoCofeeCashew": (context) => ProductDetails(
      items: chocolates[0],
      ingredients: chocolates[0]["ingredients"],
      gallery: chocolates[0]["gallery"]),
  "/chocoOrangeCashewCoconut": (context) => ProductDetails(
      items: chocolates[1],
      ingredients: chocolates[1]["ingredients"],
      gallery: chocolates[1]["gallery"]),
  "/chocoOreoOrange": (context) => ProductDetails(
      items: chocolates[2],
      ingredients: chocolates[2]["ingredients"],
      gallery: chocolates[2]["gallery"]),
  "/chocoRoastedAlmond": (context) => ProductDetails(
      items: chocolates[3],
      ingredients: chocolates[3]["ingredients"],
      gallery: chocolates[3]["gallery"]),
  "/chocoRoseDryFruit": (context) => ProductDetails(
      items: chocolates[4],
      ingredients: chocolates[4]["ingredients"],
      gallery: chocolates[4]["gallery"]),
  "/chocoDriedStawberry": (context) => ProductDetails(
      items: chocolates[5],
      ingredients: chocolates[5]["ingredients"],
      gallery: chocolates[5]["gallery"]),
};
