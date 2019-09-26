import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:wallet_ui/modal/item.dart';
import 'package:wallet_ui/modal/menu.dart';
import 'package:wallet_ui/ui/other_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title});

  String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: Appbar(title: widget.title),
      body: Stack(
        children: <Widget>[
          Container(
            height: 120.0,
            decoration: BoxDecoration(color: Color(0xFF48A9A6)),
          ),
          ListView(
            children: <Widget>[
              WalletPricePoint(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CardButton(
                    icon: Icons.play_for_work,
                    title: 'Transfer',
                  ),
                  CardButton(
                    icon: Icons.settings_overscan,
                    title: 'Scan',
                  ),
                  CardButton(
                    icon: Icons.account_circle,
                    title: 'ID',
                  ),
                ],
              ),
              SizedBox(height: 5.0),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: (width * 0.25) / 120,
                ),
                itemCount: getItems().length,
                itemBuilder: (context, index) {
                  Item item = getItems()[index];
                  return InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return item.widget;
                        },
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 70.0,
                          height: 70.0,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey[200]),
                              color: Colors.white),
                          child: Icon(item.icon),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          item.title,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
              CarouselSlider(
                height: 150.0,
                items: [1, 2, 3, 4, 5].map(
                  (i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(color: Colors.amber),
                          child: Image.asset('assets/images/slider.jpg'),
                        );
                      },
                    );
                  },
                ).toList(),
              )
            ],
          )
        ],
      ),
    );
  }
}

class CardButton extends StatelessWidget {
  const CardButton({
    Key key,
    this.icon,
    this.title,
  }) : super(key: key);

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) {
            return OtherPage(
              title: title,
            );
          },
        ),
      ),
      child: Container(
        width: width * 0.33,
        height: width * 0.25,
        child: Card(
          child: Align(
            alignment: Alignment.center,
            child: ListTile(
              title: Icon(
                icon,
                color: Color(0xFF48A9A6),
              ),
              subtitle: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF48A9A6)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class WalletPricePoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                'Wallet Cash'.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.orange,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'NRs',
                      style: TextStyle(fontSize: 8.0),
                    ),
                    TextSpan(
                      text: '2000',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(fontSize: 16.0),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Wallet Points: ',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextSpan(
                      text: '20',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.refresh,
                  color: Colors.white,
                  size: 50.0,
                ),
              ),
              SizedBox(width: 8.0),
              RaisedButton(
                onPressed: () {},
                color: Color(0xFFC1666B),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    'Top Up',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class Appbar extends StatelessWidget with PreferredSizeWidget {
  Appbar({
    Key key,
    @required this.title,
  });

  final String title;
  double height = 120.0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return AppBar(
      title: Text(title),
      bottom: PreferredSize(
        child: Container(
          height: 60.0,
          alignment: Alignment.center,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: getMenuItems().length,
            itemBuilder: (context, index) {
              Menu menu = getMenuItems()[index];
              return Container(
                width: width / getMenuItems().length,
                child: ListTile(
                  onTap: () {
                    if (index != 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return menu.widget;
                          },
                        ),
                      );
                    }
                  },
                  title: Icon(
                    menu.icon,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  subtitle: Text(
                    menu.title,
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
