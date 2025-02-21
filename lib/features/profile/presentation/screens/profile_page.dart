import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kairat/core/theme/app_pallete.dart';

import '../../../../core/translations/translate.dart';
import '../bloc/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(LoadProfile()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text(
            translation(context).profile,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoaded) {
              return _ProfileContent(state);
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}

class _ProfileContent extends StatefulWidget {
  final ProfileLoaded state;
  const _ProfileContent(this.state);

  @override
  _ProfileContentState createState() => _ProfileContentState();
}

class _ProfileContentState extends State<_ProfileContent> {
  late TextEditingController _nameController;
  String? _selectedImage;
  String? _selectedStatus;

  final List<String> statuses = ["Фанат", "Ультрас", "Легенда"];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.state.name);
    _selectedImage = widget.state.imagePath;
    _selectedStatus = widget.state.status;
  }

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _selectedImage = pickedFile.path);
    }
  }

  // ignore: unused_element
  void _saveProfile() {
    context.read<ProfileBloc>().add(
          UpdateProfile(
            name: _nameController.text,
            points: widget.state.points,
            imagePath: _selectedImage,
            status: _selectedStatus!,
          ),
        );
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Сохранено!")));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 12),
          GestureDetector(
            onTap: _pickImage,
            child: CircleAvatar(
              radius: 72,
              backgroundImage: _selectedImage != null
                  ? FileImage(File(_selectedImage!))
                  : null,
              backgroundColor: Colors.white10,
              child: _selectedImage == null
                  ? Icon(
                      Icons.camera_alt,
                      size: 30,
                      color: AppPallete.primaryColor,
                    )
                  : null,
            ),
          ),
          SizedBox(height: 16),
          Text(
            _nameController.text,
            style:
                Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 24),
          ),
          // SizedBox(height: 16),
          // DropdownButtonFormField<String>(
          //   value: _selectedStatus,
          //   onChanged: (newStatus) =>
          //       setState(() => _selectedStatus = newStatus),
          //   items: statuses.map((status) {
          //     return DropdownMenuItem(value: status, child: Text(status));
          //   }).toList(),
          //   decoration: InputDecoration(labelText: "Статус болельщика"),
          // ),
          SizedBox(
            height: 8,
            width: double.infinity,
          ),
          Text(
            " Points: ${widget.state.points}",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          // SizedBox(height: 16),
          // ElevatedButton(
          //   onPressed: _saveProfile,
          //   child: Text("Сохранить"),
          // ),
        ],
      ),
    );
  }
}
