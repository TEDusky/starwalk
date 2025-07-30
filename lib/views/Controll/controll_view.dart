import 'package:flutter/material.dart';
import 'package:starwalk/helpers.dart';
import 'package:starwalk/views/Controll/widgets/campsite_row.dart';
import 'package:starwalk/views/Controll/widgets/sky_row.dart';
import 'package:starwalk/widgets/gradient_background.dart';

class ControllScreen extends StatefulWidget {
  const ControllScreen({super.key});

  @override
  State<ControllScreen> createState() => _ControllScreenState();
}

class _ControllScreenState extends State<ControllScreen> {
  static const animationDuration = 1000;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // UGLY HACK: in release mode, screen was initialized with height 168, making the scroll broken
      Future.delayed(const Duration(milliseconds: 200), () {
        if (_scrollController.hasClients) {
          final max = _scrollController.position.maxScrollExtent;
          _scrollController.jumpTo(max);
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: animationDuration),
      curve: Curves.easeOut,
    );
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: animationDuration),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final smoothBlues = makeSmoothHSL(
      const Color.fromARGB(255, 10, 15, 46),
      const Color.fromARGB(255, 50, 91, 202),
      100,
    );

    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const NeverScrollableScrollPhysics(),
        child: GradientBackground(
          colors: smoothBlues,
          child: Column(
            children: [
              SafeArea(bottom: false, child: SkyRow(onTap: _scrollToBottom)),
              SizedBox(height: screenHeight * 8),
              SafeArea(top: false, child: CampsiteRow(onMoonTap: _scrollToTop)),
            ],
          ),
        ),
      ),
    );
  }
}
