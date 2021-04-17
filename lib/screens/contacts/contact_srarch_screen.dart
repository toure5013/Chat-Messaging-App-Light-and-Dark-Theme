import 'package:chat/components/recent_search_contacts.dart';
import 'package:chat/constants.dart';
import 'package:chat/screens/search/components/body.dart';
import 'package:flutter/material.dart';

import 'components/contact_card.dart';

class ContactSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("People"),
      ),
      body: Column(
        children: [
          // Appbar search
          Container(
            margin: EdgeInsets.only(bottom: kDefaultPadding),
            padding: EdgeInsets.fromLTRB(
              kDefaultPadding,
              0,
              kDefaultPadding,
              kDefaultPadding,
            ),
            color: kPrimaryColor,
            child: Form(
              child: TextFormField(
                autofocus: true,
                textInputAction: TextInputAction.search,
                onChanged: (value) {
                  // search
                },
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  prefixIcon: Icon(
                    Icons.search,
                    color: kContentColorLightTheme.withOpacity(0.64),
                  ),
                  hintText: "Search",
                  hintStyle: TextStyle(
                    color: kContentColorLightTheme.withOpacity(0.64),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RecentSearchContacts(),
                  SizedBox(height: kDefaultPadding),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: Text(
                      "Phone contacts",
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: Theme.of(context)
                                .textTheme
                                .subtitle2!
                                .color!
                                .withOpacity(0.32),
                          ),
                    ),
                  ),
                  ...List.generate(
                    demoContactsImage.length,
                    (index) => ContactCard(
                      name: "Jenny Wilson",
                      number: "(239) 555-0108",
                      image: demoContactsImage[index],
                      isActive: index.isEven, // for demo
                      press: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
