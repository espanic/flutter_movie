import 'package:flutter/material.dart';
import 'package:flutter_movie/pages/grid_page.dart';
import 'package:flutter_movie/pages/list_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedTapIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      bottomNavigationBar: _buildBottomNavigationBar(),
      body: _selectedTapIndex == 0 ? ListPage() : GridPage(),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          _selectedTapIndex = index;
        });
      },
      currentIndex: _selectedTapIndex,
      backgroundColor: Colors.grey[200],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.view_list),
          label: "List",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.grid_on),
          label: "Grid",
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: Text('Movie'),
      leading: null,
      actions: [
        PopupMenuButton(
          icon: Icon(Icons.sort),
          onSelected: (value) {
            if (value == 0)
              print("예매율 순");
            else if (value == 1) {
              print("큐레이션");
            } else {
              print("최신순");
            }
          },
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                value: 0,
                child: Text("예매율 순"),
              ),
              PopupMenuItem(
                value: 1,
                child: Text("큐레이션"),
              ),
              PopupMenuItem(
                value: 2,
                child: Text("최신순"),
              )
            ];
          },
        )
      ],
    );
  }
}
