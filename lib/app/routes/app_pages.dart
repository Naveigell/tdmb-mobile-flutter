import 'package:get/get.dart';

import 'package:tdmb2/app/modules/antre/bindings/antre_binding.dart';
import 'package:tdmb2/app/modules/antre/views/antre_view.dart';
import 'package:tdmb2/app/modules/antre_pasien/bindings/antre_pasien_binding.dart';
import 'package:tdmb2/app/modules/antre_pasien/views/antre_pasien_view.dart';
import 'package:tdmb2/app/modules/cerita/bindings/cerita_binding.dart';
import 'package:tdmb2/app/modules/cerita/views/cerita_view.dart';
import 'package:tdmb2/app/modules/detail_cerita/views/detail_cerita_view.dart';
import 'package:tdmb2/app/modules/detail_jadwal/bindings/detail_jadwal_binding.dart';
import 'package:tdmb2/app/modules/detail_jadwal/views/detail_jadwal_view.dart';
import 'package:tdmb2/app/modules/edit_jadwal/bindings/edit_jadwal_binding.dart';
import 'package:tdmb2/app/modules/edit_jadwal/views/edit_jadwal_view.dart';
import 'package:tdmb2/app/modules/home/bindings/home_binding.dart';
import 'package:tdmb2/app/modules/home/views/home_view.dart';
import 'package:tdmb2/app/modules/jadwal/bindings/jadwal_binding.dart';
import 'package:tdmb2/app/modules/jadwal/views/jadwal_view.dart';
import 'package:tdmb2/app/modules/landing/bindings/landing_binding.dart';
import 'package:tdmb2/app/modules/landing/views/landing_view.dart';
import 'package:tdmb2/app/modules/list_praktek/bindings/list_praktek_binding.dart';
import 'package:tdmb2/app/modules/list_praktek/views/list_praktek_view.dart';
import 'package:tdmb2/app/modules/login/bindings/login_binding.dart';
import 'package:tdmb2/app/modules/login/views/login_view.dart';
import 'package:tdmb2/app/modules/materi1/bindings/materi1_binding.dart';
import 'package:tdmb2/app/modules/materi1/views/materi1_view.dart';
import 'package:tdmb2/app/modules/mulai/bindings/mulai_binding.dart';
import 'package:tdmb2/app/modules/mulai/views/mulai_view.dart';
import 'package:tdmb2/app/modules/newapp/bindings/newapp_binding.dart';
import 'package:tdmb2/app/modules/newapp/views/newapp_view.dart';
import 'package:tdmb2/app/modules/objektif/bindings/objektif_binding.dart';
import 'package:tdmb2/app/modules/objektif/views/objektif_view.dart';
import 'package:tdmb2/app/modules/payangan/bindings/payangan_binding.dart';
import 'package:tdmb2/app/modules/payangan/views/payangan_view.dart';
import 'package:tdmb2/app/modules/pembahasan/bindings/pembahasan_binding.dart';
import 'package:tdmb2/app/modules/pembahasan/views/pembahasan_view.dart';
import 'package:tdmb2/app/modules/praktek/bindings/praktek_binding.dart';
import 'package:tdmb2/app/modules/praktek/views/praktek_view.dart';
import 'package:tdmb2/app/modules/profile/bindings/profile_binding.dart';
import 'package:tdmb2/app/modules/profile/views/profile_view.dart';
import 'package:tdmb2/app/modules/puskesmas/bindings/puskesmas_binding.dart';
import 'package:tdmb2/app/modules/puskesmas/views/puskesmas_view.dart';
import 'package:tdmb2/app/modules/register/bindings/register_binding.dart';
import 'package:tdmb2/app/modules/register/views/register_view.dart';
import 'package:tdmb2/app/modules/sanjiwani/bindings/sanjiwani_binding.dart';
import 'package:tdmb2/app/modules/sanjiwani/views/sanjiwani_view.dart';
import 'package:tdmb2/app/modules/selesai/bindings/selesai_binding.dart';
import 'package:tdmb2/app/modules/selesai/views/selesai_view.dart';
import 'package:tdmb2/app/modules/splash/bindings/splash_binding.dart';
import 'package:tdmb2/app/modules/splash/views/splash_view.dart';
import 'package:tdmb2/app/modules/welcome/bindings/welcome_binding.dart';
import 'package:tdmb2/app/modules/welcome/views/welcome_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LANDING,
      page: () => LandingView(),
      binding: LandingBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.NEWAPP,
      page: () => NewappView(),
      binding: NewappBinding(),
    ),
    GetPage(
      name: _Paths.WELCOME,
      page: () => WelcomeView(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: _Paths.JADWAL,
      page: () => JadwalView(),
      binding: JadwalBinding(),
    ),
    GetPage(
      name: _Paths.ANTRE,
      page: () => AntreView(),
      binding: AntreBinding(),
    ),
    GetPage(
      name: _Paths.SANJIWANI,
      page: () => SanjiwaniView(),
      binding: SanjiwaniBinding(),
    ),
    GetPage(
      name: _Paths.PAYANGAN,
      page: () => PayanganView(),
      binding: PayanganBinding(),
    ),
    GetPage(
      name: _Paths.PUSKESMAS,
      page: () => PuskesmasView(),
      binding: PuskesmasBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_JADWAL,
      page: () => EditJadwalView(),
      binding: EditJadwalBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_JADWAL,
      page: () => DetailJadwalView(),
      binding: DetailJadwalBinding(),
    ),
    GetPage(
      name: _Paths.ANTRE_PASIEN,
      page: () => AntrePasienView(),
      binding: AntrePasienBinding(),
    ),
    GetPage(
      name: _Paths.MATERI1,
      page: () => Materi1View(),
      binding: Materi1Binding(),
    ),
    GetPage(
      name: _Paths.CERITA,
      page: () => CeritaView(),
      binding: CeritaBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_CERITA,
      page: () => DetailCeritaView(),
      binding: DetailJadwalBinding(),
    ),
    GetPage(
      name: _Paths.PRAKTEK,
      page: () => PraktekView(),
      binding: PraktekBinding(),
    ),
    GetPage(
      name: _Paths.OBJEKTIF,
      page: () => ObjektifView(),
      binding: ObjektifBinding(),
    ),
    GetPage(
      name: _Paths.MULAI,
      page: () => MulaiView(),
      binding: MulaiBinding(),
    ),
    GetPage(
      name: _Paths.SELESAI,
      page: () => SelesaiView(),
      binding: SelesaiBinding(),
    ),
  ];
}
