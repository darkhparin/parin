import 'package:cwl/common/DocketSearch.dart';
import 'package:cwl/common/RateCalc.dart';
import 'package:cwl/common/chat/main.dart';
import 'package:cwl/models/params/partbupdateparam.dart';
import 'package:cwl/ui/parameeters/party_add_parameter.dart';
import 'package:cwl/ui/views/Order_Invoice_Create_View.dart';
import 'package:cwl/ui/views/Pincode_Serviceability_view.dart';
import 'package:cwl/ui/views/booking_party_add_view.dart';
import 'package:cwl/ui/views/booking_view.dart';
import 'package:cwl/ui/views/dashboard_driver_view.dart';
import 'package:cwl/ui/views/extendewaybill_view.dart';
import 'package:cwl/ui/views/guest_view.dart';
import 'package:cwl/ui/views/invocie_pdf_view.dart';
import 'package:cwl/ui/views/login_view.dart';
import 'package:cwl/ui/views/mobileconfotp_view.dart';
import 'package:cwl/ui/views/part_b_update_view.dart';
import 'package:cwl/ui/views/register_view.dart';
import 'package:cwl/ui/views/startup_view.dart';
import 'package:cwl/ui/views/tracking_full_view.dart';
import 'package:cwl/ui/views/employee_trip_view.dart';
import 'package:cwl/ui/views/trip_Depart_driver_view.dart';
import 'package:cwl/ui/views/tripcreate_view.dart';
import 'package:cwl/ui/views/tripupdate_driver_view.dart';
import 'package:cwl/ui/views/update_deviceid_view.dart';
import 'package:cwl/ui/views/update_view.dart';
import 'package:cwl/viewmodels/dashboard_driver_view_model.dart';
import 'package:flutter/material.dart';
import 'package:cwl/constants/route_names.dart';
import 'package:cwl/common/PodUpdate.dart';

import 'views/Driver_Fual_update_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case TestViewRoute:
    //   return _getPageRoute(
    //     routeName: settings.name,
    //     viewToShow: TestView(),
    //   );
    case StartupViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: StartUpView(),
      );
    case UpdateViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: UpdateView(),
      );
    case GuestViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: GuestView(),
      );
    case UpdateDeviceIdViewRoute:
      var _userId = settings.arguments as int;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: UpdateDeviceIdView(userId: _userId),
      );
    case MobileConfOtpViewRoute:
      var _otpRequestCode = settings.arguments as String;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: MobileConfOtpView(otpRequestCode: _otpRequestCode),
      );
    case RegisterViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: RegisterView(),
      );
    case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginView(),
      );
    case BookingViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: BookingView(),
      );
    case PartBUpdateViewRoute:
      var _params = settings.arguments as ParamPartBUpdate;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: PartBUpdateView(
          param: _params,
        ),
      );
    case BookingPartyAddViewRoute:
      var _parameter = settings.arguments as PartyAddParameter;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: BookingPartyAddView(parameter: _parameter),
      );
    case ExtendEwayBillViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ExtendEwayBillView(),
      );
    case TripCreateViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: TripCreateView(),
      );
    case TripUpdateDriverViewRoute:
      var _tripId = settings.arguments as int;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: TripUpdateDriverView(tripId: _tripId),
      );
    case DashBoardDriverViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: DashBoardDriverView(),
      );
    case RateCalcViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: RateCalchView(),
      );
    case DocketSearchViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: DocketSearchView(),
      );
    case UploadPODViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: UploadPODView(),
      );
    case FualUpdateViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: FualUpdateView(),
      );
    case OrderInvoiceCreateRoute:
      var _orderidNo = settings.arguments as int;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: OrderInvoiceCreateView(orderidNo: _orderidNo),
      );
    case PincodeServiceabilityRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: PincodeServiceabilityView(),
      );
    case PdfViewerPageRoute:
      var _invoiceId = settings.arguments as int;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: PdfViewerPage(invoiceId: _invoiceId),
      );
    case DocketTrackingFullPageViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: DocketTrackingViewView(),
      );
    case ChatAppViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: ChatApp(),
      );
    case BranchListViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: BranchListView(),
      );
    case TripDepartDriverViewRoute:
      var _tripId = settings.arguments as int;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: TripDepartDriverView(tripId: _tripId),
      );
    /*
    
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeView(),
      );
    case CreatePostViewRoute:
      var postToEdit = settings.arguments as Post;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: CreatePostView(
          edittingPost: postToEdit,
        ),
      );
       */
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
