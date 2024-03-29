import 'dart:async';

import 'package:bnacash/helpers/map_marker.dart';
import 'package:fluster/fluster.dart';

import 'package:flutter/material.dart';
import 'package:bnacash/helpers/map_marker.dart';
import 'package:bnacash/helpers/map_helper.dart';
import 'package:get/get.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';


class VaultsScreen extends StatefulWidget {
  const VaultsScreen({Key? key}) : super(key: key);

  @override
  State<VaultsScreen> createState() => _VaultsScreenState();
}

class _VaultsScreenState extends State<VaultsScreen> {
  final Completer<GoogleMapController> _mapController = Completer();

  /// Set of displayed markers and cluster markers on the map
  final Set<Marker> _markers = Set();

  /// Minimum zoom at which the markers will cluster
  final int _minClusterZoom = 0;

  /// Maximum zoom at which the markers will cluster
  final int _maxClusterZoom = 19;

  /// [Fluster] instance used to manage the clusters
  //  Fluster<MapMarker>? _clusterManager;

  /// Current map zoom. Initial zoom will be 15, street level
  double _currentZoom = 15;

  /// Map loading flag
  bool _isMapLoading = true;

  /// Markers loading flag
  bool _areMarkersLoading = true;

  /// Url image used on normal markers
  final String _markerImageUrl =
      'https://i.ibb.co/Vqc5nJy/rsz-1rsz-1rsz-2bna.png';

  /// Url image used on cluster markers
  final String _clusterImageUrl =
      'https://i.ibb.co/SdBfsQy/rsz-1rsz-2marker.png';
  final List<LatLng> _markerLocations = [
    LatLng(36.64957961261285, 9.607314711325102),
    LatLng(36.459104719146154, 9.24693579029315),
    LatLng(36.55221881716295, 9.442444880851781),
    LatLng(36.97515555875536, 9.073275967623885),
    LatLng(36.76890350999188, 9.089491657258577),
    LatLng(36.53987750815006, 9.663378244154387),
    LatLng(36.72744580413277, 9.196315995694704),
    LatLng(37.154524864398994, 9.795348748731612),
    LatLng(37.2154338937346, 10.124197850529526),
    LatLng(37.05818892667282, 9.24689536234348),
    LatLng(37.168506865606965, 10.034763395953178),
    LatLng(37.26560346658329, 9.877590417098986),
    LatLng(37.270760487284996, 9.872150897216784),
    LatLng(33.88789217539554, 10.101187358335892),
    LatLng(33.88568747163402, 9.79509721081672),
    LatLng(33.666926607739036, 10.016434539761235),
    LatLng(33.61598419482591, 10.289180327858616),
    LatLng(34.41808759950755, 8.789992212486254),
    LatLng(33.923118840423655, 8.134851931762682),
    LatLng(34.337139789962265, 8.950428117718388),
    LatLng(34.54014979947447, 9.251375078392016),
    LatLng(36.6101281162162, 8.972964037861515),
    LatLng(36.95311313750987, 8.759105197431154),
    LatLng(36.44753603052287, 8.439547766651799),
    LatLng(36.65733159866964, 8.694954804421968),
    LatLng(36.50128624831655, 8.778581668343235),
    LatLng(36.77872239951633, 8.688148309197117),
    LatLng(36.179191982899965, 8.709917117561985),
    LatLng(35.942086259654616, 8.822376777138401),
    LatLng(35.89293326304424, 8.553345848526646),
    LatLng(35.844328078058545, 8.633077193703343),
    LatLng(36.07095337730439, 9.024250556435276),
    LatLng(36.35099158588039, 9.623461414780308),
    LatLng(35.85865059969561, 9.201292444672276),
    LatLng(36.32853034575812, 9.136313249077488),
    LatLng(35.65308141168353, 9.055930127110173),
    LatLng(36.08668063472398, 9.37074368139713),
    LatLng(36.69521118129997, 10.490260600280748),
    LatLng(36.45675263100905, 10.738007773365666),
    LatLng(36.60063692512968, 10.497679163422276),
    LatLng(36.4002945621152, 10.611844707932164),
    LatLng(36.78212312322115, 10.989062537159611),
    LatLng(36.84756729664906, 11.091539014782597),
    LatLng(36.57726355040176, 10.86113457819431),
    LatLng(36.67913878746995, 10.584845591988255),
    LatLng(37.04776841832947, 11.012668658699681),
    LatLng(36.53409423602812, 10.550043930020024),
    LatLng(36.45495988089575, 10.736570109333683),
    LatLng(36.72680988580281, 10.855019141640355),
    LatLng(36.430642559659226, 10.682140041794468),
    LatLng(33.87735484936797, 10.860968281235386),
    LatLng(33.503457399985926, 11.110411464405047),
    LatLng(33.14023409931352, 11.217465375270535),
    LatLng(33.34805815336148, 10.487701345886876),
    LatLng(32.92792970463687, 10.446057368721653),
    LatLng(33.728486826163305, 10.855019141640355),
    LatLng(33.80793553932547, 10.988754083122899),
    LatLng(35.93229632791091, 10.020315696205784),
    LatLng(35.6723215347399, 10.101581264939),
    LatLng(35.63456912407473, 9.678494979347874),
    LatLng(35.39953435025406, 10.051802147831722),
    LatLng(35.846904496583186, 9.58849077364414),
    LatLng(35.11882050950452, 10.033512164559056),
    LatLng(35.68033960764002, 10.086212207283665),
    LatLng(35.35220335697622, 9.827969123329808),
    LatLng(35.39593095710976, 9.544144726090962),
    LatLng(35.16752680387618, 8.833701063599278),
    LatLng(35.543331424758875, 9.07247399231403),
    LatLng(35.350610740434845, 8.626827646698643),
    LatLng(35.03831357881289, 9.490311194863011),
    LatLng(34.60557916320055, 9.604884435143162),
    LatLng(34.93213757384943, 9.196384002175023),
    LatLng(34.85799043713878, 9.78571896692722),
    LatLng(35.17781396995984, 9.27912478586643),
    LatLng(35.83042484487772, 10.640378047432591),
    LatLng(35.73209996025238, 10.576820422615696),
    LatLng(35.87098832950312, 10.53528373381107),
    LatLng(36.134458746175845, 10.37849788805454),
    LatLng(35.83066840073781, 10.635131646599461),
    LatLng(35.86202432054747, 10.59348766943424),
    LatLng(35.82574059834926, 10.63865606924503),
    LatLng(35.83261682070722, 10.640249301399876),
    LatLng(35.893031043256975, 10.595833261217762),
    LatLng(35.83669399562551, 10.595633436646153),
    LatLng(36.79240696371211, 10.185913025569902),
    LatLng(36.81167157879799, 10.303991913032518),
    LatLng(36.37479058453352, 9.902105807495104),
    LatLng(36.79626886573971, 10.18213379306792),
    LatLng(36.79800978605841, 10.175653149094273),
    LatLng(36.73915388153064, 10.316142319869982),
    LatLng(36.679288168488576, 10.15725094003676),
    LatLng(36.682775037426744, 10.285929917526232),
    LatLng(36.756213238454165, 10.22042994638889),
    LatLng(36.85309233148772, 10.30144381446837),
    LatLng(36.73444002813323, 10.2094520918846),
    LatLng(36.83577665964237, 10.242107986640917),
    LatLng(36.80051716263925, 10.269107102584826),
    LatLng(36.83063400650666, 10.31477841658591),
    LatLng(35.75432927245963, 10.706639338936611),
    LatLng(35.64154906318372, 10.892924119438816),
    LatLng(35.419026511075906, 10.996667026710497),
    LatLng(35.62611477760152, 10.900198270287205),
    LatLng(35.62412750579387, 10.759714890923191),
    LatLng(35.34378926101961, 10.54888789793472),
    LatLng(35.2364119350387, 11.112264443840672),
    LatLng(35.50475563560617, 11.064199398346773),
    LatLng(35.77463957536161, 10.829237748589207),
    LatLng(35.292323015854905, 10.707873155083348),
    LatLng(36.812261159260686, 10.17950480123966),
    LatLng(36.829691645947044, 10.186003793682744),
    LatLng(36.80978291583082, 10.138472794723497),
    LatLng(36.805339824493174, 10.168734390940358),
    LatLng(36.75887317745243, 10.019497165398434),
    LatLng(36.8319447801104, 10.040280719008137),
    LatLng(36.80088991120314, 10.109193374123265),
    LatLng(36.80185637188077, 10.098174859490086),
    LatLng(36.85802327781707, 10.20720129152744),
    LatLng(36.84317081820073, 10.154597808327366),
    LatLng(36.859203624083634, 10.162091900314976),
    LatLng(36.8545868802747, 10.186319343091554),
    LatLng(36.895912451889714, 10.180438747221387),
    LatLng(36.84773847140002, 10.197856475319554),
    LatLng(34.733468250043735, 10.752220798935582),
    LatLng(34.72514009895458, 10.76777224680393),
    LatLng(34.787582976083634, 10.77946667810886),
    LatLng(34.73235288196966, 10.768158484902073),
    LatLng(34.841935189943655, 10.763102520909001),
    LatLng(34.73512143590064, 10.759232093300511),
    LatLng(34.79083868791846, 10.744563092198063),
    LatLng(34.521786567678866, 10.497086395229985),
    LatLng(35.12147294198333, 10.74155097147434),
    LatLng(34.73764303169824, 10.755133677925755),
    LatLng(34.42867568253156, 8.782816876377751),
    LatLng(34.752929660667746, 10.761463691200901),
    LatLng(34.75120190208677, 10.77273969789951),
    LatLng(34.72935057137609, 10.756356765236546),
    LatLng(34.29822580165446, 10.068659831490208),
    LatLng(35.78309994564018, 10.692638207878758),
    LatLng(36.3959226965882, 10.613842953648259),
    LatLng(36.06999945211673, 10.431273032631566),
    LatLng(36.467467278075546, 10.802938689198185),
    LatLng(36.72479431986755, 10.226535081100451),
    LatLng(36.8105802, 10.3012983),
    LatLng(36.8511153, 10.2247553),
    LatLng(36.85797820968928, 10.189284135307957),
    LatLng(35.57743803489104, 8.669029523338963),
    LatLng(33.984577366026606, 8.216868092026402),
    LatLng(36.46873128012279, 10.78023915430515),
    LatLng(36.83214550871016, 10.157145906891628),
    LatLng(35.6713114, 10.1023153),
    LatLng(36.82640133611521, 9.842973827552782),
    LatLng(36.32110954031872, 9.323976685013462),
    LatLng(36.87618571535079, 10.115947176422765),
    LatLng(36.77023604434881, 10.272706200089146),
    LatLng(36.810683, 10.183720),
    LatLng(36.91426474087951, 8.650994349922826),
    LatLng(36.80412858027227, 8.637100507225682),
    LatLng(36.84709455185083, 10.278451491799046),
    LatLng(33.499477, 11.108453),
    LatLng(35.270098, 9.418456),
    LatLng(35.173290, 8.845067),
    LatLng(36.725309, 10.257129),
    LatLng(36.800146, 10.181216),
    LatLng(33.7041081273922, 8.973296631779362),
    LatLng(36.80006614128747, 10.181186973285662),
    LatLng(35.63810930679284, 10.969230283703495),
    LatLng(35.64131582709391, 10.966432739700962),
    LatLng(36.64882717910139, 10.591061998030682),
    LatLng(36.813549, 10.181035),
    LatLng(37.270612, 9.872456),
    LatLng(35.832295, 10.640301),
    LatLng(36.7260327, 10.2536911),
    LatLng(34.7913509, 10.7517145),
    LatLng(36.5029652, 8.7584006),
    LatLng(35.1701022, 8.8369032),
    LatLng(37.2782498, 9.8540525),
    LatLng(36.724413491557165, 9.185033088438445),
    LatLng(33.865282200954674, 10.101425696816136),
    LatLng(35.63465196265512, 9.678049732651516),
    LatLng(34.94761017917632, 8.569522251095463),
    LatLng(37.03926055799304, 9.663249303307225),
    LatLng(35.8475807, 10.616196),
    LatLng(36.805700616940584, 10.177686263527562),
    LatLng(34.314700986567466, 8.409482885803868),
    LatLng(35.23422551670911, 9.125208903755833),
    LatLng(35.038327, 9.490341),
    LatLng(35.712260104789806, 10.820088733639409),
    LatLng(35.292323015854905, 10.707873155083348),
    LatLng(34.7913726, 10.7451484),
    LatLng(34.73352335677176, 10.752014268841435),
    LatLng(35.82646260794538, 10.641568948235203),
    LatLng(36.801288969707414, 10.18131702327878),
    LatLng(36.76899511795247, 10.234179376792894),
    LatLng(36.880833874988205, 10.326763867568956),
    LatLng(36.85542215951559, 10.256714869942357),
    LatLng(36.819280639041274, 10.184960414376064),
    LatLng(36.40026097773491, 10.148434519004808),
    LatLng(36.727571857740806, 10.305660247039782),
    LatLng(36.85257413391662, 10.16512547871082),
  ];

  //  void _onMapCreated(GoogleMapController controller) {
  //   _mapController.complete(controller);

  //   setState(() {
  //     _isMapLoading = false;
  //   });

  //   _initMarkers();
  // }


  //   void _initMarkers() async {
  //   final List<MapMarker> markers = [];

  //   for (LatLng markerLocation in _markerLocations) {
  //     final BitmapDescriptor markerImage =
  //         await MapHelper.getMarkerImageFromUrl(_markerImageUrl);

  //     markers.add(
  //       MapMarker(
  //         id: _markerLocations.indexOf(markerLocation).toString(),
  //         position: markerLocation,
  //         icon: markerImage,
  //       ),
  //     );
  //   }

  //   _clusterManager = await MapHelper.initClusterManager(
  //     markers,
  //     _minClusterZoom,
  //     _maxClusterZoom,
  //     _clusterImageUrl,
  //   );

  //   _updateMarkers();
  // }

  // void _updateMarkers([double? updatedZoom]) {
  //   if (_clusterManager == null || updatedZoom == _currentZoom) return;

  //   if (updatedZoom != null) {
  //     _currentZoom = updatedZoom;
  //   }

  //   setState(() {
  //     _areMarkersLoading = true;
  //   });

  //   _markers
  //     ..clear()
  //     ..addAll(MapHelper.getClusterMarkers(_clusterManager!, _currentZoom));

  //   setState(() {
  //     _areMarkersLoading = false;
  //   });
  // }
  // Set<Marker> _markers = {};
  Marker marker = Marker(
  markerId: MarkerId('marker_id'),
  position: LatLng(37.7749, -122.4194),
  infoWindow: InfoWindow(title: 'San Francisco'),
);








  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
          height: 700,
          width: Get.width,
        child: 
        Stack(
          children: [
        GoogleMap(
  initialCameraPosition: CameraPosition(
    target: LatLng(41.143029, -8.611274),
    zoom: 12.0,
  ),
 markers: 
 {
  Marker(markerId: MarkerId('place_name'),
   position: LatLng(41.143029, -8.611274),
  infoWindow: InfoWindow(
        title: 'title',
        snippet: 'address',
      ),
  ),
    Marker(markerId: MarkerId('places'),
   position:  LatLng(36.819280639041274, 10.184960414376064),
  infoWindow: InfoWindow(
        title: 'title',
        snippet: 'address',
      ),
  ),
   Marker(markerId: MarkerId('placsse'),
   position:  LatLng(36.45675263100905, 10.738007773365666),
  infoWindow: InfoWindow(
        title: 'title',
        snippet: 'address',
      ),
  ),
   Marker(markerId: MarkerId('plssace'),
   position:   LatLng(36.430642559659226, 10.682140041794468),
  infoWindow: InfoWindow(
        title: 'title',
        snippet: 'address',
      ),
  )

 },
 
//  _markers,
  // onMapCreated: (controller) => _onMapCreated(controller),
  //             onCameraMove: (position) => _updateMarkers(position.zoom),
),
          ],
        )

),
    );
  }
}