import 'package:flutter/material.dart';
import 'item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Imágenes de animales'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.grid_on),
              ),
              Tab(
                icon: Icon(Icons.list),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // GridView tab content Widget
            GridView.count(
              // Items in row
              crossAxisCount: 2,
              // Vertical spacing between rows
              mainAxisSpacing: 5.0,
              // Horizontal spacing between columns
              crossAxisSpacing: 5.0,
              // Padding of GridView
              padding: const EdgeInsets.all(5.0),
              // The ratio between the width and height of items
              childAspectRatio: 0.75,
              // List of items widgets
              children: items.map<Widget>((Item item) => _ItemGridCellWidget(item)).toList(),
            ),
            // ListView tab content Widget
            ListView.builder(itemCount: items.length, itemBuilder: (BuildContext context, int position) => _ItemListCellWidget(items[position]))
          ],
        ),
      ),
    );
  }
}

class _ItemGridCellWidget extends StatelessWidget {
  final Item _item;

  _ItemGridCellWidget(this._item);

  void _selectItem(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => _ItemFullScreenWidget(_item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GridTile(
        footer: GridTileBar(
          title: Text(_item.name),
          subtitle: Text(_item.description),
          backgroundColor: Colors.black38,
        ),
        child: GestureDetector(
          onTap: () => _selectItem(context),
          child: Hero(
            key: Key(_item.imageUrl),
            tag: _item.name,
            child: Image.network(
              _item.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
        ));
  }
}

class _ItemListCellWidget extends StatelessWidget {
  final Item _item;

  _ItemListCellWidget(this._item);

  void _selectItem(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => _ItemFullScreenWidget(_item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => _selectItem(context),
//      isThreeLine: true,
      title: Text(
        _item.name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        _item.description,
        maxLines: 2,
        style: TextStyle(),
      ),
      leading: Hero(
        key: Key(_item.imageUrl),
        tag: _item.name,
        child: Image.network(
          _item.imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _ItemFullScreenWidget extends StatelessWidget {
  final Item _item;

  _ItemFullScreenWidget(this._item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_item.name),
      ),
      body: SizedBox.expand(
        child: Hero(
          tag: _item.name,
          child: Image.network(
            _item.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

List<Item> items = [
  Item(
    "https://c.tenor.com/06uIzDXgpzAAAAAd/panda.gif",
    "Panda",
    "70 – 120 kg",
  ),
  Item(
    "https://i.gifer.com/1GIV.gif",
    "Panda rojo",
    "3.7 – 6.2 kg",
  ),
  Item(
    "https://i.gifer.com/WPq.gif",
    "Oso Polar",
    "150 – 250 kg",
  ),
  Item(
    "https://reygif.com/media/1/oso-pardo-corriendo-10352.gif",
    "Oso Pardo",
    "80 – 600 kg",
  ),
  Item(
    "https://c.tenor.com/3YuE-ys8rdAAAAAd/%E5%A4%A7%E5%8F%AB-yelling.gif",
    "Castor",
    "16 kg",
  ),
  Item(
    "https://c.tenor.com/JNkVubTdO-0AAAAC/conejitovale-conejo.gif",
    "Conejo",
    "1 – 2.5 kg",
  ),
  Item(
    "https://c.tenor.com/a-Qt5xUsQbcAAAAM/kp0.gif",
    "Zorro",
    "2.2 – 14 kg",
  ),
  Item(
    "https://reygif.com/media/1/jirafas-locas-9444.gif",
    "Jirafa",
    "550 – 1,200 kg",
  ),
  Item(
    "https://thumbs.gfycat.com/BetterFondFunnelweaverspider-max-1mb.gif",
    "Elefante",
    "6,000 kg",
  ),
  Item(
    "http://25.media.tumblr.com/tumblr_mdp8a8U6Ye1rl8j41o1_500.gif",
    "Tortuga",
    "60 Kg.",
  ),
  Item(
    "https://c.tenor.com/am0UhUEiUZoAAAAd/hamster-spinning.gif",
    "Hámster",
    "120 g.",
  ),
  Item(
    "https://c.tenor.com/yZpFH9fS-yEAAAAC/lion-rawr.gif",
    "León",
    "190 kg",
  ),
  Item(
    "https://c.tenor.com/NAb3j72dVP8AAAAd/leopard.gif",
    "Leopardo",
    "23 – 27 kg",
  ),
  Item(
    "https://c.tenor.com/nyUHFH85bSQAAAAC/panther-panthers.gif",
    "Pantera",
    "90 kg",
  ),
  Item(
    "https://c.tenor.com/Blsd7XrVROMAAAAM/otter-oh-yeah.gif",
    "Nutria",
    "7 – 12 kg",
  ),
  Item(
    "https://c.tenor.com/kjkLLknUJXkAAAAM/kangaroo-dancing.gif",
    "Canguro",
    "50 – 66 kg",
  ),
  Item(
    "https://c.tenor.com/oMZ1m3XnTK4AAAAM/ardilla-eating-peanut.gif",
    "Ardilla",
    "330 g",
  ),
  Item(
    "https://i.makeagif.com/media/8-09-2017/wfW5ip.gif",
    "Cabra",
    "20 – 140 kg",
  ),
  Item(
    "https://thumbs.gfycat.com/AffectionateMealyBobolink-size_restricted.gif",
    "Tigre",
    "65 – 180 kg",
  ),
  Item(
    "https://c.tenor.com/gDkdg_dQm9gAAAAd/ganso.gif",
    "Ganso",
    "3.2 – 6.5 kg",
  ),
  Item(
    "https://c.tenor.com/yRjBy_MMiv8AAAAd/mapache.gif",
    "Mapache",
    "3.5 – 9 kg",
  ),
  Item(
    "https://www.gifmaniacos.es/wp-content/uploads/2016/12/liebre-gif-gifmaniacos.es_.gif",
    "Liebre",
    "2.5 – 7 kg,",
  ),
  Item(
    "https://i.pinimg.com/originals/ec/c0/79/ecc0798bb26af4a0cd04e1f1cead1deb.gif",
    "Cerdo",
    "135-175 kg,",
  ),
  Item(
    "https://acegif.com/wp-content/uploads/howling-wolf-m.gif",
    "Lobo",
    "23 – 55 kg",
  ),
  Item(
    "https://i.makeagif.com/media/7-10-2015/oUfGb2.gif",
    "Venado",
    "200 kg",
  ),
  Item(
    "https://reygif.com/media/1/cara-oveja-9813.gif",
    "Oveja",
    "45 – 100 kg",
  ),
  Item(
    "https://c.tenor.com/uWfWt4KVeNIAAAAC/pingu-pinguino.gif",
    "pinguino",
    "20 y 45 kg.",
  ),
  Item(
    "https://i.pinimg.com/originals/20/28/83/2028831fc3cd4a16465b7f69a8d27c6a.gif",
    "Cebra",
    "350 – 450 kg",
  ),
  Item(
    "https://c.tenor.com/P2xTUyOe3FMAAAAC/abrazo-gato.gif",
    "Gato",
    "3.6 – 4.5 kg",
  ),
  Item(
    "https://c.tenor.com/ZwKiERmgYzoAAAAC/perro.gif",
    "Perro",
    "5 a 25 kilos",
  ),
  Item(
    "https://c.tenor.com/JvNwAhnuA6EAAAAd/torigali-cindali.gif",
    "Camello",
    "480 kg",
  ),
  Item(
    "https://media3.giphy.com/media/eGxZNRietHrgQXKKOg/200.gif",
    "Búfalo",
    "300 – 550 kg",
  ),
  Item(
    "https://reygif.com/media/1/alce-8576.gif",
    "Alce",
    "200 – 490 kg",
  ),
  Item(
    "https://i.pinimg.com/originals/12/71/ac/1271aca7bd71bb3b09cfbd9ee10c3397.gif",
    "Avestruz",
    "63 – 140 kg",
  ),
  Item(
    "https://c.tenor.com/W45Df5WlI9kAAAAC/cow-hair.gif",
    "Vaca",
    "720 kg",
  ),
  Item(
    "https://i.pinimg.com/originals/4e/68/1d/4e681dd27b6b4ece1a38e5b9bc583045.gif",
    "Armadillo",
    "20 a 60 kg",
  ),
  Item(
    "https://c.tenor.com/l54NdewopQcAAAAC/koala.gif",
    "Koala",
    "4 – 15 kg",
  ),
  Item(
    "https://c.tenor.com/8vRiuPLm7z8AAAAC/hermosos-caballos-horse.gif",
    "Caballo",
    "300 kg",
  ),
  Item(
    "https://thumbs.gfycat.com/FormalHelpfulDiscus-size_restricted.gif",
    "Burro",
    "80 – 480 kg",
  ),
  Item(
    "https://media.giphy.com/media/2wN5OlLBhBzc4/giphy.gif",
    "Rinoceronte",
    "3.500 kg",
  ), //40
  Item(
    "https://c.tenor.com/LHllQ-jdfzMAAAAC/rata.gif",
    "Rata",
    "40 – 500 g,",
  ),
  Item(
    "https://c.tenor.com/sbv5wdfPW-EAAAAM/recorte-toro-wow.gif",
    "Toro",
    "720 kg",
  ),
  Item(
    "https://i.pinimg.com/originals/68/df/c7/68dfc72f2018acf3cefbd9a8501f3535.gif",
    "Colibrí",
    "20 gramos.",
  ),
  Item(
    "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Peregrino_en_vuelo.gif/640px-Peregrino_en_vuelo.gif",
    "Halcon",
    "0.33 – 1 kg",
  ),
  Item(
    "https://64.media.tumblr.com/557e448600e78a21a0fabc3d4aa605f2/tumblr_mzwbyq123E1ste05mo1_500.gifv",
    "Buitre",
    "1.2 – 1.9 kg,",
  ),
  Item(
    "https://reygif.com/media/1/tres-lechuzas-6795.gif",
    "Lechusa",
    "160 g",
  ),
  Item(
    "https://reygif.com/media/1/buho-6754.gif",
    "Buho",
    "2.7 kg",
  ),
  Item(
    "https://c.tenor.com/VY3kO3GBVlQAAAAd/pato.gif",
    "Pato",
    "0.72 – 1.6 kg",
  ),
  Item(
    "https://i.pinimg.com/originals/06/8a/5a/068a5af613f9d27706e5a0ecf60607df.gif",
    "Gorrión",
    "24 – 40 g",
  ),
  Item(
    "https://media3.giphy.com/media/1msv0lTGJiOCRRvibq/giphy-downsized-large.gif",
    "Pelícano",
    "16 kilos",
  ),
];
