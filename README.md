# 🐄 HandyFarm — Smart Livestock Farm Management Application

<p align="center">
  <b>A bilingual mobile application for digital livestock and farm management</b>
</p>

<p align="center">
  Final Year Project | BS Computer Science | UET Taxila
</p>

---

## 📌 Overview

**HandyFarm** is a smart livestock farm management mobile application developed to simplify and digitize day-to-day farm operations.

The project was designed particularly for farmers who may find existing livestock management applications difficult to use because of complex interfaces, language barriers, or limited farm-management functionality.

A major goal of HandyFarm is to provide an easy-to-use **English and Urdu interface**, making digital farm management more accessible to local farmers.

The application brings several farm-management activities into one system, including:

- 🐄 Animal management
- 👨‍🌾 Employee management
- 🥛 Milk production records
- 💰 Expense management
- 💵 Sales management
- 💊 Medicine records
- 🚜 Machinery management

---

## 🎯 Problem Statement

Many livestock farmers still rely on manual records and paperwork for managing farm activities.

Existing farm-management applications may also present several challenges:

- Lack of support for local languages such as Urdu
- Interfaces that can be difficult for less technically experienced users
- Limited employee-management functionality
- Incomplete farm activity management
- Difficulty maintaining financial and livestock records in one place
- Lack of localized solutions for native farmers

**HandyFarm was developed to address these challenges by providing a simple and centralized digital farm-management solution.**

---

## ✨ Key Features

### 🐄 Animal Management

Users can maintain livestock records and perform operations such as:

- Add animals
- View animal information
- Update animal records
- Remove animal records
- Maintain relevant livestock information

### 👨‍🌾 Employee Management

Farm owners can maintain employee information digitally.

The system supports:

- Adding employees
- Updating employee information
- Removing employee records
- Maintaining employee-related information

### 💰 Expense Management

Users can record and manage farm expenses to maintain better financial records.

### 💵 Sales Management

The application allows farm owners to maintain records of farm sales and related transactions.

### 🥛 Milk Production Management

Milk-production information can be recorded and managed digitally instead of using manual registers.

### 💊 Medicine Management

Users can maintain medicine records required for livestock management.

### 🚜 Machinery Management

Farm machinery information can be added, modified, viewed, and removed through the application.

### 🌐 Urdu & English Support

One of the primary motivations behind HandyFarm was accessibility.

The application was designed to support both:

- **English**
- **Urdu**

This makes the system more accessible to local farmers who may have difficulty using English-only farm-management applications.

### 📱 Offline Availability

The application was designed to maintain farm information locally so that core functionality could be used without continuous Internet connectivity.

---

## 🛠️ Technology Stack

| Technology | Purpose |
|---|---|
| **Flutter** | Cross-platform mobile application development |
| **Dart** | Application programming language |
| **Floor** | SQLite abstraction and local database management |
| **SQLite** | Local data storage |
| **Android Studio** | Development environment |
| **Adobe XD** | UI/UX prototyping and interface design |

Other tools used during the project included AVD Manager, Proto.io, Vysor, and SourceTree.

---

## 🏗️ System Modules

HandyFarm is organized around the major activities involved in livestock farm management.

```text
                     HandyFarm
                         │
        ┌────────────────┼────────────────┐
        │                │                │
   Livestock        Employees         Finance
        │                │                │
   ┌────┴────┐      Management      ┌────┴────┐
 Animals   Milk                      Sales   Expenses
        │
   ┌────┴────────┐
 Medicines   Machinery
```

The application provides CRUD-style operations for major farm records, allowing information to be added, viewed, modified, and removed.

---

## 👥 Target Users

HandyFarm was designed for:

- Livestock farmers
- Farm owners
- Farm managers
- Farmers managing multiple farms
- Small or part-time farmers
- Dairy farmers
- Farmers who prefer an Urdu-language interface

---

## ⚙️ Functional Requirements

The application was designed to support:

- Employee registration and management
- Animal record management
- Sales record management
- Expense management
- Milk-production management
- Medicine management
- Machinery management
- Farm activity tracking
- Easy navigation for less technically experienced users

---

## 💾 Local Database

HandyFarm uses **Floor**, a SQLite abstraction layer for Flutter, for local data persistence.

This approach provides:

- Local storage
- Structured farm records
- Type-safe database interaction
- Lightweight database operations
- Offline access to stored information

The application stores information related to major entities such as animals, employees, sales, expenses, medicines, machinery, and milk production.

---

## 🔄 Development Methodology

The project followed an **Agile development approach**.

The development process included:

```text
Ideation
   ↓
Requirement Analysis
   ↓
UI/UX Design
   ↓
Implementation
   ↓
Testing
   ↓
Deployment & Maintenance
```

An iterative approach allowed the application to be refined throughout development based on requirements and testing.

---

## 🧪 Testing

Functional testing was performed on the major application modules.

Test cases included:

| Test Case | Module |
|---|---|
| TC-001 | Add Employee |
| TC-002 | Add Animal |
| TC-003 | Add Medicine |
| TC-004 | Add Expense |
| TC-005 | Add Milk |
| TC-006 | Add Sales |
| TC-007 | Add Machine |

The tests checked both valid and invalid input scenarios.

For example, when required fields were left empty, the system was expected to prevent record creation and display an appropriate error message.

---

## 📂 Suggested Repository Structure

```text
HandyFarm/
│
├── android/
├── ios/
├── lib/
│   ├── main.dart
│   ├── models/
│   ├── database/
│   ├── screens/
│   └── widgets/
│
├── assets/
│
├── screenshots/
│
├── docs/
│   └── HandyFarm_FYP_Report.pdf
│
├── pubspec.yaml
├── README.md
└── LICENSE
```

> The exact repository structure may vary depending on the original project files.

---

## 🚀 Getting Started

### Prerequisites

Before running the project, install:

- Flutter SDK
- Dart SDK
- Android Studio
- Android Emulator or a physical Android device

Check your Flutter installation:

```bash
flutter doctor
```

### Clone the Repository

```bash
git clone https://github.com/YOUR-USERNAME/HandyFarm.git
cd HandyFarm
```

### Install Dependencies

```bash
flutter pub get
```

### Run the Application

```bash
flutter run
```

---

## 📱 Application Workflow

A typical workflow in HandyFarm is:

```text
Launch Application
       ↓
Main Dashboard
       ↓
Select Farm Module
       ↓
Add / View / Update / Delete Record
       ↓
Store Information Locally
       ↓
View Updated Farm Records
```

---

## 🔮 Future Enhancements

The original project identified several possible extensions:

- 🐑 Flock management
- 🐓 Bird management
- 💊 Medicine inventory/store management
- 🧬 Extended animal pedigree information
- 🩺 Animal disease information

These features could further expand HandyFarm into a more comprehensive livestock-management platform.

---

## 🎓 Academic Project

**Project:** HandyFarm — Smart Livestock Farm Management Application  
**Type:** Final Year Project (FYP)  
**Degree:** BS Computer Science  
**Session:** 2017–2021  
**University:** University of Engineering and Technology (UET), Taxila  
**Department:** Department of Computer Science  

### Developers

**Fatima Noor**  
BS Computer Science — UET Taxila

**Misbah Aleem**  
BS Computer Science — UET Taxila

### Supervisor

**Dr. Farrukh Zeeshan Khan**

---

## 💡 Project Motivation

The central idea behind HandyFarm was simple:

> **Make livestock farm management easier, more organized, and more accessible to local farmers through digital technology and native-language support.**

Instead of maintaining separate paper records for livestock, employees, milk production, medicines, machinery, expenses, and sales, HandyFarm brings these activities together in a single mobile application.

---

## 📄 Project Documentation

Detailed information about requirement analysis, use cases, system design, activity diagrams, sequence diagrams, class diagrams, implementation, user interfaces, and testing is available in the **HandyFarm Final Year Project Report**.

---

## 👩‍💻 Author

### Fatima Noor

Computer Science graduate and researcher interested in:

- Artificial Intelligence
- Computer Vision
- Multimodal AI
- Machine Learning
- Mobile & Intelligent Applications

---

## ⭐ Acknowledgment

HandyFarm was developed as a Final Year Project at the **Department of Computer Science, University of Engineering and Technology (UET), Taxila** under the supervision of **Dr. Farrukh Zeeshan Khan**.

---

<p align="center">
  <b>HandyFarm — Digitizing livestock management for smarter farming.</b>
</p>
