import 'package:event_mgm/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Addevent extends StatefulWidget {
  const Addevent({super.key});

  @override
  State<Addevent> createState() => _AddeventState();
}

class _AddeventState extends State<Addevent> {
  int currentStep = 0;
  DateTime? _selectedDateTime;

  Future<void> _selectDateTime(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate == null) return;

    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute),
    );

    if (selectedTime == null) return;

    setState(() {
      _selectedDateTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedTime.hour,
        selectedTime.minute,
      );
    });
  }

  List<Step> getSteps() {
    return [
      const Step(
        title: Text('Event Name'),
        content: TextField(),
        isActive: true,
      ),
      const Step(
        title: Text('Speaker Name'),
        content: TextField(),
        isActive: true,
      ),
      const Step(
        title: Text('Stage Name'),
        content: TextField(),
        isActive: true,
      ),
      const Step(
        title: Text('Stage Capacity'),
        content: TextField(),
        isActive: true,
      ),
      Step(
        title: const Text('Time and Date'),
        content: Column(
          children: [
            ElevatedButton(
              onPressed: () => _selectDateTime(context),
              child: const Text('Select Date and Time'),
            ),
            if (_selectedDateTime != null)
              Text('Selected DateTime: $_selectedDateTime'),
          ],
        ),
        isActive: true,
      ),
      const Step(
        title: Text('Description'),
        content: TextField(),
        isActive: true,
      ),
      const Step(
        title: Text('Add Image'),
        content: TextField(),
        isActive: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.buttoncolor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.keyboard_backspace_sharp, color: Colors.white),
        ),
        title: Text(
          'Create Event',
          style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 18),
        ),
      ),
      body: Stepper(
        currentStep: currentStep,
        steps: getSteps(),
        type: StepperType.vertical,
        onStepTapped: (int step) {
          setState(() {
            currentStep = step;
          });
        },
        onStepCancel: () {
          setState(() {
            if (currentStep > 0) {
              currentStep -= 1;
            }
          });
        },
        onStepContinue: () {
          setState(() {
            if (currentStep < getSteps().length - 1) {
              currentStep += 1;
            } else {
              currentStep = 0;
            }
          });
        },
      ),
    );
  }
}
