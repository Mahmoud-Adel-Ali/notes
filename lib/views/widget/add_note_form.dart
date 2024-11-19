import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/model/note_model.dart';
import 'package:notes/views/widget/custom_buttom.dart';
import 'package:notes/views/widget/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  // use to validat form input
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  //
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 16),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hint: 'Title',
            maxLine: 1,
          ),
          const SizedBox(height: 12),
          CustomTextField(
              onSaved: (value) {
                subTitle = value;
              },
              hint: "Content",
              maxLine: 5),
          const SizedBox(height: 32),
          // Spacer(),
          BlocBuilder<AddNoteCubit, AddNoteState>(builder: (context, state) {
            return CustomButtom(
              isLoading: state is AddNoteLoading ? true : false,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  var currentDate = DateTime.now();
                  var formattedDate =
                      DateFormat('dd-MM-YYYY').format(currentDate);
                  NoteModel noteModel = NoteModel(
                    title: title!,
                    subTitle: subTitle!,
                    date: formattedDate,
                    color: Colors.blue.value,
                  );
                  BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            );
          }),
          // SizedBox(height: 16),
        ],
      ),
    );
  }
}
