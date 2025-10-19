# AgreementKit  <img src='https://github.com/maziar/ReadmeFiles/blob/main/AgreementKit.svg' width='30'/>

A powerful and customizable iOS SDK for displaying Terms of Service and Privacy Policy agreements with minimal code integration. Save development time and ensure compliance with just a few lines of code.

## 🚀 Why AgreementKit?

**Save Time & Focus on Your Core Features**

Instead of spending hours building custom agreement screens, AgreementKit provides a complete, production-ready solution that handles:

- ✅ **Multi-language support** - Automatically adapts to user's language preferences
- ✅ **Customizable UI** - Dark and light mode themes with full customization options
- ✅ **Server-side content management** - Update terms without app store releases
- ✅ **Compliance ready** - Built-in accept/decline functionality
- ✅ **Easy integration** - Get started with just 2 lines of code
- ✅ **Professional appearance** - Polished UI that matches modern app standards

## 📱 What is AgreementKit?

AgreementKit is an iOS SDK that simplifies the implementation of Terms of Service and Privacy Policy screens in your mobile applications. It provides a complete solution for displaying legal agreements to users, collecting their consent, and managing the user experience around compliance requirements.

### Key Benefits:
- **Time Saving**: Eliminate weeks of development time for agreement screens
- **Compliance**: Ensure your app meets legal requirements for user consent
- **Consistency**: Maintain consistent agreement UI across all your apps
- **Flexibility**: Customize appearance and behavior to match your brand
- **Maintenance**: Update agreement content server-side without app updates

## 🛠 Installation

### Swift Package Manager

Add AgreementKit to your project using Swift Package Manager:

1. In Xcode, go to **File → Add Package Dependencies**
2. Enter the repository URL: `https://github.com/ControlKit/AgreementKit.git`
3. Select the version and add to your target

### CocoaPods

Add this line to your `Podfile`:

```ruby
pod 'AgreementKit'
```

Then run:

```bash
pod install
```

## 📖 Quick Start

### Simple Usage (2 Lines of Code)

The simplest way to integrate AgreementKit:

```swift
import AgreementKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure and present agreement
        let config = AgreementServiceConfig(
            style: .darkMode,
            name: "MyApp",
            appId: "your-app-id",
            language: .english
        )
        
        Task {
            await AgreementKit().configure(root: self, config: config)
        }
    }
}
```

That's it! Your agreement screen is ready with:
- Professional dark mode UI
- Accept/Decline buttons
- Server-side content management
- Multi-language support

### Advanced Usage (Custom Configuration)

For more control over the agreement experience:

```swift
import AgreementKit
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAgreementKit()
    }
    
    private func setupAgreementKit() {
        // Create custom view configuration
        let viewConfig = AgreementViewConfig(lang: .english)
        
        // Customize appearance
        viewConfig.style = .lightMode
        viewConfig.contentViewBackColor = UIColor.systemBackground
        viewConfig.agreementFont = UIFont.systemFont(ofSize: 20, weight: .bold)
        viewConfig.termsFont = UIFont.systemFont(ofSize: 28, weight: .heavy)
        viewConfig.acceptButtonBackColor = UIColor.systemBlue
        viewConfig.acceptButtonTitleColor = .white
        viewConfig.declineButtonBorderColor = UIColor.systemRed
        viewConfig.declineButtonTitleColor = UIColor.systemRed
        
        // Customize content
        viewConfig.agreement = "User Agreement"
        viewConfig.terms = "Terms & Conditions"
        viewConfig.acceptButtonTitle = "I Agree"
        viewConfig.declineButtonTitle = "Cancel"
        
        // Custom terms description
        viewConfig.termsDescription = """
        Welcome to MyApp! By using this application, you agree to the following terms:
        
        1. **Data Usage**: We collect minimal data to improve your experience
        2. **Privacy**: Your information is protected according to our privacy policy
        3. **Updates**: We may update these terms and will notify you of changes
        4. **Support**: Contact us at support@myapp.com for any questions
        
        Thank you for choosing MyApp!
        """
        
        // Create service configuration
        let serviceConfig = AgreementServiceConfig(
            style: .lightMode,
            name: "MyApp",
            appId: "com.mycompany.myapp",
            language: .english
        )
        
        // Override with custom view config
        serviceConfig.viewConfig = viewConfig
        
        // Present with custom modal style
        Task {
            await AgreementKit().configure(
                root: self,
                modalPresentationStyle: .pageSheet,
                config: serviceConfig
            )
        }
    }
}
```

## 🎨 Customization Options

### View Styles

AgreementKit supports two built-in themes:

```swift
// Dark Mode (Default)
let config = AgreementServiceConfig(
    style: .darkMode,
    name: "MyApp",
    appId: "your-app-id",
    language: .english
)

// Light Mode
let config = AgreementServiceConfig(
    style: .lightMode,
    name: "MyApp",
    appId: "your-app-id",
    language: .english
)
```

### Custom Styling

Full control over appearance:

```swift
let viewConfig = AgreementViewConfig(lang: .english)

// Colors
viewConfig.contentViewBackColor = UIColor.systemBackground
viewConfig.agreementColor = UIColor.label
viewConfig.termsColor = UIColor.systemBlue
viewConfig.acceptButtonBackColor = UIColor.systemGreen
viewConfig.declineButtonBackColor = UIColor.clear

// Fonts
viewConfig.agreementFont = UIFont.systemFont(ofSize: 18, weight: .medium)
viewConfig.termsFont = UIFont.systemFont(ofSize: 24, weight: .bold)
viewConfig.acceptButtonFont = UIFont.systemFont(ofSize: 16, weight: .semibold)

// Button Styling
viewConfig.acceptButtonRadius = 12.0
viewConfig.acceptButtonBorderWidth = 2.0
viewConfig.declineButtonRadius = 12.0
```

### Multi-Language Support

AgreementKit automatically handles multiple languages with comprehensive localization:

```swift
// English
let config = AgreementServiceConfig(
    style: .darkMode,
    name: "MyApp",
    appId: "your-app-id",
    language: .english
)

// Spanish
let config = AgreementServiceConfig(
    style: .darkMode,
    name: "MyApp",
    appId: "your-app-id",
    language: .spanish
)

// French
let config = AgreementServiceConfig(
    style: .darkMode,
    name: "MyApp",
    appId: "your-app-id",
    language: .french
)

// German
let config = AgreementServiceConfig(
    style: .darkMode,
    name: "MyApp",
    appId: "your-app-id",
    language: .german
)

// Chinese
let config = AgreementServiceConfig(
    style: .darkMode,
    name: "MyApp",
    appId: "your-app-id",
    language: .chinese
)

// Japanese
let config = AgreementServiceConfig(
    style: .darkMode,
    name: "MyApp",
    appId: "your-app-id",
    language: .japanese
)
```

**Supported Languages**: English, Spanish, French, German, Italian, Portuguese, Dutch, Russian, Chinese, Japanese, Korean, Arabic

## 🔧 Configuration Reference

### AgreementServiceConfig

| Parameter | Type | Description | Default |
|-----------|------|-------------|---------|
| `style` | `AgreementViewStyle` | UI theme (dark/light mode) | `.darkMode` |
| `name` | `String` | Your app name | Required |
| `appId` | `String` | Your app identifier | Required |
| `language` | `CKLanguage` | Display language | Required |
| `sdkVersion` | `String` | SDK version | Auto-detected |

### AgreementViewConfig

| Property | Type | Description |
|----------|------|-------------|
| `contentViewBackColor` | `UIColor` | Background color |
| `agreementFont` | `UIFont` | Agreement title font |
| `termsFont` | `UIFont` | Terms title font |
| `acceptButtonBackColor` | `UIColor` | Accept button background |
| `declineButtonBackColor` | `UIColor` | Decline button background |
| `acceptButtonRadius` | `CGFloat` | Accept button corner radius |
| `declineButtonRadius` | `CGFloat` | Decline button corner radius |

## 🌐 Server Integration

AgreementKit integrates with your backend to fetch agreement content:

### API Endpoints

The SDK automatically calls your agreement endpoint with:

```http
GET /agreement
Headers:
  x-app-id: your-app-id
  x-sdk-version: 1.0.0
  x-version: 1.0.0
  x-device-uuid: device-uuid

Body:
{
  "name": "MyApp"
}
```

### Response Format

Your server should return:

```json
{
  "data": {
    "id": "agreement-id",
    "agreement_title": [
      {
        "language": "en",
        "content": "User Agreement"
      }
    ],
    "title": [
      {
        "language": "en", 
        "content": "Terms of Service"
      }
    ],
    "description": [
      {
        "language": "en",
        "content": "Your terms content here..."
      }
    ],
    "accept_button_title": [
      {
        "language": "en",
        "content": "Accept"
      }
    ],
    "decline_button_title": [
      {
        "language": "en",
        "content": "Decline"
      }
    ],
    "version": 1,
    "created_at": "2024-01-01T00:00:00.000000Z"
  }
}
```

## 📱 Requirements

### iOS Version
- **Minimum iOS**: 13.0+
- **Recommended iOS**: 15.0+
- **Xcode**: 12.0+
- **Swift**: 5.3+

### Supported Languages
AgreementKit supports multiple languages out of the box:

- 🇺🇸 **English** (`.english`)
- 🇪🇸 **Spanish** (`.spanish`) 
- 🇫🇷 **French** (`.french`)
- 🇩🇪 **German** (`.german`)
- 🇮🇹 **Italian** (`.italian`)
- 🇵🇹 **Portuguese** (`.portuguese`)
- 🇳🇱 **Dutch** (`.dutch`)
- 🇷🇺 **Russian** (`.russian`)
- 🇨🇳 **Chinese** (`.chinese`)
- 🇯🇵 **Japanese** (`.japanese`)
- 🇰🇷 **Korean** (`.korean`)
- 🇦🇷 **Arabic** (`.arabic`)

### Device Support
- **iPhone**: All models running iOS 13.0+
- **iPad**: All models running iPadOS 13.0+
- **iPod Touch**: 7th generation and later

## 🔗 Dependencies

- **ControlKitBase**: Core networking and base functionality
- **UIKit**: iOS user interface framework
- **Foundation**: Core Swift framework
- **Combine**: Reactive programming framework (iOS 13+)

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request to our [GitHub repository](https://github.com/ControlKit/AgreementKit).

## 📞 Support

For support, email support@agreementkit.com or create an issue on [GitHub](https://github.com/ControlKit/AgreementKit).

## 🤖 Cross-Platform Support

AgreementKit is available for both iOS and Android platforms:

- **iOS**: [https://github.com/ControlKit/AgreementKit](https://github.com/ControlKit/AgreementKit) (Swift)
- **Android**: [https://github.com/ControlKit/AgreementKit-android](https://github.com/ControlKit/AgreementKit-android) (Kotlin)

Both versions provide the same functionality and API design, ensuring consistent user experience across platforms.

## 🎯 Roadmap

- [ ] SwiftUI support
- [ ] Additional themes
- [ ] Analytics integration
- [ ] Custom animations
- [ ] Accessibility improvements

---

**Made with ❤️ for iOS developers who value their time**
