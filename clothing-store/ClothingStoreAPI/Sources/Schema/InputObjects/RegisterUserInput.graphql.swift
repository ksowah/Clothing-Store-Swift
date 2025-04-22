// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct RegisterUserInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    fullName: String,
    username: String,
    emailAddress: String,
    password: String,
    phoneNumber: String
  ) {
    __data = InputDict([
      "fullName": fullName,
      "username": username,
      "emailAddress": emailAddress,
      "password": password,
      "phoneNumber": phoneNumber
    ])
  }

  public var fullName: String {
    get { __data["fullName"] }
    set { __data["fullName"] = newValue }
  }

  public var username: String {
    get { __data["username"] }
    set { __data["username"] = newValue }
  }

  public var emailAddress: String {
    get { __data["emailAddress"] }
    set { __data["emailAddress"] = newValue }
  }

  public var password: String {
    get { __data["password"] }
    set { __data["password"] = newValue }
  }

  public var phoneNumber: String {
    get { __data["phoneNumber"] }
    set { __data["phoneNumber"] = newValue }
  }
}
