import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Palette {
  Palette({ this.name});

  final String name;

  bool get isValid => name != null;
}

final List<Palette> allPalettes = <Palette>[
  Palette(name: 'All'),
  Palette(name: 'Condo/townhome'),
  Palette(name: 'Multy-family'),
  Palette(name: 'Office-Retail store'),
  Palette(name: 'Single family')

];

void main() => runApp(new Keeper());

class Keeper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Keeper',

      home: new KeeperDrawer(),
    );

  }
}


class myActivity extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    var assetsImage = new AssetImage('assets/hotel_room4.png');
    return new MaterialApp(
      home: new Scaffold(
        body:  new Container(

          child: new Container(


            child: new Column(
              children:[
                new Expanded(
                  child: new Container(
                      color: Colors.grey[400],
                      child: new Row(
                          children: [
                              new Expanded(
                                  child: new Container(
                                    child: new Tab(
                                         text: 'ALL',

                                    ),
                                  ),
                                 flex: 1,
                              ),
                              new Expanded(
                                child: new Container(
                                  child: new Tab(
                                        text: 'Condo/townhome',
                                  ),
                                ),
                               flex: 2
                              ),
                              new Expanded(
                                  child: new Container(
                                      child: new Tab(
                                            text: 'Multy-family',
                                      ),
                                  ),
                                  flex: 2
                              ),
                              new Expanded(
                                child: new Container(
                                    child: new Tab(
                                            text: 'Office-Retail store',
                                    ),
                                ),
                                flex: 2
                              ),
                              new Expanded(
                                  child: new Container(
                                      child: new Tab(
                                          text: 'Single family',
                                      ),
                                  ),
                                  flex: 2
                              ),

                          ]
                      )
                  ),
                  //flex: 1,

                ),
                new Expanded(
                  child: new Container(
                    child: TextField(
                      onChanged: (value){

                      },
                      controller: TextEditingController(),
                      decoration: InputDecoration(
                          labelText: "Search",
                          hintText: "Search",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                    )
                  ),
                  flex:1,
                ),
                new Expanded(
                  child: Container(
                    child: ListView(
                      children:[
                        new ListTile(
                          leading: Image(image: assetsImage, width: 48.0, height: 48.0,),
                          isThreeLine: true,
                          subtitle: Text('Address here'),
                          title: Text('Building name'),
                        ),
                        new ListTile(
                          leading: Image(image: assetsImage, width: 48.0, height: 48.0,),
                          isThreeLine: true,
                          subtitle: Text('Address here'),
                          title: Text('Building name'),
                        ),
                        new ListTile(
                          leading: Image(image: assetsImage, width: 48.0, height: 48.0,),
                          isThreeLine: true,
                          subtitle: Text('Address here'),
                          title: Text('Building name'),
                        ),
                        new ListTile(
                          leading: Image(image: assetsImage, width: 48.0, height: 48.0,),
                          isThreeLine: true,
                          subtitle: Text('Address here'),
                          title: Text('Building name'),
                        )
                      ]
                    )
                  ),
                  flex: 4,
                )
              ]
            ),
          ),
        ),
      ),
    );
    
  }
}


class PaletteTabView extends StatelessWidget{
  PaletteTabView({
    Key key,
    this.name,
}):super(key:key);

  final Palette name;

  @override
  Widget build(BuildContext context){





    return ListView(
      scrollDirection: Axis.horizontal,

    );
  }

}

class KeeperDrawer extends StatelessWidget {
  Drawer drawer = new Drawer(
    child: new Column(
      children: <Widget>[
        new AppBar(
          title: new Text('Real Estate'),
          backgroundColor: Colors.indigo[900],
        )
      ],
    ),
  );


  List<Widget>  containers = [
    Container(
      child: myActivity(),


    ),


    Container(
        child: myActivity(),

    )
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
        child: Scaffold(
        drawer: new Drawer(
          child: ListView(
            padding: const EdgeInsets.only(top: 0.0),
            children: <Widget>[
              new AppBar(
                title: Text('Reale Estate'),
                backgroundColor: Colors.indigo[900],
              ),
              new ListTile(
                leading: new Icon(Icons.store_mall_directory),
                title: new Text('Directory'),
                onTap: () => _onListTileTap(context),
              ),
              new ListTile(
                leading: new Icon(Icons.star),
                title: new Text('Favorites'),
                onTap: () => _onListTileTap(context),
              ),
              new ListTile(
                leading: new Icon(Icons.map),
                title: new Text('Map'),
                onTap: () => _onListTileTap(context),
              )
            ],
          ),
        ),
        appBar: new AppBar(
          title: new Text('Properties for sale'),
          backgroundColor: Colors.indigo[900],
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.settings),
                onPressed: (){},
            )
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                  icon: new Icon(Icons.credit_card),
                  text: "For Rent"
              ),
              Tab(
                  icon: new Icon(Icons.shopping_basket),
                  text: "For Sale"
              ),
            ],
          ),

        ),

          body: TabBarView(
              children: containers
          ),



    )
    );

  }

  _onListTileTap(BuildContext context) {
    Navigator.of(context).pop();
    showDialog<Null>(
      context: context,
      child: new AlertDialog(
        title: const Text('Not Implemented'),
        actions: <Widget>[
          new FlatButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}