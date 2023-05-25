import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NewPost extends StatefulWidget {
  const NewPost({Key? key}) : super(key: key);

  @override
  State<NewPost> createState() => _NewPostState();
}

class _NewPostState extends State<NewPost> {
  final TextEditingController _contentController = TextEditingController();
  File? _selectedImage;
  void showTemporarySnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message), duration: Duration(seconds: 3));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<int> obtenerIdUsuarioCell() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt('id') ?? 0;
    return id;
  }
  Future<void> _getImageFromGallery() async {
    final pickedImage = await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  Future<void> _submitPost() async {
    if (_contentController.text.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('El contenido no puede estar vacío.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Aceptar'),
            ),
          ],
        ),
      );
      return;
    }
    var headers = {'Content-Type': 'application/json'};
    if (_selectedImage == null) {
      int idd = await obtenerIdUsuarioCell();
      final apiUrl = 'https://drf-api-chirp-chat.onrender.com/publicacion/';
      Map<String, dynamic> data = {'contenido': _contentController.text,"my_self": idd};
      String jsonData = json.encode(data);
      final response = await http.post(
        Uri.parse(apiUrl), headers: headers,
        body: jsonData,
      );
      print('aquiiiiii   ${response.body}  ${response.statusCode}');
    }else{
      final imageBytes = await _selectedImage!.readAsBytes();
      final base64Image = base64Encode(imageBytes);

      final apiUrl = 'https://drf-api-chirp-chat.onrender.com/publicacion/';
      Map<String, dynamic> data = {'contenido': _contentController.text,'imagen': base64Image,"my_self": await obtenerIdUsuarioCell()};
      String jsonData = json.encode(data);
      final response = await http.post(
        Uri.parse(apiUrl), headers: headers,
        body: jsonData,
      );
      if(response.statusCode == 201){
        Navigator.pop(context);
      }else{
        showTemporarySnackBar(context, 'Error en el usuario o contraseña');
      }
    }
  }

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(
                labelText: 'Contenido',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _getImageFromGallery,
              child: const Text('Seleccionar imagen'),
            ),
            const SizedBox(height: 16.0),
            if (_selectedImage != null)
              Image.file(
                _selectedImage!,
                height: 200,
              ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitPost,
              child: const Text('Publicar'),
            ),
          ],
        ),
      ),
    );
  }
}
