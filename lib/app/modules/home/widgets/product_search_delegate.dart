import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omiga/app/core/constants/appcolors.dart';

class ProductSearchDelegate extends SearchDelegate<String> {
  final List<String> searchHistory;
  final Function(String) onHistoryRemoved;
  final VoidCallback onClearAll;

  ProductSearchDelegate({
    required this.searchHistory,
    required this.onHistoryRemoved,
    required this.onClearAll,
  });

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColor.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColor.primary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColor.primary),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        hintStyle: Get.textTheme.titleSmall,
        labelStyle: Get.textTheme.titleSmall,
      ),
      textTheme: TextTheme(
        titleMedium: Get.textTheme.titleSmall,
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Implement your search results here
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Last Search',
                style: Get.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              if (searchHistory.isNotEmpty)
                TextButton(
                  onPressed: onClearAll,
                  child: Text(
                    'Clear all',
                    style: Get.textTheme.bodyMedium!.copyWith(
                      color: AppColor.primary,
                    ),
                  ),
                ),
            ],
          ),
        ),
        if (searchHistory.isEmpty)
          Expanded(
            child: Center(
              child: Text(
                'No search history',
                style: Get.textTheme.bodyMedium!.copyWith(
                  color: Colors.grey[600],
                ),
              ),
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 8,
              runSpacing: 12,
              children: searchHistory.map((term) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.grey.shade200),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade100,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: IntrinsicWidth(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            term,
                            style: Get.textTheme.bodyMedium!.copyWith(
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                        Material(
                          type: MaterialType.transparency,
                          child: InkWell(
                            borderRadius: BorderRadius.circular(20),
                            onTap: () => onHistoryRemoved(term),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.close,
                                size: 18,
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }

  @override
  String get searchFieldLabel => 'Search';

  @override
  TextStyle? get searchFieldStyle => Get.textTheme.titleSmall;
}
