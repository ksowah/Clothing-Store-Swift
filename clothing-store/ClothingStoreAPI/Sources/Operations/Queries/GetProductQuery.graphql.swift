// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetProductQuery: GraphQLQuery {
  public static let operationName: String = "GetProduct"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetProduct($id: ID!) { product: getProduct(id: $id) { __typename _id code name description images previewImage brand category price createdAt updatedAt } }"#
    ))

  public var id: ID

  public init(id: ID) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: ClothingStoreAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { ClothingStoreAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("getProduct", alias: "product", Product?.self, arguments: ["id": .variable("id")]),
    ] }

    public var product: Product? { __data["product"] }

    /// Product
    ///
    /// Parent Type: `Product`
    public struct Product: ClothingStoreAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { ClothingStoreAPI.Objects.Product }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("_id", ClothingStoreAPI.ID.self),
        .field("code", String?.self),
        .field("name", String?.self),
        .field("description", String?.self),
        .field("images", [String?]?.self),
        .field("previewImage", String?.self),
        .field("brand", String?.self),
        .field("category", GraphQLEnum<ClothingStoreAPI.Category>?.self),
        .field("price", Double?.self),
        .field("createdAt", ClothingStoreAPI.DateTime?.self),
        .field("updatedAt", ClothingStoreAPI.DateTime?.self),
      ] }

      public var _id: ClothingStoreAPI.ID { __data["_id"] }
      public var code: String? { __data["code"] }
      public var name: String? { __data["name"] }
      public var description: String? { __data["description"] }
      public var images: [String?]? { __data["images"] }
      public var previewImage: String? { __data["previewImage"] }
      public var brand: String? { __data["brand"] }
      public var category: GraphQLEnum<ClothingStoreAPI.Category>? { __data["category"] }
      public var price: Double? { __data["price"] }
      public var createdAt: ClothingStoreAPI.DateTime? { __data["createdAt"] }
      public var updatedAt: ClothingStoreAPI.DateTime? { __data["updatedAt"] }
    }
  }
}
