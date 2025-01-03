import 'package:e_commerce/theme/theme.dart';
import 'package:e_commerce/view/widget/gradient_button.dart';
import 'package:flutter/material.dart';

class ChooselanguageScreen extends StatefulWidget {
  const ChooselanguageScreen({super.key});

  @override
  State<ChooselanguageScreen> createState() => _ChooselanguageScreenState();
}

class _ChooselanguageScreenState extends State<ChooselanguageScreen> {
  String? _selectedLanguage;

  final List<Map<String, String>> _language = [
    {
      "code": "en",
      "name": "English",
      "nativeName": "English",
    },
    {
      "code": "es",
      "name": "Spanish",
      "nativeName": "Espanol",
    },
    {
      "code": "fr",
      "name": "French",
      "nativeName": "Francais",
    },
    {
      "code": "de",
      "name": "German",
      "nativeName": "Deutsch",
    },
    {
      "code": "ti",
      "name": "Italian",
      "nativeName": "Italion",
    },
  ];
  void _handLanguageSelection() {
    if (_selectedLanguage != null) {
      // Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back, color: AppTheme.textPrimary))),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Chosose Language",
                      style: Theme.of(context).textTheme.displayLarge),
                  SizedBox(height: 8),
                  Text("Select your preferred Language",
                      style: TextStyle(fontSize: 16)),
                  SizedBox(height: 32),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _language.length,
                    itemBuilder: (context, index) {
                      final language = _language[index];
                      final isSelected = language['code'] == _selectedLanguage;
                      return Container(
                        margin: EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: isSelected
                                  ? AppTheme.primaryColor
                                  : AppTheme.TextSecondry.withOpacity(0.2),
                              width: isSelected ? 2 : 1,
                            ),
                            borderRadius: BorderRadius.circular(12)),
                        //!

                        //! Erroe
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _selectedLanguage = language['code'];
                            });
                          },
                          borderRadius: BorderRadius.circular(12),
                          child: Padding(
                            padding: EdgeInsets.all(16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        language['name']!,
                                        style: TextStyle(
                                            color: AppTheme.textPrimary,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        language['nativeName']!,
                                        style: TextStyle(
                                            color: AppTheme.TextSecondry,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                      // shape: BoxShape.circle,
                                      border: Border.all(
                                        color: isSelected
                                            ? AppTheme.primaryColor
                                            : AppTheme.TextSecondry.withOpacity(
                                                0.2),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(12)),
                                  child: isSelected
                                      ? Container(
                                          margin: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: AppTheme.primaryColor,
                                            shape: BoxShape.circle,
                                          ),
                                        )
                                      : null,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 32),
                  Padding(
                    padding: EdgeInsets.all(24),
                    child: GradientButton(
                        text: 'Continue', onPressed: _handLanguageSelection),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
