import 'package:casa_vertical_stepper/casa_vertical_stepper.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import '../../common/app_colors.dart';
import '../../components/submit_button.dart';
import 'dashboard_viewmodel.dart';

class RideDetailView extends StackedView<DashboardViewModel> {
  bool isFullScreen = false;
  GoogleMapController? _mapController;
  Set<Polyline> _polylines = {};
  Set<Marker> _markers = {};
  bool _isLoading = false;
  CameraPosition _initialPosition =
  const CameraPosition(target: LatLng(34.0469, -118.2437), zoom: 14.0);


  @override
  Widget builder(
      BuildContext context,
      DashboardViewModel viewModel,
      Widget? child,
      ) {
    return Scaffold(
      resizeToAvoidBottomInset: !isFullScreen,
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _initialPosition,
            markers: _markers,
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
            polylines: _polylines,
          ),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: buildBottomSheet(context),
          ),
        ],
      ),
    );
  }
  Widget buildBottomSheet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 300, // Adjust the height as needed
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Column(
        children: [
          CasaVerticalStepperView(
            steps: buildSteps(),
            seperatorColor: kcBlackColor,
          ),
        ],
      ),
    );
  }
  List<StepperStep> buildSteps() {
    DateFormat dateFormat = DateFormat('dd MMM, HH:mm');

    return [
      StepperStep(
        leading: buildStepIcon(Icons.location_on, true),
        title: Text("Abuja"),
        view: Container(height: 20),
      ),
      StepperStep(
        leading: buildStepIcon(Icons.location_on, true),
        title: Text("yola"),

        view: Container(
          height: 0,
        ),
        status: StepStatus.fail,
      ),
    ];
  }
  @override
  void onViewModelReady(DashboardViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
  }


  Widget buildStepIcon(IconData icon, bool isActive) {
    return CircleAvatar(
      radius: 10,
      backgroundColor: kcBlackColor,
      child: Icon(icon, color: Colors.white, size: 12),
    );
  }

  Widget buildStepTitle(String title, String subtitle, bool isActive) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            color: kcBlackColor,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 10,
            color: kcBlackColor,
            overflow: TextOverflow.ellipsis,
          ),
          maxLines: 1,
        ),
      ],
    );
  }

  @override
  DashboardViewModel viewModelBuilder(BuildContext context) => DashboardViewModel();
}
