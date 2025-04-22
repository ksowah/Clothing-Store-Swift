// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class RegisterUserMutation: GraphQLMutation {
  public static let operationName: String = "RegisterUser"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation RegisterUser($input: RegisterUserInput!) { registerUser(input: $input) { __typename _id } }"#
    ))

  public var input: RegisterUserInput

  public init(input: RegisterUserInput) {
    self.input = input
  }

  public var __variables: Variables? { ["input": input] }

  public struct Data: ClothingStoreAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { ClothingStoreAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("registerUser", RegisterUser?.self, arguments: ["input": .variable("input")]),
    ] }

    public var registerUser: RegisterUser? { __data["registerUser"] }

    /// RegisterUser
    ///
    /// Parent Type: `User`
    public struct RegisterUser: ClothingStoreAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { ClothingStoreAPI.Objects.User }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("_id", ClothingStoreAPI.ID.self),
      ] }

      public var _id: ClothingStoreAPI.ID { __data["_id"] }
    }
  }
}
