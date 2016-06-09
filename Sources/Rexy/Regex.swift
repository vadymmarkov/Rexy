/**
 POSIX Regular Expression
 */
public final class Regex {

  /// Specifies the structure to receive the compiled output of the regcomp.
  var preg = regex_t()

  /**
   Creates a new regular expression

   - Parameter pattern: Regular expression to be compiled by the regcomp.
   - Parameter flags: Bitwise inclusive OR of 0 or more flags for the regcomp.
   */
  public init(pattern: String, flags: CFlags = .extended) throws {
    let result = regcomp(&preg, pattern, flags.rawValue)

    guard result == 0 else {
      throw Error(from: result, preg: preg)
    }
  }

  /// Destroy
  deinit {
    regfree(&preg)
  }

  /**
   Checks if given string matches regular expression.

   - Parameter string: The string to be matched.
   - Parameter flags: Flags controlling the behavior of the regexec.

   - Returns: True if a match is found.
   */
  public func matches(_ string: String, flags: EFlags = []) -> Bool {
    var offsets = [regmatch_t](repeating: regmatch_t(), count: 1)
    let result = regexec(&preg, string, offsets.count, &offsets, flags.rawValue)

    return result != 1
  }
}
