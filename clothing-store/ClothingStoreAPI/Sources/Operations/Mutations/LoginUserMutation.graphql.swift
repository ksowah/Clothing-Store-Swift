// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class LoginUserMutation: GraphQLMutation {
  public static let operationName: String = "LoginUser"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation LoginUser($emailAddress: String!, $password: String!) { loginUser(emailAddress: $emailAddress, password: $password) { __typename user { __typename fullName } token } }"#
    ))

  public var emailAddress: String
  public var password: String

  public init(
    emailAddress: String,
    password: String
  ) {
    self.emailAddress = emailAddress
    self.password = password
  }

  public var __variables: Variables? { [
    "emailAddress": emailAddress,
    "password": password
  ] }

  public struct Data: ClothingStoreAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { ClothingStoreAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("loginUser", LoginUser?.self, arguments: [
        "emailAddress": .variable("emailAddress"),
        "password": .variable("password")
      ]),
    ] }

    public var loginUser: LoginUser? { __data["loginUser"] }

    /// LoginUser
    ///
    /// Parent Type: `LoginResponse`
    public struct LoginUser: ClothingStoreAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { ClothingStoreAPI.Objects.LoginResponse }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("user", User?.self),
        .field("token", String?.self),
      ] }

      public var user: User? { __data["user"] }
      public var token: String? { __data["token"] }

      /// LoginUser.User
      ///
      /// Parent Type: `User`
      public struct User: ClothingStoreAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { ClothingStoreAPI.Objects.User }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("fullName", String?.self),
        ] }

        public var fullName: String? { __data["fullName"] }
      }
    }
  }
}
