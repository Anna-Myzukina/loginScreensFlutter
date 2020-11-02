import 'package:dance/ui-screens/widgets/appBar_screen.dart';
import 'package:dance/ui-screens/widgets/buttons/styled_block_button.dart';
import 'package:dance/ui-screens/widgets/buttons/styled_flat_button.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/helpers/show_checkbox_picker.dart';
import 'package:flutter_material_pickers/helpers/show_radio_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../../theme.dart';
import 'dart:io';

class InstructorProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InstructorProfile(),
    );
  }
}

class InstructorProfile extends StatefulWidget {
  @override
  _InstructorProfileState createState() => _InstructorProfileState();
}

class _InstructorProfileState extends State<InstructorProfile> {
  pickImageFromGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

  double _width;
  Future<File> imageFile;
  List<String> usStates = <String>['New York', 'Alaska', 'California'];
  List<String> gender = ['man', 'woman', 'other'];
  List<String> selectDance = <String>['Salsa', 'Bachata', 'Contemporary'];
  List<String> selectedDance = <String>[];
  var selectedUsState = "Access location";
  int selectedGenderIndex;
  int selectedTypeIndex;
  int selectedAge;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: styledAppbar(context),
      body: Padding(
        padding: EdgeInsets.all(14),
        child: ListView(
          children: <Widget>[
            dancersSelector(),
            SizedBox(height: 10),
            imageRow(),
            SizedBox(height: 10),
            Container(
              height: 60,
              width: _width,
              child: genderSelector(),
            ),
            SizedBox(height: 10),
            locationSelector(),
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
              selectedDance.length < 1 ? 'Your dances ' : 'Dances',
              style: Styles.defaultStyle,
            ),
            trailing: Icon(
              FontAwesomeIcons.chevronRight,
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
              color: selectedGenderIndex == i ? Colors.white : Colors.pink),
        ),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.pink),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        backgroundColor: Colors.transparent,
        selectedColor: Colors.pink,
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
        padding: EdgeInsets.all(16),
      );

      chips.add(
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: choiceChip,
        ),
      );
    }

    return ListView(
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
        style: TextStyle(color: Styles.primaryEasyPurple),
        decoration: InputDecoration(
          hintText:
              'Please describe your dance experience and your teaching style and other interesting facts about you',
          hintStyle: TextStyle(
              color: Styles.primaryEasyPurple, fontWeight: FontWeight.normal),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Styles.primaryEasyPurple),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(color: Styles.primaryEasyPurple),
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
//            Container(
//              margin: EdgeInsets.all(10),
//              decoration: BoxDecoration(
//                color: const Color(0xff7c94b6),
//                image: const DecorationImage(
//                  image: NetworkImage(
//                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
//                  fit: BoxFit.cover,
//                ),
//                border: Border.all(
//                  color: Colors.transparent,
//                  width: 70,
//                ),
//                borderRadius: BorderRadius.circular(12),
//              ),
//            ),
//            Container(
//              margin: EdgeInsets.all(10),
//              decoration: BoxDecoration(
//                color: const Color(0xff7c94b6),
//                image: const DecorationImage(
//                  image: NetworkImage(
//                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
//                  fit: BoxFit.cover,
//                ),
//                border: Border.all(
//                  color: Colors.transparent,
//                  width: 70,
//                ),
//                borderRadius: BorderRadius.circular(12),
//              ),
//            ),
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
              color: Color(0xFFF9437C),
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
                    return const Text(
                      'Error Picking Image',
                      textAlign: TextAlign.center,
                    );
                  } else {
                    return const Text(
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
          color: Styles.primaryEasyPurple,
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
}
