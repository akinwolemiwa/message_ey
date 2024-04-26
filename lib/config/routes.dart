import 'package:flutter/material.dart';
import 'package:message_app/views/home_page.dart';
import 'package:message_app/views/splash_screen.dart';

class PageViewTransition<T> extends MaterialPageRoute<T> {
  PageViewTransition({WidgetBuilder? builder, RouteSettings? settings})
      : super(builder: builder!, settings: settings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (settings.name == '/') return child;
    if (animation.status == AnimationStatus.reverse) {
      return super
          .buildTransitions(context, animation, secondaryAnimation, child);
    }
    return FadeTransition(opacity: animation, child: child);
  }
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget? page;
  SlideRightRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page!,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(opacity: animation, child: page),
        );
}

class AppRoute {
  static const String splashscreen = '/splashScreen';
  static const String homepage = '/homePage';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashscreen:
        return PageViewTransition(
          builder: (_) => const SplashScreen(),
        );

      case homepage:
        return PageViewTransition(
          builder: (_) => const HomePage(),
        );

      default:
        return PageViewTransition(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
