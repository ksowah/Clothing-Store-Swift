// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public struct Pagination: InputObject {
  public private(set) var __data: InputDict

  public init(_ data: InputDict) {
    __data = data
  }

  public init(
    page: GraphQLNullable<Int> = nil,
    pageSize: GraphQLNullable<Int> = nil
  ) {
    __data = InputDict([
      "page": page,
      "pageSize": pageSize
    ])
  }

  public var page: GraphQLNullable<Int> {
    get { __data["page"] }
    set { __data["page"] = newValue }
  }

  public var pageSize: GraphQLNullable<Int> {
    get { __data["pageSize"] }
    set { __data["pageSize"] = newValue }
  }
}
