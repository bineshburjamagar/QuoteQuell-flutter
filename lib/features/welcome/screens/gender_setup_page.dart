import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:kavyanepal/components/components.dart';
import 'package:kavyanepal/config/config.dart';

class GenderSetupPage extends StatefulHookWidget {
  const GenderSetupPage({Key? key}) : super(key: key);
  static const String routeName = "/gendersetuppage";
  static GoRoute route() {
    return GoRoute(
      path: routeName,
      builder: (context, state) => const GenderSetupPage(),
    );
  }

  @override
  State<GenderSetupPage> createState() => _GenderSetupPageState();
}

class _GenderSetupPageState extends State<GenderSetupPage> {
  final List<String> gender = [
    'Male',
    'Female',
    'Other',
  ];
  @override
  Widget build(BuildContext context) {
    final selectedGender = useState<String>('Male');
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppBar(),
          SliverPadding(
            padding:
                const EdgeInsets.symmetric(horizontal: 23.0, vertical: 10.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    AssetPath.gender,
                    alignment: Alignment.center,
                  ),
                  const Center(
                    child: Text(
                      'What is your current gender?',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: gender.length,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10.0,
                    ),
                    itemBuilder: (context, index) {
                      return ListTile(
                        tileColor: Theme.of(context).hoverColor,
                        shape: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2.0,
                            color: (selectedGender.value == gender[index])
                                ? Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.3)
                                : Theme.of(context).scaffoldBackgroundColor,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        title: Text(gender[index]),
                        onTap: () {
                          selectedGender.value = gender[index];
                        },
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.0, vertical: 20.0),
        child: CustomButton(),
      ),
    );
  }
}
