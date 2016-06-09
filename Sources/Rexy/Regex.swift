/**
 POSIX Regular Expression
 */
public final class Regex {

  /// Specifies the structure to receive the compiled output of the regcomp.
  var compiledPattern = regex_t()

  /**
   Creates a new regular expression

   - Parameter pattern: Regular expression to be compiled by the regcomp.
   - Parameter flags: Bitwise inclusive OR of 0 or more flags for the regcomp.
   */
  public init(pattern: String, flags: CFlags = .extended) throws {
    let result = regcomp(&compiledPattern, pattern, flags.rawValue)

    guard result == 0 else {
      throw Error(from: result, preg: compiledPattern)
    }
  }

  /// Destroy
  deinit {
    regfree(&compiledPattern)
  }

  /**
   Checks if given string matches regular expression.

   - Parameter string: The string to be matched.
   - Parameter flags: Flags controlling the behavior of the regexec.

   - Returns: True if a match is found.
   */
  public func matches(_ string: String, flags: EFlags = []) -> Bool {
    var elements = [regmatch_t](repeating: regmatch_t(), count: 1)
    let result = regexec(&compiledPattern, string, elements.count, &elements, flags.rawValue)

    return result == 0
  }

  /**
   Matches and captures groups.

   - Parameter string: The string to be matched.
   - Parameter maxGroups: The maximum groups count.
   - Parameter maxMatches: The maximum matches count.
   - Parameter flags: Flags controlling the behavior of the regexec.

   - Returns: Found groups.
   */
  public func groups(_ string: String, maxGroups: Int = 10, maxMatches: Int = Int.max,
                     flags: EFlags = []) -> [String] {
    var string = string
    var groups = [String]()

    for _ in 0 ..< maxMatches {
      var elements = [regmatch_t](repeating: regmatch_t(), count: maxGroups)
      let result = regexec(&compiledPattern, string, elements.count, &elements, flags.rawValue)

      guard result == 0 else {
        break
      }

      for element in elements[1 ..< elements.count] where element.rm_so != -1 {
        let start = Int(element.rm_so)
        let end = Int(element.rm_eo)
        let startIndex = string.index(string.startIndex, offsetBy: start)
        let endIndex = string.index(string.startIndex, offsetBy: end)
        let group = string[startIndex..<endIndex]

        groups.append(group)
      }

      let offset = Int(elements[0].rm_eo)
      let startIndex = string.utf8.index(string.utf8.startIndex, offsetBy: offset)

      guard let substring = String(string.utf8[startIndex ..< string.utf8.endIndex]) else {
        break
      }

      string = substring
    }

    return groups
  }
}
