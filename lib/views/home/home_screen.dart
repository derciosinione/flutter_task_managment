import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:im_task_managment/routes/app_routes.dart';
import 'package:im_task_managment/themes/app_colors.dart';
import 'package:im_task_managment/utils/app_config.dart';
import 'package:provider/provider.dart';

import '../../providers/user_provider.dart';
import '../../shared/components/app_button_navigation_bar.dart';
import '../../shared/components/project_card.dart';
import '../../themes/app_text_style.dart';
import '../../utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.user;

    return Scaffold(
      backgroundColor: AppColors.body,
      appBar: AppBar(
        backgroundColor: AppColors.body,
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: Transform.translate(
            offset: const Offset(18, 0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, AppRoutes.editProfile);
              },
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1599566150163-29194dcaad36?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: IconButton(
              onPressed: () {
                //TODO: implement logout
                Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.login,
                );
              },
              tooltip: "Sair",
              icon: const Icon(
                IconlyLight.logout,
                size: 38,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
        // leadingWidth: 50,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppConfig.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Olá, ${user!.name}",
                    style: AppTextStyles.titleHome,
                  ),
                  Text(
                    formatDate(DateTime.now()),
                    style: AppTextStyles.secondaryTitle,
                  ),
                ],
              ),
              const SizedBox(height: 15),
              TextField(
                autofocus: false,
                decoration: InputDecoration(
                  hintText: 'Pesquisar',
                  hintStyle: AppTextStyles.titleNormal(AppColors.input, 14),
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10), // Adjust vertical padding to reduce height
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColors.lineShapeMenu, width: 1.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColors.lineShapeMenu, width: 1.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: AppColors.lineShapeMenu, width: 1.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  suffixIcon: Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: const Icon(
                      IconlyLight.search,
                      color: AppColors.input,
                      size: 22,
                    ),
                  ),
                  filled: true,
                  fillColor: AppColors.white,
                ),
                style: AppTextStyles.titleNormal(
                    AppColors.blackShape4, 14), // Adjust text style
              ),
              const SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Projetos",
                          style: AppTextStyles.titleSemiBold(
                              AppColors.blackShape, 14)),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: AppColors.primaryOpacity,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Em Progresso",
                          style: AppTextStyles.titleRegular),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: AppColors.primaryOpacity,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:
                          Text("Concluídos", style: AppTextStyles.titleRegular),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        color: AppColors.primaryOpacity,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Não iniciados",
                          style: AppTextStyles.titleRegular),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: ProjectCard(),
                  );
                },
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(itemIndex: 0),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.createProject);
        },
        backgroundColor: AppColors.primary,
        tooltip: "Adicionar novo projeto",
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        elevation: 8,
        child: const Icon(
          Icons.add,
          color: AppColors.white,
          size: 35,
        ),
      ),
    );
  }
}
