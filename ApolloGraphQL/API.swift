//  This file was automatically generated and should not be edited.

import Apollo

/// The possible states of an issue.
public enum IssueState: RawRepresentable, Equatable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// An issue that is still open
  case `open`
  /// An issue that has been closed
  case closed
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "OPEN": self = .open
      case "CLOSED": self = .closed
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .open: return "OPEN"
      case .closed: return "CLOSED"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: IssueState, rhs: IssueState) -> Bool {
    switch (lhs, rhs) {
      case (.open, .open): return true
      case (.closed, .closed): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

/// The possible states of a milestone.
public enum MilestoneState: RawRepresentable, Equatable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// A milestone that is still open.
  case `open`
  /// A milestone that has been closed.
  case closed
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "OPEN": self = .open
      case "CLOSED": self = .closed
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .open: return "OPEN"
      case .closed: return "CLOSED"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MilestoneState, rhs: MilestoneState) -> Bool {
    switch (lhs, rhs) {
      case (.open, .open): return true
      case (.closed, .closed): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public final class FindIssueIdQuery: GraphQLQuery {
    public var operationName: String = "FindIssueID"
    
  public let operationDefinition =
    "query FindIssueID {\n  repository(owner: \"octocat\", name: \"Hello-World\") {\n    __typename\n    issue(number: 349) {\n      __typename\n      id\n    }\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("repository", arguments: ["owner": "octocat", "name": "Hello-World"], type: .object(Repository.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(repository: Repository? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "repository": repository.flatMap { (value: Repository) -> ResultMap in value.resultMap }])
    }

    /// Lookup a given repository by the owner and repository name.
    public var repository: Repository? {
      get {
        return (resultMap["repository"] as? ResultMap).flatMap { Repository(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "repository")
      }
    }

    public struct Repository: GraphQLSelectionSet {
      public static let possibleTypes = ["Repository"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("issue", arguments: ["number": 349], type: .object(Issue.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(issue: Issue? = nil) {
        self.init(unsafeResultMap: ["__typename": "Repository", "issue": issue.flatMap { (value: Issue) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Returns a single issue from the current repository by number.
      public var issue: Issue? {
        get {
          return (resultMap["issue"] as? ResultMap).flatMap { Issue(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "issue")
        }
      }

      public struct Issue: GraphQLSelectionSet {
        public static let possibleTypes = ["Issue"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID) {
          self.init(unsafeResultMap: ["__typename": "Issue", "id": id])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }
      }
    }
  }
}

public final class ListIssueQuery: GraphQLQuery {
    public var operationName: String = "ListIssue"
    
  public let operationDefinition =
    "query ListIssue($owner: String!, $name: String!, $numberIssue: Int!, $states: [IssueState!]) {\n  repository(owner: $owner, name: $name) {\n    __typename\n    issues(last: $numberIssue, states: $states) {\n      __typename\n      edges {\n        __typename\n        node {\n          __typename\n          assignees(last: 100) {\n            __typename\n            totalCount\n            edges {\n              __typename\n              node {\n                __typename\n                name\n                id\n                avatarUrl\n                resourcePath\n                url\n                avatarUrl\n              }\n            }\n          }\n          id\n          createdAt\n          updatedAt\n          milestone {\n            __typename\n            state\n            title\n            createdAt\n            creator {\n              __typename\n              login\n              avatarUrl\n              url\n            }\n          }\n          author {\n            __typename\n            login\n          }\n          participants(last: 100) {\n            __typename\n            totalCount\n            nodes {\n              __typename\n              createdAt\n              login\n              updatedAt\n            }\n          }\n          state\n          title\n          url\n          comments(last: 10) {\n            __typename\n            totalCount\n            edges {\n              __typename\n              node {\n                __typename\n                author {\n                  __typename\n                  login\n                  avatarUrl\n                  resourcePath\n                }\n                bodyText\n              }\n            }\n          }\n          labels(last: 10) {\n            __typename\n            edges {\n              __typename\n              node {\n                __typename\n                description\n                createdAt\n                name\n                id\n              }\n            }\n          }\n        }\n      }\n    }\n  }\n}"

  public var owner: String
  public var name: String
  public var numberIssue: Int
  public var states: [IssueState]?

  public init(owner: String, name: String, numberIssue: Int, states: [IssueState]?) {
    self.owner = owner
    self.name = name
    self.numberIssue = numberIssue
    self.states = states
  }

  public var variables: GraphQLMap? {
    return ["owner": owner, "name": name, "numberIssue": numberIssue, "states": states]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("repository", arguments: ["owner": GraphQLVariable("owner"), "name": GraphQLVariable("name")], type: .object(Repository.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(repository: Repository? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "repository": repository.flatMap { (value: Repository) -> ResultMap in value.resultMap }])
    }

    /// Lookup a given repository by the owner and repository name.
    public var repository: Repository? {
      get {
        return (resultMap["repository"] as? ResultMap).flatMap { Repository(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "repository")
      }
    }

    public struct Repository: GraphQLSelectionSet {
      public static let possibleTypes = ["Repository"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("issues", arguments: ["last": GraphQLVariable("numberIssue"), "states": GraphQLVariable("states")], type: .nonNull(.object(Issue.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(issues: Issue) {
        self.init(unsafeResultMap: ["__typename": "Repository", "issues": issues.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of issues that have been opened in the repository.
      public var issues: Issue {
        get {
          return Issue(unsafeResultMap: resultMap["issues"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "issues")
        }
      }

      public struct Issue: GraphQLSelectionSet {
        public static let possibleTypes = ["IssueConnection"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .list(.object(Edge.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "IssueConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// A list of edges.
        public var edges: [Edge?]? {
          get {
            return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes = ["IssueEdge"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .object(Node.selections)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(node: Node? = nil) {
            self.init(unsafeResultMap: ["__typename": "IssueEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The item at the end of the edge.
          public var node: Node? {
            get {
              return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "node")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes = ["Issue"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("assignees", arguments: ["last": 100], type: .nonNull(.object(Assignee.selections))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
              GraphQLField("milestone", type: .object(Milestone.selections)),
              GraphQLField("author", type: .object(Author.selections)),
              GraphQLField("participants", arguments: ["last": 100], type: .nonNull(.object(Participant.selections))),
              GraphQLField("state", type: .nonNull(.scalar(IssueState.self))),
              GraphQLField("title", type: .nonNull(.scalar(String.self))),
              GraphQLField("url", type: .nonNull(.scalar(String.self))),
              GraphQLField("comments", arguments: ["last": 10], type: .nonNull(.object(Comment.selections))),
              GraphQLField("labels", arguments: ["last": 10], type: .object(Label.selections)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(assignees: Assignee, id: GraphQLID, createdAt: String, updatedAt: String, milestone: Milestone? = nil, author: Author? = nil, participants: Participant, state: IssueState, title: String, url: String, comments: Comment, labels: Label? = nil) {
              self.init(unsafeResultMap: ["__typename": "Issue", "assignees": assignees.resultMap, "id": id, "createdAt": createdAt, "updatedAt": updatedAt, "milestone": milestone.flatMap { (value: Milestone) -> ResultMap in value.resultMap }, "author": author.flatMap { (value: Author) -> ResultMap in value.resultMap }, "participants": participants.resultMap, "state": state, "title": title, "url": url, "comments": comments.resultMap, "labels": labels.flatMap { (value: Label) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// A list of Users assigned to this object.
            public var assignees: Assignee {
              get {
                return Assignee(unsafeResultMap: resultMap["assignees"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "assignees")
              }
            }

            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// Identifies the date and time when the object was created.
            public var createdAt: String {
              get {
                return resultMap["createdAt"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "createdAt")
              }
            }

            /// Identifies the date and time when the object was last updated.
            public var updatedAt: String {
              get {
                return resultMap["updatedAt"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "updatedAt")
              }
            }

            /// Identifies the milestone associated with the issue.
            public var milestone: Milestone? {
              get {
                return (resultMap["milestone"] as? ResultMap).flatMap { Milestone(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "milestone")
              }
            }

            /// The actor who authored the comment.
            public var author: Author? {
              get {
                return (resultMap["author"] as? ResultMap).flatMap { Author(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "author")
              }
            }

            /// A list of Users that are participating in the Issue conversation.
            public var participants: Participant {
              get {
                return Participant(unsafeResultMap: resultMap["participants"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "participants")
              }
            }

            /// Identifies the state of the issue.
            public var state: IssueState {
              get {
                return resultMap["state"]! as! IssueState
              }
              set {
                resultMap.updateValue(newValue, forKey: "state")
              }
            }

            /// Identifies the issue title.
            public var title: String {
              get {
                return resultMap["title"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "title")
              }
            }

            /// The HTTP URL for this issue
            public var url: String {
              get {
                return resultMap["url"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "url")
              }
            }

            /// A list of comments associated with the Issue.
            public var comments: Comment {
              get {
                return Comment(unsafeResultMap: resultMap["comments"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "comments")
              }
            }

            /// A list of labels associated with the object.
            public var labels: Label? {
              get {
                return (resultMap["labels"] as? ResultMap).flatMap { Label(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "labels")
              }
            }

            public struct Assignee: GraphQLSelectionSet {
              public static let possibleTypes = ["UserConnection"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
                GraphQLField("edges", type: .list(.object(Edge.selections))),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(totalCount: Int, edges: [Edge?]? = nil) {
                self.init(unsafeResultMap: ["__typename": "UserConnection", "totalCount": totalCount, "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the total count of items in the connection.
              public var totalCount: Int {
                get {
                  return resultMap["totalCount"]! as! Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "totalCount")
                }
              }

              /// A list of edges.
              public var edges: [Edge?]? {
                get {
                  return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
                }
                set {
                  resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
                }
              }

              public struct Edge: GraphQLSelectionSet {
                public static let possibleTypes = ["UserEdge"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("node", type: .object(Node.selections)),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(node: Node? = nil) {
                  self.init(unsafeResultMap: ["__typename": "UserEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The item at the end of the edge.
                public var node: Node? {
                  get {
                    return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
                  }
                  set {
                    resultMap.updateValue(newValue?.resultMap, forKey: "node")
                  }
                }

                public struct Node: GraphQLSelectionSet {
                  public static let possibleTypes = ["User"]

                  public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("name", type: .scalar(String.self)),
                    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                    GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
                    GraphQLField("resourcePath", type: .nonNull(.scalar(String.self))),
                    GraphQLField("url", type: .nonNull(.scalar(String.self))),
                    GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
                  ]

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(name: String? = nil, id: GraphQLID, avatarUrl: String, resourcePath: String, url: String) {
                    self.init(unsafeResultMap: ["__typename": "User", "name": name, "id": id, "avatarUrl": avatarUrl, "resourcePath": resourcePath, "url": url])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The user's public profile name.
                  public var name: String? {
                    get {
                      return resultMap["name"] as? String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "name")
                    }
                  }

                  public var id: GraphQLID {
                    get {
                      return resultMap["id"]! as! GraphQLID
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "id")
                    }
                  }

                  /// A URL pointing to the user's public avatar.
                  public var avatarUrl: String {
                    get {
                      return resultMap["avatarUrl"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "avatarUrl")
                    }
                  }

                  /// The HTTP path for this user
                  public var resourcePath: String {
                    get {
                      return resultMap["resourcePath"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "resourcePath")
                    }
                  }

                  /// The HTTP URL for this user
                  public var url: String {
                    get {
                      return resultMap["url"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "url")
                    }
                  }
                }
              }
            }

            public struct Milestone: GraphQLSelectionSet {
              public static let possibleTypes = ["Milestone"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("state", type: .nonNull(.scalar(MilestoneState.self))),
                GraphQLField("title", type: .nonNull(.scalar(String.self))),
                GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
                GraphQLField("creator", type: .object(Creator.selections)),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(state: MilestoneState, title: String, createdAt: String, creator: Creator? = nil) {
                self.init(unsafeResultMap: ["__typename": "Milestone", "state": state, "title": title, "createdAt": createdAt, "creator": creator.flatMap { (value: Creator) -> ResultMap in value.resultMap }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the state of the milestone.
              public var state: MilestoneState {
                get {
                  return resultMap["state"]! as! MilestoneState
                }
                set {
                  resultMap.updateValue(newValue, forKey: "state")
                }
              }

              /// Identifies the title of the milestone.
              public var title: String {
                get {
                  return resultMap["title"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "title")
                }
              }

              /// Identifies the date and time when the object was created.
              public var createdAt: String {
                get {
                  return resultMap["createdAt"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "createdAt")
                }
              }

              /// Identifies the actor who created the milestone.
              public var creator: Creator? {
                get {
                  return (resultMap["creator"] as? ResultMap).flatMap { Creator(unsafeResultMap: $0) }
                }
                set {
                  resultMap.updateValue(newValue?.resultMap, forKey: "creator")
                }
              }

              public struct Creator: GraphQLSelectionSet {
                public static let possibleTypes = ["EnterpriseUserAccount", "Organization", "User", "Mannequin", "Bot"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
                  GraphQLField("url", type: .nonNull(.scalar(String.self))),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public static func makeEnterpriseUserAccount(login: String, avatarUrl: String, url: String) -> Creator {
                  return Creator(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login, "avatarUrl": avatarUrl, "url": url])
                }

                public static func makeOrganization(login: String, avatarUrl: String, url: String) -> Creator {
                  return Creator(unsafeResultMap: ["__typename": "Organization", "login": login, "avatarUrl": avatarUrl, "url": url])
                }

                public static func makeUser(login: String, avatarUrl: String, url: String) -> Creator {
                  return Creator(unsafeResultMap: ["__typename": "User", "login": login, "avatarUrl": avatarUrl, "url": url])
                }

                public static func makeMannequin(login: String, avatarUrl: String, url: String) -> Creator {
                  return Creator(unsafeResultMap: ["__typename": "Mannequin", "login": login, "avatarUrl": avatarUrl, "url": url])
                }

                public static func makeBot(login: String, avatarUrl: String, url: String) -> Creator {
                  return Creator(unsafeResultMap: ["__typename": "Bot", "login": login, "avatarUrl": avatarUrl, "url": url])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The username of the actor.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }

                /// A URL pointing to the actor's public avatar.
                public var avatarUrl: String {
                  get {
                    return resultMap["avatarUrl"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "avatarUrl")
                  }
                }

                /// The HTTP URL for this actor.
                public var url: String {
                  get {
                    return resultMap["url"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "url")
                  }
                }
              }
            }

            public struct Author: GraphQLSelectionSet {
              public static let possibleTypes = ["EnterpriseUserAccount", "Organization", "User", "Mannequin", "Bot"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("login", type: .nonNull(.scalar(String.self))),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public static func makeEnterpriseUserAccount(login: String) -> Author {
                return Author(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login])
              }

              public static func makeOrganization(login: String) -> Author {
                return Author(unsafeResultMap: ["__typename": "Organization", "login": login])
              }

              public static func makeUser(login: String) -> Author {
                return Author(unsafeResultMap: ["__typename": "User", "login": login])
              }

              public static func makeMannequin(login: String) -> Author {
                return Author(unsafeResultMap: ["__typename": "Mannequin", "login": login])
              }

              public static func makeBot(login: String) -> Author {
                return Author(unsafeResultMap: ["__typename": "Bot", "login": login])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The username of the actor.
              public var login: String {
                get {
                  return resultMap["login"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "login")
                }
              }
            }

            public struct Participant: GraphQLSelectionSet {
              public static let possibleTypes = ["UserConnection"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
                GraphQLField("nodes", type: .list(.object(Node.selections))),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(totalCount: Int, nodes: [Node?]? = nil) {
                self.init(unsafeResultMap: ["__typename": "UserConnection", "totalCount": totalCount, "nodes": nodes.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the total count of items in the connection.
              public var totalCount: Int {
                get {
                  return resultMap["totalCount"]! as! Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "totalCount")
                }
              }

              /// A list of nodes.
              public var nodes: [Node?]? {
                get {
                  return (resultMap["nodes"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Node?] in value.map { (value: ResultMap?) -> Node? in value.flatMap { (value: ResultMap) -> Node in Node(unsafeResultMap: value) } } }
                }
                set {
                  resultMap.updateValue(newValue.flatMap { (value: [Node?]) -> [ResultMap?] in value.map { (value: Node?) -> ResultMap? in value.flatMap { (value: Node) -> ResultMap in value.resultMap } } }, forKey: "nodes")
                }
              }

              public struct Node: GraphQLSelectionSet {
                public static let possibleTypes = ["User"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("createdAt", type: .nonNull(.scalar(String.self))),
                  GraphQLField("login", type: .nonNull(.scalar(String.self))),
                  GraphQLField("updatedAt", type: .nonNull(.scalar(String.self))),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(createdAt: String, login: String, updatedAt: String) {
                  self.init(unsafeResultMap: ["__typename": "User", "createdAt": createdAt, "login": login, "updatedAt": updatedAt])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// Identifies the date and time when the object was created.
                public var createdAt: String {
                  get {
                    return resultMap["createdAt"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "createdAt")
                  }
                }

                /// The username used to login.
                public var login: String {
                  get {
                    return resultMap["login"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "login")
                  }
                }

                /// Identifies the date and time when the object was last updated.
                public var updatedAt: String {
                  get {
                    return resultMap["updatedAt"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "updatedAt")
                  }
                }
              }
            }

            public struct Comment: GraphQLSelectionSet {
              public static let possibleTypes = ["IssueCommentConnection"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
                GraphQLField("edges", type: .list(.object(Edge.selections))),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(totalCount: Int, edges: [Edge?]? = nil) {
                self.init(unsafeResultMap: ["__typename": "IssueCommentConnection", "totalCount": totalCount, "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the total count of items in the connection.
              public var totalCount: Int {
                get {
                  return resultMap["totalCount"]! as! Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "totalCount")
                }
              }

              /// A list of edges.
              public var edges: [Edge?]? {
                get {
                  return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
                }
                set {
                  resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
                }
              }

              public struct Edge: GraphQLSelectionSet {
                public static let possibleTypes = ["IssueCommentEdge"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("node", type: .object(Node.selections)),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(node: Node? = nil) {
                  self.init(unsafeResultMap: ["__typename": "IssueCommentEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The item at the end of the edge.
                public var node: Node? {
                  get {
                    return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
                  }
                  set {
                    resultMap.updateValue(newValue?.resultMap, forKey: "node")
                  }
                }

                public struct Node: GraphQLSelectionSet {
                  public static let possibleTypes = ["IssueComment"]

                  public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("author", type: .object(Author.selections)),
                    GraphQLField("bodyText", type: .nonNull(.scalar(String.self))),
                  ]

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(author: Author? = nil, bodyText: String) {
                    self.init(unsafeResultMap: ["__typename": "IssueComment", "author": author.flatMap { (value: Author) -> ResultMap in value.resultMap }, "bodyText": bodyText])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The actor who authored the comment.
                  public var author: Author? {
                    get {
                      return (resultMap["author"] as? ResultMap).flatMap { Author(unsafeResultMap: $0) }
                    }
                    set {
                      resultMap.updateValue(newValue?.resultMap, forKey: "author")
                    }
                  }

                  /// The body rendered to text.
                  public var bodyText: String {
                    get {
                      return resultMap["bodyText"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "bodyText")
                    }
                  }

                  public struct Author: GraphQLSelectionSet {
                    public static let possibleTypes = ["EnterpriseUserAccount", "Organization", "User", "Mannequin", "Bot"]

                    public static let selections: [GraphQLSelection] = [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("login", type: .nonNull(.scalar(String.self))),
                      GraphQLField("avatarUrl", type: .nonNull(.scalar(String.self))),
                      GraphQLField("resourcePath", type: .nonNull(.scalar(String.self))),
                    ]

                    public private(set) var resultMap: ResultMap

                    public init(unsafeResultMap: ResultMap) {
                      self.resultMap = unsafeResultMap
                    }

                    public static func makeEnterpriseUserAccount(login: String, avatarUrl: String, resourcePath: String) -> Author {
                      return Author(unsafeResultMap: ["__typename": "EnterpriseUserAccount", "login": login, "avatarUrl": avatarUrl, "resourcePath": resourcePath])
                    }

                    public static func makeOrganization(login: String, avatarUrl: String, resourcePath: String) -> Author {
                      return Author(unsafeResultMap: ["__typename": "Organization", "login": login, "avatarUrl": avatarUrl, "resourcePath": resourcePath])
                    }

                    public static func makeUser(login: String, avatarUrl: String, resourcePath: String) -> Author {
                      return Author(unsafeResultMap: ["__typename": "User", "login": login, "avatarUrl": avatarUrl, "resourcePath": resourcePath])
                    }

                    public static func makeMannequin(login: String, avatarUrl: String, resourcePath: String) -> Author {
                      return Author(unsafeResultMap: ["__typename": "Mannequin", "login": login, "avatarUrl": avatarUrl, "resourcePath": resourcePath])
                    }

                    public static func makeBot(login: String, avatarUrl: String, resourcePath: String) -> Author {
                      return Author(unsafeResultMap: ["__typename": "Bot", "login": login, "avatarUrl": avatarUrl, "resourcePath": resourcePath])
                    }

                    public var __typename: String {
                      get {
                        return resultMap["__typename"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "__typename")
                      }
                    }

                    /// The username of the actor.
                    public var login: String {
                      get {
                        return resultMap["login"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "login")
                      }
                    }

                    /// A URL pointing to the actor's public avatar.
                    public var avatarUrl: String {
                      get {
                        return resultMap["avatarUrl"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "avatarUrl")
                      }
                    }

                    /// The HTTP path for this actor.
                    public var resourcePath: String {
                      get {
                        return resultMap["resourcePath"]! as! String
                      }
                      set {
                        resultMap.updateValue(newValue, forKey: "resourcePath")
                      }
                    }
                  }
                }
              }
            }

            public struct Label: GraphQLSelectionSet {
              public static let possibleTypes = ["LabelConnection"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("edges", type: .list(.object(Edge.selections))),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(edges: [Edge?]? = nil) {
                self.init(unsafeResultMap: ["__typename": "LabelConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// A list of edges.
              public var edges: [Edge?]? {
                get {
                  return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
                }
                set {
                  resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
                }
              }

              public struct Edge: GraphQLSelectionSet {
                public static let possibleTypes = ["LabelEdge"]

                public static let selections: [GraphQLSelection] = [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("node", type: .object(Node.selections)),
                ]

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(node: Node? = nil) {
                  self.init(unsafeResultMap: ["__typename": "LabelEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The item at the end of the edge.
                public var node: Node? {
                  get {
                    return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
                  }
                  set {
                    resultMap.updateValue(newValue?.resultMap, forKey: "node")
                  }
                }

                public struct Node: GraphQLSelectionSet {
                  public static let possibleTypes = ["Label"]

                  public static let selections: [GraphQLSelection] = [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("description", type: .scalar(String.self)),
                    GraphQLField("createdAt", type: .scalar(String.self)),
                    GraphQLField("name", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                  ]

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(description: String? = nil, createdAt: String? = nil, name: String, id: GraphQLID) {
                    self.init(unsafeResultMap: ["__typename": "Label", "description": description, "createdAt": createdAt, "name": name, "id": id])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// A brief description of this label.
                  public var description: String? {
                    get {
                      return resultMap["description"] as? String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "description")
                    }
                  }

                  /// Identifies the date and time when the label was created.
                  public var createdAt: String? {
                    get {
                      return resultMap["createdAt"] as? String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "createdAt")
                    }
                  }

                  /// Identifies the label name.
                  public var name: String {
                    get {
                      return resultMap["name"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "name")
                    }
                  }

                  public var id: GraphQLID {
                    get {
                      return resultMap["id"]! as! GraphQLID
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "id")
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class SearchRepositoriesQuery: GraphQLQuery {
    public var operationName: String = "SearchRepositories"
    
  public let operationDefinition =
    "query SearchRepositories($query: String!, $count: Int!) {\n  search(query: $query, type: REPOSITORY, first: $count) {\n    __typename\n    edges {\n      __typename\n      node {\n        __typename\n        ... on Repository {\n          ...RepositoryDetails\n        }\n      }\n    }\n  }\n}"

  public var queryDocument: String { return operationDefinition.appending(RepositoryDetails.fragmentDefinition) }

  public var query: String
  public var count: Int

  public init(query: String, count: Int) {
    self.query = query
    self.count = count
  }

  public var variables: GraphQLMap? {
    return ["query": query, "count": count]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("search", arguments: ["query": GraphQLVariable("query"), "type": "REPOSITORY", "first": GraphQLVariable("count")], type: .nonNull(.object(Search.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(search: Search) {
      self.init(unsafeResultMap: ["__typename": "Query", "search": search.resultMap])
    }

    /// Perform a search across resources.
    public var search: Search {
      get {
        return Search(unsafeResultMap: resultMap["search"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "search")
      }
    }

    public struct Search: GraphQLSelectionSet {
      public static let possibleTypes = ["SearchResultItemConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .list(.object(Edge.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "SearchResultItemConnection", "edges": edges.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// A list of edges.
      public var edges: [Edge?]? {
        get {
          return (resultMap["edges"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Edge?] in value.map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Edge?]) -> [ResultMap?] in value.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } } }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes = ["SearchResultItemEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", type: .object(Node.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node? = nil) {
          self.init(unsafeResultMap: ["__typename": "SearchResultItemEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge.
        public var node: Node? {
          get {
            return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes = ["App", "Issue", "MarketplaceListing", "Organization", "PullRequest", "Repository", "User"]

          public static let selections: [GraphQLSelection] = [
            GraphQLTypeCase(
              variants: ["Repository": AsRepository.selections],
              default: [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              ]
            )
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public static func makeApp() -> Node {
            return Node(unsafeResultMap: ["__typename": "App"])
          }

          public static func makeIssue() -> Node {
            return Node(unsafeResultMap: ["__typename": "Issue"])
          }

          public static func makeMarketplaceListing() -> Node {
            return Node(unsafeResultMap: ["__typename": "MarketplaceListing"])
          }

          public static func makeOrganization() -> Node {
            return Node(unsafeResultMap: ["__typename": "Organization"])
          }

          public static func makePullRequest() -> Node {
            return Node(unsafeResultMap: ["__typename": "PullRequest"])
          }

          public static func makeUser() -> Node {
            return Node(unsafeResultMap: ["__typename": "User"])
          }

          public static func makeRepository(name: String, owner: AsRepository.Owner, stargazers: AsRepository.Stargazer, url: String) -> Node {
            return Node(unsafeResultMap: ["__typename": "Repository", "name": name, "owner": owner.resultMap, "stargazers": stargazers.resultMap, "url": url])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var asRepository: AsRepository? {
            get {
              if !AsRepository.possibleTypes.contains(__typename) { return nil }
              return AsRepository(unsafeResultMap: resultMap)
            }
            set {
              guard let newValue = newValue else { return }
              resultMap = newValue.resultMap
            }
          }

          public struct AsRepository: GraphQLSelectionSet {
            public static let possibleTypes = ["Repository"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
              GraphQLField("stargazers", type: .nonNull(.object(Stargazer.selections))),
              GraphQLField("url", type: .nonNull(.scalar(String.self))),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String, owner: Owner, stargazers: Stargazer, url: String) {
              self.init(unsafeResultMap: ["__typename": "Repository", "name": name, "owner": owner.resultMap, "stargazers": stargazers.resultMap, "url": url])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The name of the repository.
            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            /// The User owner of the repository.
            public var owner: Owner {
              get {
                return Owner(unsafeResultMap: resultMap["owner"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "owner")
              }
            }

            /// A list of users who have starred this starrable.
            public var stargazers: Stargazer {
              get {
                return Stargazer(unsafeResultMap: resultMap["stargazers"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "stargazers")
              }
            }

            /// The HTTP URL for this repository
            public var url: String {
              get {
                return resultMap["url"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "url")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var repositoryDetails: RepositoryDetails {
                get {
                  return RepositoryDetails(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }

            public struct Owner: GraphQLSelectionSet {
              public static let possibleTypes = ["Organization", "User"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("resourcePath", type: .nonNull(.scalar(String.self))),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public static func makeOrganization(resourcePath: String) -> Owner {
                return Owner(unsafeResultMap: ["__typename": "Organization", "resourcePath": resourcePath])
              }

              public static func makeUser(resourcePath: String) -> Owner {
                return Owner(unsafeResultMap: ["__typename": "User", "resourcePath": resourcePath])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The HTTP URL for the owner.
              public var resourcePath: String {
                get {
                  return resultMap["resourcePath"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "resourcePath")
                }
              }
            }

            public struct Stargazer: GraphQLSelectionSet {
              public static let possibleTypes = ["StargazerConnection"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(totalCount: Int) {
                self.init(unsafeResultMap: ["__typename": "StargazerConnection", "totalCount": totalCount])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Identifies the total count of items in the connection.
              public var totalCount: Int {
                get {
                  return resultMap["totalCount"]! as! Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "totalCount")
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class GetUsernameQuery: GraphQLQuery {
    public var operationName: String = "GetUsername"
    
  public let operationDefinition =
    "query GetUsername {\n  viewer {\n    __typename\n    login\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("viewer", type: .nonNull(.object(Viewer.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(viewer: Viewer) {
      self.init(unsafeResultMap: ["__typename": "Query", "viewer": viewer.resultMap])
    }

    /// The currently authenticated user.
    public var viewer: Viewer {
      get {
        return Viewer(unsafeResultMap: resultMap["viewer"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "viewer")
      }
    }

    public struct Viewer: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("login", type: .nonNull(.scalar(String.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(login: String) {
        self.init(unsafeResultMap: ["__typename": "User", "login": login])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The username used to login.
      public var login: String {
        get {
          return resultMap["login"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "login")
        }
      }
    }
  }
}

public struct RepositoryDetails: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment RepositoryDetails on Repository {\n  __typename\n  name\n  owner {\n    __typename\n    resourcePath\n  }\n  stargazers {\n    __typename\n    totalCount\n  }\n  url\n}"

  public static let possibleTypes = ["Repository"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("owner", type: .nonNull(.object(Owner.selections))),
    GraphQLField("stargazers", type: .nonNull(.object(Stargazer.selections))),
    GraphQLField("url", type: .nonNull(.scalar(String.self))),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(name: String, owner: Owner, stargazers: Stargazer, url: String) {
    self.init(unsafeResultMap: ["__typename": "Repository", "name": name, "owner": owner.resultMap, "stargazers": stargazers.resultMap, "url": url])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// The name of the repository.
  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  /// The User owner of the repository.
  public var owner: Owner {
    get {
      return Owner(unsafeResultMap: resultMap["owner"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "owner")
    }
  }

  /// A list of users who have starred this starrable.
  public var stargazers: Stargazer {
    get {
      return Stargazer(unsafeResultMap: resultMap["stargazers"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "stargazers")
    }
  }

  /// The HTTP URL for this repository
  public var url: String {
    get {
      return resultMap["url"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "url")
    }
  }

  public struct Owner: GraphQLSelectionSet {
    public static let possibleTypes = ["Organization", "User"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("resourcePath", type: .nonNull(.scalar(String.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public static func makeOrganization(resourcePath: String) -> Owner {
      return Owner(unsafeResultMap: ["__typename": "Organization", "resourcePath": resourcePath])
    }

    public static func makeUser(resourcePath: String) -> Owner {
      return Owner(unsafeResultMap: ["__typename": "User", "resourcePath": resourcePath])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The HTTP URL for the owner.
    public var resourcePath: String {
      get {
        return resultMap["resourcePath"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "resourcePath")
      }
    }
  }

  public struct Stargazer: GraphQLSelectionSet {
    public static let possibleTypes = ["StargazerConnection"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(totalCount: Int) {
      self.init(unsafeResultMap: ["__typename": "StargazerConnection", "totalCount": totalCount])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Identifies the total count of items in the connection.
    public var totalCount: Int {
      get {
        return resultMap["totalCount"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "totalCount")
      }
    }
  }
}
