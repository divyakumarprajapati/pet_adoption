import 'package:flutter/material.dart';
import 'package:pet_adoption/app_theme.dart';
import 'package:pet_adoption/components/pet_list_component.dart';
import 'package:pet_adoption/pages/history_page.dart';
import 'package:pet_adoption/preferences/dark_theme_preference.dart';
import 'package:pet_adoption/widgets/pet_list.dart';
import 'package:pet_adoption/widgets/pet_serach_field.dart';

class HomePage extends StatefulWidget {
  static const ROUTE_NAME = 'home_page';
  final PetListComponent petListComponent;
  final DarkThemePreference darkThemePreference;

  HomePage({
    Key? key,
    required this.petListComponent,
    required this.darkThemePreference,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.petListComponent.getPets();
    AppTheme appTheme = AppTheme(
      darkThemeStatus: widget.darkThemePreference.darkThemeStatus,
    );
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: appTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: appTheme.appBarColor,
        elevation: 0,
        actionsIconTheme: IconThemeData(size: 50),
        leading: GestureDetector(
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          child: Container(
            height: 32,
            width: 32,
            margin: EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/app_icon.png'),
              ),
              shape: BoxShape.circle,
            ),
          ),
        ),
        leadingWidth: 50,
        title: Text(
          'Home',
          style: TextStyle(
            color: appTheme.textColor,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                widget.petListComponent.dispose();
                Navigator.pushNamed(
                  context,
                  HistoryPage.ROUTE_NAME,
                );
              },
              icon: Icon(
                Icons.bookmark_sharp,
                size: 36,
                color: appTheme.iconColor,
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: appTheme.backgroundColor,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Theme Settings',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: appTheme.textColor,
                  ),
                ),
                trailing: IconButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.clear,
                    color: appTheme.iconColor,
                    size: 32,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Dark Mode',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: appTheme.textColor,
                  ),
                ),
                trailing: Switch(
                  value: widget.darkThemePreference.darkThemeStatus,
                  activeColor: Colors.white,
                  onChanged: (bool value) {
                    setState(() {
                      widget.darkThemePreference.darkThemeStatus = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child:
                    PetSearchField(petListComponent: widget.petListComponent),
              ),
              Expanded(
                child: PetList(petListComponent: widget.petListComponent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
