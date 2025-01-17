import 'package:flutter/material.dart';
import 'package:tech_labs_task/generated/l10n.dart';
import 'package:tech_labs_task/src/config/route/routes_manager.dart';
import 'package:tech_labs_task/src/di/injector.dart';
import 'package:tech_labs_task/src/domain/usecases/contacts/delete_contact_id_use_case.dart';
import 'package:tech_labs_task/src/presentation/screens/landing/widgets/account_header_widget.dart';
import 'package:tech_labs_task/src/presentation/screens/landing/widgets/account_item_widget.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            AccountHeaderWidget(
              logout: () {
                _logout();
              },
            ),
            const SizedBox(
              height: 35,
            ),
            Text(
              S.of(context).welcome("Hassan"),
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(
              height: 32,
            ),
            AccountItemWidget(
              label: S.of(context).profile,
              onTap: () {
                _navigateToProfileScreen(context);
              },
            ),
            const SizedBox(
              height: 24,
            ),
            AccountItemWidget(
              label: S.of(context).notifications,
              onTap: () {},
            ),
            const SizedBox(
              height: 24,
            ),
            AccountItemWidget(
              label: S.of(context).changePassword,
              onTap: () {},
            ),
            const SizedBox(
              height: 24,
            ),
            AccountItemWidget(
              label: S.of(context).manageAccount,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToProfileScreen(BuildContext context) {
    Navigator.pushNamed(
      context,
      Routes.profile,
    );
  }

  void _navigateToRegisterScreen(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.register,
          (route) => false,
    );
  }

  void _logout() async {
    await injector<DeleteContactIdUseCase>()();
    if (context.mounted) {
      _navigateToRegisterScreen(context);
    }
  }


}
