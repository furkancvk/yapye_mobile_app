import 'package:flutter/material.dart';

class ProfileMenu extends StatefulWidget {
  const ProfileMenu({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileMenu();
}

class _ProfileMenu extends State<ProfileMenu> {
  final List<bool> _isExpanded = [
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _isExpanded[index] = !isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return const ListTile(
              title: Text(
                "Pazartesi",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            );
          },
          body: const ListTile(
            title: Text('Item 1 child'),
            subtitle: Text('Details goes here'),
          ),
          isExpanded: _isExpanded[0],
        ),
        ExpansionPanel(
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return const ListTile(
              title: Text(
                "Salı",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            );
          },
          body: const ListTile(
            title: Text('Item 1 child'),
            subtitle: Text('Details goes here'),
          ),
          isExpanded: _isExpanded[1],
        ),
        ExpansionPanel(
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return const ListTile(
              title: Text(
                "Çarşamba",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            );
          },
          body: const ListTile(
            title: Text('Item 1 child'),
            subtitle: Text('Details goes here'),
          ),
          isExpanded: _isExpanded[2],
        ),
        ExpansionPanel(
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return const ListTile(
              title: Text(
                "Perşembe",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            );
          },
          body: const ListTile(
            title: Text('Item 1 child'),
            subtitle: Text('Details goes here'),
          ),
          isExpanded: _isExpanded[3],
        ),
        ExpansionPanel(
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return const ListTile(
              title: Text(
                "Cuma",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            );
          },
          body: const ListTile(
            title: Text('Item 1 child'),
            subtitle: Text('Details goes here'),
          ),
          isExpanded: _isExpanded[4],
        ),
        ExpansionPanel(
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return const ListTile(
              title: Text(
                "Cumartesi",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            );
          },
          body: const ListTile(
            title: Text('Item 1 child'),
            subtitle: Text('Details goes here'),
          ),
          isExpanded: _isExpanded[5],
        ),
        ExpansionPanel(
          canTapOnHeader: true,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return const ListTile(
              title: Text(
                "Pazar",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            );
          },
          body: const ListTile(
            title: Text('Item 1 child'),
            subtitle: Text('Details goes here'),
          ),
          isExpanded: _isExpanded[6],
        ),
      ],
    );
  }
}
