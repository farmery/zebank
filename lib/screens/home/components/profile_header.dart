import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../auth.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Welcome back',
            style:
                TextStyle(color: Colors.white.withOpacity(0.65), fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            auth.user!.displayName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]),
        InkWell(
          onTap: () {
            auth.loginOut();
          },
          child: CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primaryVariant,
            radius: 25,
            child: Icon(
              CupertinoIcons.person,
              color: Colors.white.withOpacity(0.65),
            ),
          ),
        )
      ],
    );
  }
}
