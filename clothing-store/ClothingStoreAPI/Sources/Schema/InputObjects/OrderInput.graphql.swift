// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct OrderInput: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    items: [OrderItemInput],
    totalPrice: Double
  ) {
    __data = InputDict([
      "items": items,
      "totalPrice": totalPrice
    ])
  }

  public var items: [OrderItemInput] {
    get { __data["items"] }
    set { __data["items"] = newValue }
  }

  public var totalPrice: Double {
    get { __data["totalPrice"] }
    set { __data["totalPrice"] = newValue }
  }
}
