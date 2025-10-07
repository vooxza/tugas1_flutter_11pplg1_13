import 'package:flutter/material.dart';
import 'package:flutter_testing_1/widgets/widget_button.dart';
import 'package:flutter_testing_1/widgets/widget_textfield.dart';
import 'package:get/get.dart';
import '../controllers/contact_controller.dart';

class ContactPage extends StatelessWidget {
  final ContactController controller = Get.find<ContactController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Name Page'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: MyTextField(
                    textEditingController: controller.nameController,
                    labelText: 'Input Name',
                  ),
                ),
                const SizedBox(width: 8),
                CustomButton(
                  text: 'Save',
                  textColor: Colors.black,
                  onPressed: controller.addName,
                ),
              ],
            ),
            const SizedBox(height: 16),

            Expanded(
              child: Obx(() {
                if (controller.names.isEmpty) {
                  return const Center(child: Text('No names saved yet'));
                }

                return ListView.builder(
                  itemCount: controller.names.length,
                  itemBuilder: (context, index) {
                    final contact = controller.names[index];

                    return Dismissible(
                      key: ValueKey(contact['id']),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      confirmDismiss: (direction) async {
                        return await showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Delete Name'),
                            content: const Text(
                              'Are you sure you want to delete this name?',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const Text(
                                  'Delete',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      onDismissed: (direction) {
                        controller.deleteName(contact['id']);
                        Get.snackbar(
                          'Deleted',
                          '${contact['name']} has been removed',
                          duration: const Duration(seconds: 2),
                        );
                      },
                      child: Card(
                        elevation: 2,
                        margin: const EdgeInsets.symmetric(vertical: 4),
                        child: ListTile(
                          title: Text(contact['name']),
                          trailing: IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              final editController = TextEditingController(
                                text: contact['name'],
                              );

                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Edit Name'),
                                  content: TextField(
                                    controller: editController,
                                    decoration: const InputDecoration(
                                      labelText: 'Enter new name',
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        controller.updateName(
                                          contact['id'],
                                          editController.text,
                                        );
                                        Navigator.of(context).pop();
                                        Get.snackbar(
                                          'Updated',
                                          '${contact['name']} has been updated to ${editController.text}',
                                          duration:
                                              const Duration(seconds: 2),
                                        );
                                      },
                                      child: const Text('Save'),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
