import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:petopia/env/env.dart';
import 'package:petopia/widgets/button_widget.dart';
import 'package:http/http.dart' as http;

import '../../theme.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({Key? key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  String _response = '';
  bool _isLoading = false;

  Future<String> generateResponse(String apiKey, String prompt) async {
    var url = Uri.https("api.openai.com", "/v1/completions");
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $apiKey",
      },
      body: json.encode({
        "model": "text-davinci-003",
        "prompt": prompt,
        'temperature': 0,
        'max_tokens': 50,
        'top_p': 1,
        'frequency_penalty': 0.0,
        'presence_penalty': 0.0,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['choices'][0]['text'];
    } else {
      // Failed to get a response from the server
      print('Failed to get a response. Status code: ${response.statusCode}');
      return 'Error: ${response.statusCode}';
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true; 
      });
      String apiKey = Env.apiKey; 
      final prompt = _textEditingController.text;

      final response = await generateResponse(apiKey, prompt);

      setState(() {
        _response = response;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // iconTheme: const IconThemeData(
        //   color: Colors.white,
        // ),
        automaticallyImplyLeading: false,
        backgroundColor: kPurpleColor,
        title: const Text(
          'Chat Bot',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  labelText: 'Ask Away...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: kLightBlackColor),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              buttonWidget(
                context,
                onTap: _submitForm,
                textButton: 'ASK CHAT BOT',
              ),
              const SizedBox(height: 20),
              // if (_isLoading)
              //   const CircularProgressIndicator() 
              // else
                Text('Response: $_response'), 
            ],
          ),
        ),
      ),
    );
  }
}
