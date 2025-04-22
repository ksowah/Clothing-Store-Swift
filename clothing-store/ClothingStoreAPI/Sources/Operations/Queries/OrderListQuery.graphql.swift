// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class OrderListQuery: GraphQLQuery {
  public static let operationName: String = "OrderList"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query OrderList($status: OrderStatus) { orders: getOrders(status: $status) { __typename _id code status user { __typename _id } items { __typename product { __typename _id brand category code description previewImage name price } quantity } totalPrice } }"#
    ))

  public var status: GraphQLNullable<GraphQLEnum<OrderStatus>>

  public init(status: GraphQLNullable<GraphQLEnum<OrderStatus>>) {
    self.status = status
  }

  public var __variables: Variables? { ["status": status] }

  public struct Data: ClothingStoreAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { ClothingStoreAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("getOrders", alias: "orders", [Order?]?.self, arguments: ["status": .variable("status")]),
    ] }

    public var orders: [Order?]? { __data["orders"] }

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
        .field("code", String?.self),
        .field("status", GraphQLEnum<ClothingStoreAPI.OrderStatus>?.self),
        .field("user", User?.self),
        .field("items", [Item?]?.self),
        .field("totalPrice", Double?.self),
      ] }

      public var _id: ClothingStoreAPI.ID { __data["_id"] }
      public var code: String? { __data["code"] }
      public var status: GraphQLEnum<ClothingStoreAPI.OrderStatus>? { __data["status"] }
      public var user: User? { __data["user"] }
      public var items: [Item?]? { __data["items"] }
      public var totalPrice: Double? { __data["totalPrice"] }

      /// Order.User
      ///
      /// Parent Type: `User`
      public struct User: ClothingStoreAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { ClothingStoreAPI.Objects.User }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("_id", ClothingStoreAPI.ID.self),
        ] }

        public var _id: ClothingStoreAPI.ID { __data["_id"] }
      }

      /// Order.Item
      ///
      /// Parent Type: `OrderItem`
      public struct Item: ClothingStoreAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { ClothingStoreAPI.Objects.OrderItem }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("product", Product?.self),
          .field("quantity", Int.self),
        ] }

        public var product: Product? { __data["product"] }
        public var quantity: Int { __data["quantity"] }

        /// Order.Item.Product
        ///
        /// Parent Type: `Product`
        public struct Product: ClothingStoreAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { ClothingStoreAPI.Objects.Product }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("_id", ClothingStoreAPI.ID.self),
            .field("brand", String?.self),
            .field("category", GraphQLEnum<ClothingStoreAPI.Category>?.self),
            .field("code", String?.self),
            .field("description", String?.self),
            .field("previewImage", String?.self),
            .field("name", String?.self),
            .field("price", Double?.self),
          ] }

          public var _id: ClothingStoreAPI.ID { __data["_id"] }
          public var brand: String? { __data["brand"] }
          public var category: GraphQLEnum<ClothingStoreAPI.Category>? { __data["category"] }
          public var code: String? { __data["code"] }
          public var description: String? { __data["description"] }
          public var previewImage: String? { __data["previewImage"] }
          public var name: String? { __data["name"] }
          public var price: Double? { __data["price"] }
        }
      }
    }
  }
}
