import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_application_1/screen/welcome.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  String selectedAppointmentType = 'นัดหมายแพทย์';
  int currentStep = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  void _selectDateAndTime(BuildContext context) async {
    selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      selectedTime = await showTimePicker(
        // ignore: use_build_context_synchronously
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (selectedTime != null) {
        setState(() {});
      }
    }
  }

  Widget _buildAppointmentTypeSelector() {
    return Column(
      children: [
        _buildAppointmentButton(
          icon: Icons.medical_services,
          label: 'นัดหมายแพทย์',
          value: 'นัดหมายแพทย์',
        ),
        const SizedBox(height: 10),
        _buildAppointmentButton(
          icon: Icons.health_and_safety,
          label: 'ตรวจสุขภาพ',
          value: 'ตรวจสุขภาพ',
        ),
        const SizedBox(height: 10),
        _buildAppointmentButton(
          icon: Icons.vaccines,
          label: 'ฉีดวัคซีน',
          value: 'ฉีดวัคซีน',
        ),
      ],
    );
  }

  Widget _buildAppointmentButton(
      {required IconData icon, required String label, required String value}) {
    bool isSelected = selectedAppointmentType == value;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAppointmentType = value;
        });
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green[100] : Colors.white,
          border: Border.all(color: isSelected ? Colors.green : Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 15),
            Icon(icon,
                size: 30, color: isSelected ? Colors.green : Colors.grey),
            const SizedBox(width: 15),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.green : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepIndicator(int stepIndex, String stepLabel) {
    return Column(
      children: [
        Text(
          stepLabel,
          style: TextStyle(
            fontSize: 16,
            color: currentStep >= stepIndex ? Colors.green : Colors.grey,
          ),
        ),
        Icon(
          Icons.circle,
          color: currentStep >= stepIndex ? Colors.green : Colors.grey,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ทำนัด'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStepIndicator(0, 'เริ่มต้น'),
                _buildStepIndicator(1, 'ข้อมูลการนัด'),
                _buildStepIndicator(2, 'ข้อมูลผู้ป่วย'),
                _buildStepIndicator(3, 'ยืนยันการนัด'),
              ],
            ),
            const SizedBox(height: 20),
            if (currentStep == 0) _buildAppointmentTypeSelector(),
            if (currentStep == 1) ...[
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _selectDateAndTime(context);
                  },
                  child: const Text(
                    "เลือกวันที่และเวลา",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              if (selectedDate != null && selectedTime != null) ...[
                const SizedBox(height: 10),
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'วันที่เลือก: ${DateFormat('yyyy-MM-dd').format(selectedDate!)}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'เวลาที่เลือก: ${selectedTime!.format(context)}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ],
            if (currentStep == 2) ...[
              _buildRadioButton(),
              _buildPatientForm(),
            ],
            if (currentStep == 3) ...[
              const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 100,
                      color: Colors.green,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'ยืนยันการนัดหมาย',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (currentStep == 0) {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const WelcomeScreen()),
                          (route) => false,
                        );
                      } else if (currentStep > 0) {
                        currentStep--;
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'ย้อนกลับ',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (currentStep == 3) {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const WelcomeScreen()),
                          (route) => false,
                        );
                      } else if (currentStep < 3) {
                        currentStep++;
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'ถัดไป',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioButton() {
    return Column(
      children: [
        RadioListTile<String>(
          title: const Text('นัดหมายให้ตัวเอง'),
          value: 'ตัวเอง',
          groupValue: selectedAppointmentType,
          onChanged: (String? value) {
            setState(() {
              selectedAppointmentType = value!;
            });
          },
        ),
        RadioListTile<String>(
          title: const Text('นัดหมายให้คนอื่น'),
          value: 'คนอื่น',
          groupValue: selectedAppointmentType,
          onChanged: (String? value) {
            setState(() {
              selectedAppointmentType = value!;
            });
          },
        ),
      ],
    );
  }

  Widget _buildPatientForm() {
    return Visibility(
      visible: selectedAppointmentType == 'คนอื่น',
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'คำนำหน้า'),
            items: ['นาย', 'นาง', 'นางสาว'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {},
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'ชื่อ'),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'นามสกุล'),
          ),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'เพศ'),
            items: ['ชาย', 'หญิง', 'อื่นๆ'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {},
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'วันเกิด'),
            onTap: () async {
              DateTime? date = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime(2101),
              );
              if (date != null) {}
            },
          ),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(labelText: 'สัญชาติ'),
            items: ['ไทย', 'อื่นๆ'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (newValue) {},
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'เบอร์โทร'),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'อีเมล'),
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'เลขบัตรประชาชน'),
          ),
        ],
      ),
    );
  }
}
