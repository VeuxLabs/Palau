//
//  UserDefaults.swift
//  Palau
//
//  Created by symentis GmbH on 26.04.16.
//  Copyright © 2016 symentis GmbH. All rights reserved.
//

import Foundation

/// UserDefaults
/// wraps NSUserDefaults
/// Use by extending with var xxx { get { value("name") }  }
public struct UserDefaults {

  /// Pure - will always return the provided value
  /// - parameter id: T
  /// - returns: T
  public static func pure<T>(value: T) -> T {
    return value
  }

  public static var defaults: NSUserDefaults {
    return NSUserDefaults.standardUserDefaults()
  }

  /// Generate a UserDefaultsEntry of Type T for provided key
  /// - parameter key: String, name of the entry
  /// - returns: DefaultValue
  public static func value<T>(key: String) -> UserDefaultsEntry<T> {
    return UserDefaultsEntry(key:key, defaults:defaults, ensure: pure)
  }
}
