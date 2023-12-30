import 'package:flutter/material.dart';

class SearchInputField extends StatefulWidget {
  // final FocusNode focusNode;
  final TextEditingController searchController;
  final bool isSearchMode;
  const SearchInputField({
    super.key,
    // required this.focusNode,
    required this.searchController,
    required this.isSearchMode,
  });

  @override
  State<SearchInputField> createState() => _SearchInputFieldState();
}

class _SearchInputFieldState extends State<SearchInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        controller: widget.searchController,
        // focusNode: widget.focusNode,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(bottom: 20),
          label: const Text(
            "Type Something Here To Search..",
            style: TextStyle(fontSize: 20),
          ),
          border: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          suffixIcon: widget.isSearchMode
              ? IconButton(
                  onPressed: () {
                    widget.searchController.clear();
                  },
                  icon: const Icon(
                    Icons.cancel_outlined,
                    size: 30,
                  ))
              : null,
        ),
        style: const TextStyle(fontSize: 23),
      ),
    );
  }
}
