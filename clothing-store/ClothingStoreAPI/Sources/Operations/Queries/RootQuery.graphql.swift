// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class RootQuery: GraphQLQuery {
  public static let operationName: String = "RootQuery"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query RootQuery { getRoot }"#
    ))

  public init() {}

  public struct Data: ClothingStoreAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { ClothingStoreAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("getRoot", String?.self),
    ] }

    public var getRoot: String? { __data["getRoot"] }
  }
}
