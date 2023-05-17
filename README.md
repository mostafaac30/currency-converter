Flutter Currency Converter App
------------------------------

This is a Flutter app that allows users to convert currencies using the ExchangeRate API. The app features a well-structured design, error handling, client-side pagination (since the API does not support pagination), and informative feedback toasts.

### App Features

*   Well-organized files and code structure: The app follows a modular approach with clear separation of concerns. Each feature represents a specific aspect of the app (model (data layer), view, viewmodel) and contains related files. This modular structure makes it easier to navigate and maintain the codebase.

*   Separation of responsibilities: The code structure follows the principle of separation of concerns, ensuring that each component has a specific responsibility. The Model layer handles data-* *   related operations, the View layer focuses on UI rendering, and the ViewModel layer handles the presentation logic. This separation makes the codebase more maintainable and testable.

*   Code reuse: By separating the different components of the app into separate files and directories, code reuse is promoted. Models, services, and utility classes can be reused across different *   views and viewmodels, reducing duplication and improving code efficiency.

*   Scalability: The code structure is designed to accommodate future growth and scalability. As the app evolves, new features can be added by extending the existing structure without causing major disruptions. This allows for easier collaboration among team members and ensures that the app can adapt to changing requirements.

*   Easy debugging and troubleshooting: With a well-structured codebase, debugging and troubleshooting become more straightforward. Each component has a clear responsibility, making it easier to identify and isolate issues. Additionally, the separation of concerns enables unit testing of individual components, aiding in the identification and resolution of bugs..

*   Well-Structured Design: The app is designed to provide a user-friendly experience with a clean and intuitive interface.
    
*   Error Handling: The app handles network failures, invalid API responses, and other error scenarios gracefully. Users will receive appropriate error messages and prompts.
    
*   Client-Side Pagination: Since the ExchangeRate API does not support pagination, the app implements client-side pagination. The data is fetched and displayed in chunks of 10 records per API call.
    
*   Informative Feedback Toasts: The app provides informative toasts to give users feedback on various actions and events, such as successful data loading or error notifications.
    


### How to Run the App

1.  Ensure that you have Flutter SDK installed on your machine. If not, follow the official Flutter installation guide: [Flutter Installation](https://flutter.dev/docs/get-started/install)
    
2.  Clone this repository to your local machine using Git or download it as a ZIP file.
    
3.  Open the terminal or command prompt and navigate to the project's root directory.
    
4.  Run the following command to fetch the project dependencies:
    
    arduinoCopy code
    
    `flutter pub get`
    
5.  Connect your Android or iOS device to your machine or start an emulator/simulator.
    
6.  Run the app using the following command:
    
    arduinoCopy code
    
    `flutter run`
    
    This will launch the app on your connected device/emulator.
    


We hope you enjoy using the Flutter Currency Converter App! If you have any questions or encounter any issues, please feel free to reach out to us.
