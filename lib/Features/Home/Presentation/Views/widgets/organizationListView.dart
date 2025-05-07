/*Yara❤️*/
import 'package:eventk/Core/utils/styles.dart';
import 'package:eventk/Core/widgets/FailureScaffold.dart';
import 'package:eventk/Features/Home/Data/model/organizationModel.dart';
import 'package:eventk/Features/Home/Presentation/Manager/organization_cubit.dart';
import 'package:eventk/Features/Home/Presentation/Manager/organization_state.dart';
import 'package:eventk/Features/Home/Presentation/Views/widgets/organization.dart';
import 'package:eventk/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

List<OrganizationModel> organizations = [];
bool isLoading = false;

class OrganizationListView extends StatelessWidget {
  const OrganizationListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrganizationCubit, OrganizationState>(
      listener: (context, state) {
        if (state is SuccessOrganizationState) {
          organizations = state.organizationList;
        } else if (state is FailureOrganizationState) {
          showFailureSnackBar(context, state.errMessage);
          isLoading = false;
        } else if (state is LoadingOrganizationState) {
          isLoading = true;
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: isLoading,
          progressIndicator: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(kButtonsColor),
          ),
          child: ListView.builder(
                            shrinkWrap: true,

            physics: NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              if (index < 4) {
                return Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Organization(
                    organizationss: organizations[index],
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      //backgroundBuilder: ,
                      backgroundColor: const Color.fromARGB(255, 183, 219, 246),
                    ),
                    child: Text(
                      'See more',
                      style: Styles.styleText20.copyWith(color: Colors.white),
                    ),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}
