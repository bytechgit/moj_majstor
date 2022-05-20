import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class FilterDrawer extends StatefulWidget {
  const FilterDrawer({Key? key}) : super(key: key);

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

TextStyle items = TextStyle(fontSize: 16);
TextStyle heders = TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
List gradovi = ['Nis', 'Leskovac', 'Krusevac', 'Beograd'];
String? sortirajpo = 'Popularonst';

class _FilterDrawerState extends State<FilterDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  bottom: 10,
                ),
                child: Text(
                  "Filter",
                  style: TextStyle(fontSize: 22),
                ),
              ),
              Divider(
                thickness: 2,
              ),
              Text(
                "Sortiraj po ",
                style: heders,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Wrap(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Popularnost',
                          style: items,
                        ),
                        Radio(
                            value: 'Popularonst',
                            groupValue: sortirajpo,
                            onChanged: (String? value) {
                              setState(() {
                                sortirajpo = value;
                              });
                            }),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Ocena',
                          style: items,
                        ),
                        Radio(
                            value: 'Ocena',
                            groupValue: sortirajpo,
                            onChanged: (String? value) {
                              setState(() {
                                sortirajpo = value;
                              });
                            }),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Recencije',
                          style: items,
                        ),
                        Radio(
                            value: 'Ocena1',
                            groupValue: sortirajpo,
                            onChanged: (String? value) {
                              setState(() {
                                sortirajpo = value;
                              });
                            }),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15, top: 10),
                child: Text(
                  'Odaberi grad',
                  style: heders,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: SizedBox(
                  child: DropdownSearch(
                    // dropdownSearchDecoration: InputDecoration(
                    //labelText: "Menu mode",
                    //  ),
                    dropdownSearchDecoration: InputDecoration(
                      labelText: "Odaberi grad",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    items: gradovi,
                    showSearchBox: true,
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: Image.asset('assets/img/filter.png'),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 4),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Gotovo',
                      style: TextStyle(),
                    ),
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(const BorderSide(
                          width: 2, color: Color.fromARGB(255, 201, 201, 201))),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 4, right: 10),
                  child: TextButton(
                      onPressed: () {},
                      child: Text('Resetuj'),
                      style: ButtonStyle(
                        side: MaterialStateProperty.all(const BorderSide(
                            width: 2,
                            color: Color.fromARGB(255, 201, 201, 201))),
                      )),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
