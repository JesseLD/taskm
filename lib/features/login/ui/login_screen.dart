import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskm/features/login/data/login_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the LoginModel
    final loginModel = Provider.of<LoginModel>(context);

    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.circular(20),
          ),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${AppLocalizations.of(context)!.welcome_back}👋",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppLocalizations.of(context)!.please_enter_your_details,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: 400,
                        child: TextField(
                          onChanged: (value) => loginModel.setEmail(value),
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.email,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(99),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 400,
                        child: TextField(
                          onChanged: (value) => loginModel.setPassword(value),
                          decoration: InputDecoration(
                            hintText: AppLocalizations.of(context)!.password,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(99),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 12),
                          ),
                          obscureText: true,
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: 400,
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(value: false, onChanged: (value) {}),
                                Text(AppLocalizations.of(context)!
                                    .remember_for_30_days),
                              ],
                            ),
                            Text(AppLocalizations.of(context)!.forgot_password),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: 400,
                        height: 48,
                        child: ElevatedButton(
                          onPressed: () => loginModel.login(),
                          style: ElevatedButton.styleFrom(
                            // primary: Colors.orange,
                            // onPrimary: Colors.white,
                            backgroundColor: Colors.deepPurple,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(99),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 16),
                          ),
                          child: Text(AppLocalizations.of(context)!.log_in),
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (loginModel.isLoading)
                        const CircularProgressIndicator(),
                      if (loginModel.errorMessage.isNotEmpty)
                        Text(
                          loginModel.errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              "${AppLocalizations.of(context)!.dont_have_an_account} "),
                          Text(
                            AppLocalizations.of(context)!.sign_up,
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/bg.jpg',
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
