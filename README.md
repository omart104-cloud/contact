# Route Contact App 📱

A modern and intuitive Flutter application built for seamless contact management. This app provides a clean user interface to create, view, and manage personal contacts with integrated multimedia support and robust data validation.

## 🎥 App Demo



https://github.com/user-attachments/assets/12bc668e-2774-4c5f-b83a-9d23bfdcb989



---

## ✨ Key Features

* **Professional Splash Screen:** Custom branded entrance using the "Route" logo.
* **Full CRUD Functionality:**
    * **Create:** Add new contacts with detailed information.
    * **Read:** View your contacts in an organized list or grid view.
    * **Update:** Edit existing contact details.
    * **Delete:** Remove individual entries or use the **Clear All** feature.
* **Multimedia Integration:**
    * Attach photos from your **Gallery**.
    * Take new profile pictures directly using the **Camera**.
* **Smart Input Validation:**
    * Real-time feedback for email formats.
    * Visual cues (fields turning red) for invalid entries.
* **Empty State Handling:** User-friendly prompts when the contact list is empty.

---

## 🛠️ Technical Highlights

### 🛡️ Data Integrity & Regex
The application ensures high data quality by using Regular Expressions for input validation. For example, it validates email patterns and enforces password complexity:
* **Pattern:** `r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'` for standard email verification.
* **Rule:** Passwords must be at least 8 characters, including uppercase letters and numbers.

### 🔀 Navigation & Data Passing
The app architecture relies on efficient navigation patterns:
* **Constructor Injection:** Passing contact objects directly to detail screens.
* **Named Routes:** Using `ModalRoute` to retrieve arguments for complex screen transitions.

### 📐 System Architecture
[cite_start]Based on structured object-oriented principles[cite: 13], the app's internal logic mirrors clean runtime instances:
* [cite_start]**User/Homeowner Instance**: Manages core profile data[cite: 15].
* [cite_start]**Contact Object**: Stores attributes like unique IDs, email addresses, and status[cite: 15, 21].

---

## 🚀 Getting Started

### Prerequisites
* Flutter SDK: `^3.0.0`
* Dart: `^3.0.0`

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/omart104-cloud/contact
    ```
2.  **Navigate to the project directory:**
    ```bash
    cd contact_app
    ```
3.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
4.  **Run the application:**
    ```bash
    flutter run
    ```

---

## 📦 Main Dependencies

* `image_picker`: For handling camera and gallery image selection.
* `google_fonts`: For custom typography.

---

## 📜 License
Distributed under the MIT License. See `LICENSE` for more information.
