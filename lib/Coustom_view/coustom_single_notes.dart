import 'package:flutter/material.dart';
import 'package:getxwithnotesapp/utils/colors.dart';

class CoustomeSingleNotes extends StatelessWidget {
  final String title;
  final String descriptions;
  final String date;
  final VoidCallback onDelete;

  const CoustomeSingleNotes({
    super.key,
    required this.title,
    required this.descriptions,
    required this.date,
    required this.onDelete, // Add onDelete callback
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.black.withOpacity(.15),
        ),
      ),
      child: ListTile(
        horizontalTitleGap: 0,
        leading: Container(
          height: 10,
          width: 10,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.backgroundColor,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              descriptions,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 10,
                  ),
                ),
                IconButton( // Changed to IconButton for delete action
                  onPressed: onDelete, // Invoke onDelete callback
                  icon: const Icon(Icons.delete_outline),
                ),
              ], // Remove the trailing comma here
            ),
          ],
        ),
      ),
    );
  }
}
