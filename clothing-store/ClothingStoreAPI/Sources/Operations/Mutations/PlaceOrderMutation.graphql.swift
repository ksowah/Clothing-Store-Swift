// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class PlaceOrderMutation: GraphQLMutation {
  public static let operationName: String = "PlaceOrder"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation PlaceOrder($input: OrderInput!) { order: placeOrder(input: $input) { __typename _id } }"#
    ))

  public var input: OrderInput

  public init(input: OrderInput) {
    self.input = input
  }

  public var __variables: Variables? { ["input": input] }

  public struct Data: ClothingStoreAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { ClothingStoreAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("placeOrder", alias: "order", Order?.self, arguments: ["input": .variable("input")]),
    ] }

    public var order: Order? { __data["order"] }

    /// Order
    ///
    /// Parent Type: `Order`
    public struct Order: ClothingStoreAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { ClothingStoreAPI.Objects.Order }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("_id", ClothingStoreAPI.ID.self),
      ] }

      public var _id: ClothingStoreAPI.ID { __data["_id"] }
    }
  }
}
