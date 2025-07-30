import 'package:flutter/material.dart';
import 'package:mvvm/repository/movies_repo.dart';
import 'package:mvvm/screens/movies_screen.dart';
import 'package:mvvm/service/init_getit.dart';
import 'package:mvvm/service/navigation_service.dart';
import 'package:mvvm/widgets/my_error_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;
  String _errorMessage = '';
  final _moviesRepository = getIt<MoviesRepository>();

  Future<void> _loadData() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      await _moviesRepository.fetchGenres();
      await getIt<NavigationService>().navigateReplace(MoviesScreen());
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _isLoading
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Loading...'),
                  const SizedBox(
                    height: 20,
                  ),
                  CircularProgressIndicator.adaptive(),
                ],
              ))
            : MyErrorWidget(
                errorText: _errorMessage, retryFunction: _loadData));
  }
}
