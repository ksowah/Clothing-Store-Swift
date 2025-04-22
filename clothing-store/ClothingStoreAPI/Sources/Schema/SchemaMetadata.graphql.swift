// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public typealias ID = String

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == ClothingStoreAPI.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == ClothingStoreAPI.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == ClothingStoreAPI.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == ClothingStoreAPI.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "Query": return ClothingStoreAPI.Objects.Query
    case "Product": return ClothingStoreAPI.Objects.Product
    case "Mutation": return ClothingStoreAPI.Objects.Mutation
    case "LoginResponse": return ClothingStoreAPI.Objects.LoginResponse
    case "User": return ClothingStoreAPI.Objects.User
    case "Order": return ClothingStoreAPI.Objects.Order
    case "OrderItem": return ClothingStoreAPI.Objects.OrderItem
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
