import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'custom_icon_button.dart';
import 'topics_text_form.dart';

class CreateTopicView extends StatefulWidget {
  const CreateTopicView({Key key}) : super(key: key);

  @override
  State<CreateTopicView> createState() => _CreateTopicViewState();
}

class _CreateTopicViewState extends State<CreateTopicView> {
  TextEditingController _titleTextController;
  TextEditingController _descriptionTextController;
  List<XFile> _pickedImages = <XFile>[];
  final GlobalKey<FormState> _topicFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    _titleTextController = TextEditingController();
    _descriptionTextController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleTextController.dispose();
    _descriptionTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('TOPIC'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          )
        ],
      ),
      floatingActionButton: InkWell(
        onTap: () {
          FocusScope.of(context).unfocus();
          if (_topicFormKey.currentState.validate()) {
            // TODO: Create topics code.
          }
        },
        child: Container(
          height: 38,
          width: 85,
          color: Colors.purple.withOpacity(.8),
          child: const Center(
            child: Text(
              'Create',
              style: TextStyle(
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _topicFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Title'),
                TopicTextForm(
                  titleTextController: _titleTextController,
                  validationText: 'Topic title is missing!',
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text('Description'),
                TopicTextForm(
                  titleTextController: _descriptionTextController,
                  maxLine: 5,
                  validationText: 'Topic description is missing!',
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text('Attach'),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomIconButton(
                      icon: Icons.photo,
                      buttonText: 'Media',
                      onTap: () {
                        ImagePicker().pickMultiImage().then(
                          (images) {
                            if (images != null) {
                              setState(
                                () {
                                  _pickedImages = images;
                                },
                              );
                            }
                          },
                        );
                      },
                    ),
                    CustomIconButton(
                      icon: Icons.camera_alt_outlined,
                      buttonText: 'Capture',
                      onTap: () {},
                    ),
                    CustomIconButton(
                      icon: Icons.file_present,
                      buttonText: 'Document',
                      onTap: () {},
                    ),
                    CustomIconButton(
                      icon: Icons.mic_none_outlined,
                      buttonText: 'Voice',
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width / 2.2,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _pickedImages.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Image.file(File(_pickedImages[index].path)),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
