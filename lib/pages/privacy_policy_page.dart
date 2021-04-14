import 'package:flutter/material.dart';
import 'package:pastebin/components/app_bar/in_page_appbar.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InPageAppBar(),
      body: SingleChildScrollView(
        child: buildBody(context),
      ),
    );
  }

  buildBody(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Privacy Policy",
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(height: 20),
            Text(
                "This privacy policy has been compiled to better serve those who are concerned with how their \'Personally Identifiable Information\' (PII) is being used online. PII, as described in US privacy law and information security, is information that can be used on its own or with other information to identify, contact, or locate a single person, or to identify an individual in context. Please read our privacy policy carefully to get a clear understanding of how we collect, use, protect or otherwise handle your Personally Identifiable Information in accordance with our website."),
            SizedBox(height: 20),
            Text("When do we collect information?",
                style: Theme.of(context).textTheme.headline6),
            Text(
                "We collect information from you when you register on our site or enter information on our site."),
            SizedBox(height: 20),
            Text("How do we use your information?",
                style: Theme.of(context).textTheme.headline6),
            Text(
                "We may use the information we collect from you when you register, make a purchase, sign up for our newsletter, respond to a survey or marketing communication, surf the website, or use certain other site features in the following ways: To personalize your experience and to allow us to deliver the type of content and product offerings in which you are most interested"),
            SizedBox(height: 20),
            Text("Do we use \'cookies\'?",
                style: Theme.of(context).textTheme.headline6),
            Text(
                "We do not use cookies for tracking purposes, You can choose to have your computer warn you each time a cookie is being sent, or you can choose to turn off all cookies. You do this through your browser settings. Since browser is a little different, look at your browser\'s Help Menu to learn the correct way to modify your cookies. If you turn cookies off, some features will be disabled. that make your site experience more efficient and may not function properly. However, you will still be able to place orders ."),
            SizedBox(height: 20),
            Text("Third-party disclosure",
                style: Theme.of(context).textTheme.headline6),
            Text(
                "We do not sell, trade, or otherwise transfer to outside parties your Personally Identifiable Information."),
            SizedBox(height: 20),
            Text("Google", style: Theme.of(context).textTheme.headline6),
            Text(
                "Google\'s advertising requirements can be summed up by Google\'s Advertising Principles. They are put in place to provide a positive experience for users. https://support.google.com/adwordspolicy/answer/1316548?hl=enWe have enabled Google AdSense on our site but we may do so in the future."),
          ],
        ));
  }
}
