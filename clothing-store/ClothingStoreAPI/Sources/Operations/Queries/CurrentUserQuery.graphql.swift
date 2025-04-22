// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CurrentUserQuery: GraphQLQuery {
  public static let operationName: String = "CurrentUser"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query CurrentUser { user: getCurrentUser { __typename _id fullName username phoneNumber emailAddress } }"#
    ))

  public init() {}

  public struct Data: ClothingStoreAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { ClothingStoreAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("getCurrentUser", alias: "user", User?.self),
    ] }

    public var user: User? { __data["user"] }

    /// User
    ///
    /// Parent Type: `User`
    public struct User: ClothingStoreAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { ClothingStoreAPI.Objects.User }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("_id", ClothingStoreAPI.ID.self),
        .field("fullName", String?.self),
        .field("username", String?.self),
        .field("phoneNumber", String?.self),
        .field("emailAddress", String?.self),
      ] }

      public var _id: ClothingStoreAPI.ID { __data["_id"] }
      public var fullName: String? { __data["fullName"] }
      public var username: String? { __data["username"] }
      public var phoneNumber: String? { __data["phoneNumber"] }
      public var emailAddress: String? { __data["emailAddress"] }
    }
  }
}
