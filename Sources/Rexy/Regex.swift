#if os(Linux)
  @_exported import Glibc
#else
  @_exported import Darwin.C
#endif

/**
 POSIX Regular Expression.
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
      throw Error(from: result, compiledPattern: compiledPattern)
    }
  }

  /// Destroys compiled pattern.
  deinit {
    regfree(&compiledPattern)
  }

  // MARK: - Match

  /**
   Checks if given string matches regular expression.

   - Parameter source: The string to search for a match.
   - Parameter flags: Flags controlling the behavior of the regexec.

   - Returns: True if a match is found.
   */
  public func matches(_ source: String, flags: EFlags = []) -> Bool {
    var elements = [regmatch_t](repeating: regmatch_t(), count: 1)
    let result = regexec(&compiledPattern, source, elements.count, &elements, flags.rawValue)

    return result == 0
  }

  // MARK: - Group

  /**
   Matches and captures groups.

   - Parameter source: The string to search for a match.
   - Parameter maxGroups: The maximum groups count.
   - Parameter maxMatches: The maximum matches count.
   - Parameter flags: Flags controlling the behavior of the regexec.

   - Returns: Found groups.
   */
  public func groups(_ source: String, maxGroups: Int = 10, maxMatches: Int = Int.max,
                     flags: EFlags = []) -> [String] {
    var string = source
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

  // MARK: - Replace

  /**
   Replaces all strings that match a regular expression pattern
   with a specified replacement string.

   - Parameter source: The string to search for a match.
   - Parameter replacement: The replacement string.
   - Parameter maxMatches: The maximum matches count.
   - Parameter flags: Flags controlling the behavior of the regexec.

   - Returns: A new string where replacement string takes the place of each matched string.
   */
  public func replace(_ source: String, with replacement: String, maxMatches: Int = Int.max,
                      flags: EFlags = []) -> String {
    var string = source
    var output: String = ""

    for _ in 0 ..< maxMatches {
      var elements = [regmatch_t](repeating: regmatch_t(), count: 1)
      let result = regexec(&compiledPattern, string, elements.count, &elements, flags.rawValue)

      guard result == 0 else {
        break
      }

      let start = Int(elements[0].rm_so)
      let end = Int(elements[0].rm_eo)
      let startIndex = string.utf8.index(string.utf8.startIndex, offsetBy: end)
      let endIndex = string.utf8.endIndex
      var stringBytes = [UInt8](string.utf8)
      let replacementBytes = [UInt8](replacement.utf8)
      let replacedOffset = replacement.utf8.count + start

      stringBytes.replaceSubrange(start ..< end, with: replacementBytes)

      var replaced = stringBytes.reduce("") {
        $0 + String(UnicodeScalar($1))
      }

      let replacedEndIndex = replaced.utf8.index(replaced.utf8.startIndex, offsetBy: replacedOffset)

      replaced = String(replaced.utf8[replaced.utf8.startIndex ..< replacedEndIndex])
      output += replaced
      string = String(string.utf8[startIndex ..< endIndex])
    }

    return output + string
  }
}
