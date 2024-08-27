import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final TextEditingController? searchController;
  final VoidCallback? onFilterPressed;

  const SearchTextField({
    super.key,
    this.searchController,
    this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          hintText: 'Search...',
          prefixIcon: Icon(Icons.search),
          suffixIcon: IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: onFilterPressed,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(vertical: 14.0),
        ),
      ),
    );
  }
}
