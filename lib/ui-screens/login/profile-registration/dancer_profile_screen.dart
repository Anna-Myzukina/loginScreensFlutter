import 'package:dance/ui-screens/widgets/appBar_screen.dart';
import 'package:dance/ui-screens/widgets/buttons/styled_block_button.dart';
import 'package:dance/ui-screens/widgets/buttons/styled_flat_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_checkbox_picker.dart';
import 'package:flutter_material_pickers/helpers/show_number_picker.dart';
import 'package:flutter_material_pickers/helpers/show_radio_picker.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import '../../../theme.dart';

class DancerProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DancerProfile(),
    );
  }
}

class DancerProfile extends StatefulWidget {
  @override
  _DancerProfileState createState() => _DancerProfileState();
}

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Purpose',
    );
  });
}

class _DancerProfileState extends State<DancerProfile> {
  pickImageFromGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

  double _width;
  Future<File> imageFile;
  List<String> usStates = <String>['New York', 'Alaska', 'California'];
  List<String> gender = ['man', 'woman', 'other'];
  List<String> types = ['leader', 'follower'];
  List<String> selectDance = <String>['Salsa', 'Bachata', 'Contemporary'];
  List<String> selectedDance = <String>[];
  List<Item> _data = generateItems(1);
  var selectedUsState = "Access location";
  int selectedGenderIndex;
  int selectedTypeIndex;
  int selectedAge;
  var forFun = false;
  var practice = false;
  var competition = false;
  var performance = false;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: styledAppbar(context),
      body: Padding(
        padding: EdgeInsets.all(14),
        child: ListView(
          children: <Widget>[
            imageRow(),
            SizedBox(height: 10),
            videoSelector(),
            SizedBox(height: 10),
            Container(
              height: 60,
              child: genderSelector(),
            ),
            SizedBox(height: 10),
            heightSelector(),
            SizedBox(height: 10),
            locationSelector(),
            SizedBox(height: 10),
            dancersSelector(),
            SizedBox(height: 10),
            purposeSelector(),
            SizedBox(height: 10),
            Container(
              height: 60,
              child: typeSelector(),
            ),
            SizedBox(height: 10),
            aboutYou(),
            SizedBox(height: 10),
            ConnectInstagram(),
            SizedBox(height: 10),
            ConnectSpotify(),
            SizedBox(height: 10),
            ConnectAppleMusic(),
            SizedBox(height: 10),
            ConnectSnapchat(),
            SizedBox(height: 10),
            next(),
          ],
        ),
      ),
    );
  }

  Widget videoSelector() {
    return Container(
      child: Column(
        children: [
          ListTile(
            title: Text(
              "Video",
              style: Styles.defaultStyle,
            ),
            trailing: Icon(
              FontAwesomeIcons.plus,
              color: Colors.pink,
              size: 25,
            ),
            onTap: () {
              pickImageFromGallery(ImageSource.gallery);
            },
          ),
          Divider(),
        ],
      ),
    );
  }

  Widget heightSelector() {
    return Container(
      margin: EdgeInsets.all(0),
      child: Column(
        children: [
          ListTile(
            title: Text(
              "Height",
              style: Styles.defaultStyle,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  selectedAge == null ? '' : selectedAge.toString(),
                ),
                Icon(
                  FontAwesomeIcons.chevronRight,
                  color: Colors.pink,
//                  size: 25,
                ),
              ],
            ),
            onTap: () => showMaterialNumberPicker(
                context: context,
                title: "Pick Your Age",
                maxNumber: 100,
                minNumber: 14,
                confirmText: "Count me in",
                cancelText: "Negatory",
                selectedNumber: selectedAge,
                onChanged: (value) => {
                      setState(() => {
                            selectedAge = value,
                          }),
                    }),
          ),
          Divider(),
        ],
      ),
    );
  }

  Widget dancersSelector() {
    return Container(
      child: Column(
        children: [
          Container(
            height: selectedDance.length < 1 ? 0 : selectedDance.length * 80.0,
            child: listTieGenerator(),
          ),
          ListTile(
            title: Text(
              selectedDance.length < 1 ? 'Your top 5 dances ' : 'Dances',
              style: Styles.defaultStyle,
            ),
            trailing: Icon(
              FontAwesomeIcons.plus,
              color: Colors.pink,
              size: 25,
            ),
            onTap: () => showMaterialCheckboxPicker(
              context: context,
              title: "Your top 5 dances",
              items: selectDance,
              selectedItems: selectedDance,
              onChanged: (value) => setState(() => selectedDance = value),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  Widget purposeSelector() {
    return ExpansionTile(
      title: Text(
        'Purpose',
        style: Styles.defaultStyle,
      ),
      children: <Widget>[
        checkbox("For Fun", forFun),
        checkbox("Practice", practice),
        checkbox("Competition", competition),
        checkbox("Performance", performance),
      ],
    );
  }

  Widget locationSelector() {
    return Container(
      margin: EdgeInsets.all(0),
      child: Column(
        children: [
          ListTile(
            title: Text(
              "Location",
              style: Styles.defaultStyle,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  selectedUsState == null ? '' : selectedUsState,
                  textAlign: TextAlign.right,
                  style: Styles.pinkTextStyle,
                ),
                Icon(
                  FontAwesomeIcons.mapMarkerAlt,
                  color: Colors.pink,
                  size: 25,
                ),
              ],
            ),
            onTap: () => showMaterialRadioPicker(
              context: context,
              title: "Pick Your City",
              items: usStates,
              selectedItem: selectedUsState,
              onChanged: (value) => setState(() => selectedUsState = value),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  Widget genderSelector() {
    List<Widget> chips = new List();
    for (int i = 0; i < gender.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected: selectedGenderIndex == i,
        label: Text(
          gender[i],
          style: TextStyle(
              color:
                  selectedGenderIndex == i ? Colors.white : Styles.primaryPink),
        ),
        // labelPadding: EdgeInsets.fromLTRB(20, 18.5, 20, 16),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.pink),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        backgroundColor: Colors.transparent,
        selectedColor: Styles.primaryPink,
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              selectedGenderIndex = i;
              print(gender[i]);
              if (gender[i] == 'other') {
                print('bales');
              }
            }
          });
        },
        padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
      );

      chips.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 3),
          child: choiceChip,
        ),
      );
    }

    return ListView(
      scrollDirection: Axis.horizontal,
      children: chips,
    );
  }

  Widget typeSelector() {
    List<Widget> chips = new List();
    for (int i = 0; i < types.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        selected: selectedTypeIndex == i,
        label: Text(
          types[i],
          style: TextStyle(
              color:
                  selectedTypeIndex == i ? Colors.white : Styles.primaryPink),
        ),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.pink),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        backgroundColor: Colors.transparent,
        selectedColor: Styles.primaryPink,
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              selectedTypeIndex = i;
              print(types[i]);
            }
          });
        },
        padding: EdgeInsets.fromLTRB(40, 16, 40, 16),
      );

      chips.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: choiceChip,
        ),
      );
    }

    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      children: chips,
    );
  }

  Widget aboutYou() {
    return Container(
      child: TextField(
        minLines: 5,
        maxLines: 15,
        autocorrect: false,
        style: TextStyle(color: Styles.primaryDarkWhite),
        decoration: InputDecoration(
          hintText: 'Info about you',
          hintStyle: TextStyle(color: Styles.primaryDarkWhite),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Styles.primaryDarkWhite),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Styles.primaryDarkWhite),
          ),
        ),
      ),
    );
  }

  Widget imageRow() {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Colors.transparent,
                  width: 70,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: Colors.transparent,
                  width: 70,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Container(
                // width: 70,
                child: addImage())
          ],
        ),
      ),
    );
  }

  Widget addImage() {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(12),
      dashPattern: [10, 10],
      color: Styles.primaryPink,
      child: Container(
        height: 140,
        width: 140,
        color: Styles.primary30,
        alignment: Alignment.center,
        child: InkWell(
          child: Text(
            '+',
            style: TextStyle(
              fontFamily: 'SF UI Text',
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.normal,
              color: Styles.primaryPink,
              fontSize: 30,
            ),
          ),
          onTap: () {
            pickImageFromGallery(ImageSource.gallery);
          },
        ),
      ),
    );
  }

  Widget showImage() {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            Container(
              child: FutureBuilder<File>(
                future: imageFile,
                builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.data != null) {
                    return Image.file(
                      snapshot.data,
                      width: 300,
                      height: 300,
                    );
                  } else if (snapshot.error != null) {
                    return Text(
                      'Error Picking Image',
                      textAlign: TextAlign.center,
                    );
                  } else {
                    return Text(
                      'No Image Selected',
                      textAlign: TextAlign.center,
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget ConnectInstagram() {
    return Container(
      child: StyledBlockButton(
        text: 'Connect your Instagram',
        onPressed: () => {},
        color: Styles.primaryInstagram,
        width: _width,
        textColor: Colors.white,
        icon: FontAwesomeIcons.instagram,
      ),
    );
  }

  Widget ConnectSpotify() {
    return Container(
      child: StyledBlockButton(
        text: 'Connect your Spotify     ',
        onPressed: () => {},
        color: Styles.primarySpotify,
        width: _width,
        textColor: Colors.white,
        icon: FontAwesomeIcons.spotify,
      ),
    );
  }

  Widget ConnectAppleMusic() {
    return Container(
      child: StyledBlockButton(
        text: 'Connect your Apple music',
        onPressed: () => {},
        color: Styles.primaryAppleMusic,
        width: _width,
        textColor: Colors.white,
        icon: FontAwesomeIcons.music,
      ),
    );
  }

  Widget ConnectSnapchat() {
    return Container(
      child: StyledBlockButton(
        text: 'Connect your Snapchat',
        onPressed: () => {},
        color: Styles.primarySnapchat,
        width: _width,
        textColor: Colors.black,
        icon: FontAwesomeIcons.snapchatGhost,
      ),
    );
  }

  Widget next() {
    return Container(
      child: StyledFlatButton(
        '>>>',
        onPressed: () => {},
      ),
    );
  }

  Widget listTieGenerator() {
    List<Widget> til = new List();
    for (int i = 0; i < selectedDance.length; i++) {
      ListTile listTitle = ListTile(
        title: Text(
          selectedDance[i].toString(),
          style: Styles.defaultStyle,
        ),
        subtitle: Text(
          'Pro',
          style: Styles.p,
        ),
        trailing: Icon(
          FontAwesomeIcons.times,
          color: Styles.primaryEasyBlue,
          size: 25,
        ),
      );
      til.add(
        Container(
          child: listTitle,
        ),
      );
    }

    return ListView(
      children: til,
    );
  }

  Widget checkbox(String title, boolValue) {
    return Theme(
      data: Theme.of(context).copyWith(
        unselectedWidgetColor: Styles.primaryPink,
      ),
      child: CheckboxListTile(
        value: boolValue,
        activeColor: Styles.primaryPink,
        title: Text(title),
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (bool value) {
          setState(() {
            switch (title) {
              case "For Fun":
                forFun = value;
                break;
              case "Practice":
                practice = value;
                break;
              case "Competition":
                competition = value;
                break;
              case "Performance":
                performance = value;
                break;
            }
          });
          print(title);
        },
      ),
    );
  }
}
