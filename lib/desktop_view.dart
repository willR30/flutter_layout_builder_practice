import 'package:flutter/material.dart';

class DesktopView extends StatefulWidget {
  const DesktopView({super.key});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  int currentPageIndex =
      0; // Asegúrate de definir currentPageIndex fuera del Widget build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: currentPageIndex,
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.notifications_sharp),
                selectedIcon: Icon(Icons.notifications_sharp),
                label: Text('Notifications'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.messenger_sharp),
                selectedIcon: Icon(Icons.messenger_sharp),
                label: Text('Messages'),
              ),
            ],
          ),
          const VerticalDivider(
              thickness: 1,
              width: 1), // Añade un separador entre el rail y el contenido
          Expanded(
            child: Center(
              child: _buildPage(currentPageIndex),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return homeView();
      case 1:
        return notificationView();
      case 2:
        return messagesView();
      default:
        return homeView(); // Puedes retornar un widget por defecto o un mensaje de error aquí
    }
  }

  Widget homeView() {
    return const SizedBox.expand(
      child: Center(
        child: Text(
          'Home page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  Widget notificationView() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.notifications_sharp),
              title: Text('Notification 1'),
              subtitle: Text('This is a notification'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.notifications_sharp),
              title: Text('Notification 2'),
              subtitle: Text('This is a notification'),
            ),
          ),
        ],
      ),
    );
  }

  Widget messagesView() {
    return ListView.builder(
      reverse: true,
      itemCount: 2,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Text('Hello',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          );
        }
        return Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: const Text('Hi!',
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ),
        );
      },
    );
  }
}
