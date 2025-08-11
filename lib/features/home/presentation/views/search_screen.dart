import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oreum_fe/core/constants/app_colors.dart';
import 'package:oreum_fe/core/constants/app_sizes.dart';
import 'package:oreum_fe/core/constants/app_strings.dart';
import 'package:oreum_fe/core/themes/app_text_styles.dart';
import 'package:oreum_fe/core/themes/text_theme_extension.dart';
import 'package:oreum_fe/core/widgets/custom_app_bar.dart';
import 'package:oreum_fe/features/auth/presentation/views/type_test_start_screen.dart';
import 'package:oreum_fe/features/home/presentation/widgets/after_search_widget.dart';
import 'package:oreum_fe/features/home/presentation/widgets/before_search_widget.dart';
import 'package:oreum_fe/features/home/presentation/widgets/recent_search_list_tile.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
class _SearchScreenState extends State<SearchScreen> {
  bool isSearch = false;
  final TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() {
      isSearch = _searchController.text.isNotEmpty;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.backWithSearchBar(controller: _searchController),
      body: SafeArea(
        child: SingleChildScrollView(
          child: isSearch ? AfterSearchWidget(searchQuery: _searchController.text) : BeforeSearchWidget(
            onSearch: (query) {
              _searchController.text = query;
            },
          ),
        ),
      )
    );
  }
}
