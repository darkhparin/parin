import 'dart:convert';

import 'package:cwl/constants/route_names.dart';
import 'package:cwl/models/masterindex.dart';
import 'package:cwl/services/api_services.dart';
import 'package:cwl/services/dialog_service.dart';
import 'package:cwl/services/navigation_service.dart';
import 'package:package_info/package_info.dart';

import '../locator.dart';
import 'base_model.dart';

class BranchListViewModel extends BaseModel {
  final ApiService _apiService = locator<ApiService>();
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    try {
      setBusy(true);

      var userBranchesResponce =
          await _apiService.tripAPIService.getUserBranchesResponce();
      setbranchlists(userBranchesResponce);
      setBusy(false);
    } catch (e) {
      setBusy(false);
    }
  }

  List<BranchModel> _branchlists = new List<BranchModel>();
  List<BranchModel> get branchlists => _branchlists;
  void setbranchlists(List<BranchModel> model) {
    setbranchlist(null);
    _branchlists = model == null ? new List<BranchModel>() : model;
    notifyListeners();
  }

  BranchModel _branchlist = new BranchModel();
  BranchModel get branchlist => _branchlist;
  Future<void> setbranchlist(BranchModel model) async {
    notifyListeners();
    _branchlist = model;
    if (_branchlist != null) {
      var setid = _branchlist.id;
      await getTripListResponce(setid);
      // settriplist(triplist);
      notifyListeners();
    }
  }

  bool _hasData = false;
  bool get hasData => _hasData;
  void sethasData(bool value) {
    _hasData = value;
    notifyListeners();
  }

  List<TripDetailsModel> _triplist = new List<TripDetailsModel>();
  List<TripDetailsModel> get triplist => _triplist;
  void settriplist(List<TripDetailsModel> val) {
    _triplist = val == null ? new List<TripDetailsModel>() : val;
    notifyListeners();
  }

  Future getTripListResponce(int setid) async {
    try {
      setBusy(true);
      sethasData(false);
      var tripListResponce =
          await _apiService.tripAPIService.getTripListResponce(setid);
      settriplist(tripListResponce);
      setBusy(false);
      if (tripListResponce != null) {
        sethasData(true);
        // var responce = await _dialogService.showConfirmationDialog(
        //   title: 'Success',
        //   // description: 'Success',
        //   confirmationTitle: 'OK',
        //   description: json.encode(tripListResponce.toList()),
        // );

        // if (responce.confirmed) {
        //   _navigationService.navigateReplacementTo(DashBoardDriverViewRoute);
        // }
      }
    } catch (e) {
      setBusy(false);
      await _dialogService.showDialog(
        title: 'Error',
        description: e.toString(),
      );
    }
  }
}
