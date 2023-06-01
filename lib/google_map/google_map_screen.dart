import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graphql_demo/Utils/map_utils.dart';
import 'package:graphql_demo/models/user_map.dart';

class MapScreen extends StatefulWidget {

  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final markers = Set<Marker>();
  MarkerId markerId = MarkerId("YOUR-MARKER-ID");
  LatLng latLng = LatLng(28.609515149350543, 77.20151100828694);
  List<LatLng> sublist = <LatLng>[];
  List<LatLng> list = <LatLng>[];
  List<UserMap> users = <UserMap>[];

  late Timer timer;
  int counter =0;
  Map<String,int> counters = Map();
  @override
  void initState() {
    BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(120, 120)),
        'assets/images/ic_car.png')
        .then((d) {
      customIcon = d;
      users.addAll(getUsers());
      counters = { for (var v in users) v.id: 0 };
      _add();
      _setCounters();
      timer = Timer.periodic(Duration(milliseconds: 500), (t){
        print('timer');
        if(counter<(sublist.length-1)){
        setState(() {

          markers.add(Marker(markerId: markerId,position: sublist[counter],icon: customIcon,rotation: MapUtils.getRotation(sublist[counter], sublist[counter+1]),anchor: Offset(0.5, 0.5)));
          latLng = sublist[counter];
         // _controller.animateCamera(CameraUpdate.newLatLng(latLng));
          counters.updateAll((key, value) => value++);
          counter++;

        });
        }else{
          timer.cancel();
        }
      });
    });

    super.initState();
  }

 late BitmapDescriptor customIcon;
  late GoogleMapController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps"),
        actions: <Widget>[IconButton(icon: Icon(Icons.add), onPressed: _add)],
      ),
      body: GoogleMap(

        initialCameraPosition: CameraPosition(target: latLng,zoom: 14.34),
        markers: markers,
        polylines: Set<Polyline>.of(_mapPolylines.values),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;

        },
    ),);
  }


  Map<PolylineId, Polyline> _mapPolylines = {};
  int _polylineIdCounter = 1;

  void _add() async{
    final String polylineIdVal = 'polyline_id_$_polylineIdCounter';
    _polylineIdCounter++;
    final PolylineId polylineId = PolylineId(polylineIdVal);
    const pointString = r"u|umDs`gwML}A_GGgFGAWwDEm@TcFGsAAa@BeA\QDe@AYISOKHKJGFw@^?jAAnAEnOA|GAhHEx@?jA@tC?XFLLf@Bf@@t@?xAA|E?dEEj_@GxMChG@tCIvl@@tAK`DQlA?zBApE?lBExNAlH@rMAtGJdDJnATfB`AnEdAzEj@~B|@lEF\xAvGnAlF~@lEv@`DvAxFxAxGzCdN`H`ZnEnRr@hDnB|IhDlNvKnd@vDhPrFzUzGjYxBtH|@hCdAzBXl@fAhBtAtBjBhCfArAdAhAvBtBlB|AjGfFhLzJfEzDzCvDz@pA`BpC`ApBbAzBxCrIr@rBjNta@x@nBbAlBzCbI|R|j@hA`FBVC`ASpD?lA[FiMpCaBVgABiAPoE~@cIdBiLfCcHdBsCl@yJvBmDt@y@l@{@X_@P[VGJGZCd@r@tCf@rBTbAV`BB`@?n@GdA@XHj@bAxBl@hBPjADf@?v@Ej@Ml@Ut@[r@]h@sA`C{@lAMZGl@KjECbDGhBuGMsJKcCGw@CqJCiECAd@ALoBbKs@jDM^x@j@vPfLvCnB~DnCx@f@R@RAd@GDIbBmDv@y@LId@On@A~EJX@pDJrADb@QFC";


      list.addAll( MapUtils.convertToLatLng(MapUtils.decodePoly(pointString)));

      double totalDistance = 0;
      int lastindex=0;
      for(var i = 0; i < list.length-1; i++){
        if(totalDistance>= 10){
          lastindex = i ;
          break;}
        totalDistance += MapUtils.calculateDistance(list[i], list[i+1]);
      }
      print(totalDistance);
      print('last index $lastindex');
      sublist.addAll(list.getRange(0, lastindex));
      final Polyline polyline = Polyline(
        polylineId: polylineId,
        consumeTapEvents: true,
        color: Colors.red,
        width: 5,
        points: list,
      );

      setState(() {
        _mapPolylines[polylineId] = polyline;
      });




  }

  void _setCounters() {
    users.forEach((user) {
      int lowestIndex=0;


       counters[user.id]= binarySearch(list, user.lastKnownLocation);
       // MapUtils.calculateDistance(user.lastKnownLocation,latlong);

    });

    print("counter $counters");

  }

  int binarySearch(List<LatLng> sortedList, LatLng value) {
    int min = 0;
    int max = sortedList.length;
    while (min < max) {
      final int mid = min + ((max - min) >> 1);
      final LatLng element = sortedList[mid];
      final int comp = value.latitude.compareTo(element.latitude);
      if (comp == 0) {
        return mid;
      }
      if (comp < 0) {
        min = mid + 1;
      } else {
        max = mid;
      }
    }
    return -1;
  }


/*
  private fun updateCarLocation(latLng: LatLng) {
  if (movingCabMarker == null) {
  movingCabMarker = addCarMarkerAndGet(latLng)
  }
  if (previousLatLng == null) {
  currentLatLng = latLng
  previousLatLng = currentLatLng
  movingCabMarker?.position = currentLatLng
  movingCabMarker?.setAnchor(0.5f, 0.5f)
  animateCamera(currentLatLng!!)
  } else {
  previousLatLng = currentLatLng
  currentLatLng = latLng
  val valueAnimator = AnimationUtils.carAnimator()
  valueAnimator.addUpdateListener { va ->
  if (currentLatLng != null && previousLatLng != null) {
  val multiplier = va.animatedFraction
  val nextLocation = LatLng(
  multiplier * currentLatLng!!.latitude + (1 - multiplier) * previousLatLng!!.latitude,
  multiplier * currentLatLng!!.longitude + (1 - multiplier) * previousLatLng!!.longitude
  )
  movingCabMarker?.position = nextLocation
  val rotation = MapUtils.getRotation(previousLatLng!!, nextLocation)
  if (!rotation.isNaN()) {
  movingCabMarker?.rotation = rotation
  }
  movingCabMarker?.setAnchor(0.5f, 0.5f)
  animateCamera(nextLocation)
  }
  }
  valueAnimator.start()
  }
  }

  private fun showMovingCab(cabLatLngList: ArrayList<LatLng>) {
  handler = Handler()
  var index = 0
  runnable = Runnable {
  run {
  if (index < 10) {
  updateCarLocation(cabLatLngList[index])
  handler.postDelayed(runnable, 3000)
  ++index
  } else {
  handler.removeCallbacks(runnable)
  Toast.makeText(this@MainActivity, "Trip Ends", Toast.LENGTH_LONG).show()
  }
  }
  }
  handler.postDelayed(runnable, 5000)
  }

  override fun onMapReady(googleMap: GoogleMap) {
  this.googleMap = googleMap
  defaultLocation = LatLng(28.435350000000003, 77.11368)
  showDefaultLocationOnMap(defaultLocation)

  Handler().postDelayed(Runnable {
  showPath(MapUtils.getListOfLocations())
  showMovingCab(MapUtils.getListOfLocations())
  }, 3000)
  }*/


}
