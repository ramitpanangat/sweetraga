import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  Widget contactTile(String title, IconData icon, String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 18),
        ),
        trailing: MaterialButton(
          color: Colors.green[800],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          onPressed: () async {
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw "Can't launch $url";
            }
          },
          child: FaIcon(
            icon,
            size: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget contactTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).accentColor),
      ),
    );
  }

  Widget socialButton(String title, IconData icon, Color color, String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextButton.icon(
          label: Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          icon: FaIcon(
            icon,
            color: Colors.white,
          ),
          style: TextButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          onPressed: () async {
            if (await canLaunch(url)) {
              await launch(url);
            } else {
              throw "Can't launch $url";
            }
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Contacts",
        style: Theme.of(context).textTheme.headline1,
      )),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          contactTitle("Phone"),
          contactTile(
              "+919924995300", FontAwesomeIcons.phoneAlt, "tel:+919924995300"),
          contactTile(
              "+919924992300", FontAwesomeIcons.phoneAlt, "tel:+919924992300"),
          contactTitle("Email"),
          contactTile("contact@sweetraga.com", FontAwesomeIcons.solidEnvelope,
              "mailto:contact@sweetraga.com"),
          contactTitle("Website"),
          contactTile("www.sweetraga.com", FontAwesomeIcons.globe,
              "http://www.sweetraga.com"),
          contactTitle("Keep in touch"),
          SizedBox(height: 15),
          socialButton("Facebook", FontAwesomeIcons.facebookSquare,
              Colors.blue[900], "https://www.facebook.com/sweetragaindia/"),
          socialButton("Instagram", FontAwesomeIcons.instagram, Colors.pink,
              "https://www.instagram.com/sweet.raga/"),
          socialButton("WhatsApp", FontAwesomeIcons.whatsapp, Colors.green[600],
              "whatsapp://send?phone=919924992300")
        ],
      ),
    );
  }
}
