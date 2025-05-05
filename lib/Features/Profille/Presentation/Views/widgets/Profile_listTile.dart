import 'package:flutter/material.dart';

class ProfileListtile extends StatefulWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  const ProfileListtile(
      {super.key, required this.icon, required this.text, required this.onTap});

  @override
  State<ProfileListtile> createState() => _ProfileListtileState();
}

class _ProfileListtileState extends State<ProfileListtile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(widget.icon),
      title: Text(
        widget.text,
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: widget.onTap,
    );
  }
}
/*
 leading: Icon(Icons.history),
                  title: Text("Booking History"),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // booking history page
                  },
*/
