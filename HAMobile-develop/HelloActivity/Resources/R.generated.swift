//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  /// This `R.color` struct is generated, and contains static references to 1 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentColor.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 3 images.
  struct image {
    /// Image `banner`.
    static let banner = Rswift.ImageResource(bundle: R.hostingBundle, name: "banner")
    /// Image `logo`.
    static let logo = Rswift.ImageResource(bundle: R.hostingBundle, name: "logo")
    /// Image `slogan`.
    static let slogan = Rswift.ImageResource(bundle: R.hostingBundle, name: "slogan")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "banner", bundle: ..., traitCollection: ...)`
    static func banner(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.banner, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "logo", bundle: ..., traitCollection: ...)`
    static func logo(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.logo, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "slogan", bundle: ..., traitCollection: ...)`
    static func slogan(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.slogan, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.nib` struct is generated, and contains static references to 1 nibs.
  struct nib {
    /// Nib `CollectionViewCell`.
    static let collectionViewCell = _R.nib._CollectionViewCell()

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "CollectionViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.collectionViewCell) instead")
    static func collectionViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.collectionViewCell)
    }
    #endif

    static func collectionViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> CollectionViewCell? {
      return R.nib.collectionViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? CollectionViewCell
    }

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 9 localization keys.
    struct localizable {
      /// en translation: Facebookでログイン
      ///
      /// Locales: en, ja
      static let string_button_facbook_screen_login = Rswift.StringResource(key: "string_button_facbook_screen_login", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: Google
      ///
      /// Locales: en, ja
      static let string_button_google_screen_login = Rswift.StringResource(key: "string_button_google_screen_login", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: Line
      ///
      /// Locales: en, ja
      static let string_button_line_screen_login = Rswift.StringResource(key: "string_button_line_screen_login", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: パスワード
      ///
      /// Locales: en, ja
      static let hint_password_screen_login = Rswift.StringResource(key: "hint_password_screen_login", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: パスワードを忘れた方
      ///
      /// Locales: en, ja
      static let string_forgot_password_screen_login = Rswift.StringResource(key: "string_forgot_password_screen_login", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: メールアドレス
      ///
      /// Locales: en, ja
      static let hint_username_screen_login = Rswift.StringResource(key: "hint_username_screen_login", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: ログイン
      ///
      /// Locales: en, ja
      static let string_button_login_screen_login = Rswift.StringResource(key: "string_button_login_screen_login", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: ログイン
      ///
      /// Locales: en, ja
      static let title_screen_login = Rswift.StringResource(key: "title_screen_login", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)
      /// en translation: 新規会員登録
      ///
      /// Locales: en, ja
      static let string_button_register_screen_login = Rswift.StringResource(key: "string_button_register_screen_login", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "ja"], comment: nil)

      /// en translation: Facebookでログイン
      ///
      /// Locales: en, ja
      static func string_button_facbook_screen_login(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("string_button_facbook_screen_login", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "string_button_facbook_screen_login"
        }

        return NSLocalizedString("string_button_facbook_screen_login", bundle: bundle, comment: "")
      }

      /// en translation: Google
      ///
      /// Locales: en, ja
      static func string_button_google_screen_login(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("string_button_google_screen_login", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "string_button_google_screen_login"
        }

        return NSLocalizedString("string_button_google_screen_login", bundle: bundle, comment: "")
      }

      /// en translation: Line
      ///
      /// Locales: en, ja
      static func string_button_line_screen_login(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("string_button_line_screen_login", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "string_button_line_screen_login"
        }

        return NSLocalizedString("string_button_line_screen_login", bundle: bundle, comment: "")
      }

      /// en translation: パスワード
      ///
      /// Locales: en, ja
      static func hint_password_screen_login(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("hint_password_screen_login", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "hint_password_screen_login"
        }

        return NSLocalizedString("hint_password_screen_login", bundle: bundle, comment: "")
      }

      /// en translation: パスワードを忘れた方
      ///
      /// Locales: en, ja
      static func string_forgot_password_screen_login(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("string_forgot_password_screen_login", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "string_forgot_password_screen_login"
        }

        return NSLocalizedString("string_forgot_password_screen_login", bundle: bundle, comment: "")
      }

      /// en translation: メールアドレス
      ///
      /// Locales: en, ja
      static func hint_username_screen_login(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("hint_username_screen_login", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "hint_username_screen_login"
        }

        return NSLocalizedString("hint_username_screen_login", bundle: bundle, comment: "")
      }

      /// en translation: ログイン
      ///
      /// Locales: en, ja
      static func string_button_login_screen_login(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("string_button_login_screen_login", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "string_button_login_screen_login"
        }

        return NSLocalizedString("string_button_login_screen_login", bundle: bundle, comment: "")
      }

      /// en translation: ログイン
      ///
      /// Locales: en, ja
      static func title_screen_login(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("title_screen_login", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "title_screen_login"
        }

        return NSLocalizedString("title_screen_login", bundle: bundle, comment: "")
      }

      /// en translation: 新規会員登録
      ///
      /// Locales: en, ja
      static func string_button_register_screen_login(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("string_button_register_screen_login", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "string_button_register_screen_login"
        }

        return NSLocalizedString("string_button_register_screen_login", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try nib.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct nib: Rswift.Validatable {
    static func validate() throws {
      try _CollectionViewCell.validate()
    }

    struct _CollectionViewCell: Rswift.NibResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let name = "CollectionViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> CollectionViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? CollectionViewCell
      }

      static func validate() throws {
        if #available(iOS 13.0, *) { if UIKit.UIImage(systemName: "n.circle") == nil { throw Rswift.ValidationError(description: "[R.swift] System image named 'n.circle' is used in nib 'CollectionViewCell', but couldn't be loaded.") } }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
