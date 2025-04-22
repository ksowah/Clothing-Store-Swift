// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct OrderItemInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    product: ID,
    quantity: Int
  ) {
    __data = InputDict([
      "product": product,
      "quantity": quantity
    ])
  }

  public var product: ID {
    get { __data["product"] }
    set { __data["product"] = newValue }
  }

  public var quantity: Int {
    get { __data["quantity"] }
    set { __data["quantity"] = newValue }
  }
}
