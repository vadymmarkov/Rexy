/**
 POSIX Regular Expression
 */
public final class Regex {

  /// Specifies the structure to receive the compiled output of the regcomp.
  var preg = regex_t()

  /**
   Creates a new regular expression

   - Parameter pattern: Regular expression to be compiled by the regcomp.
   - Parameter options: Bitwise inclusive OR of 0 or more flags for the regcomp.
   */
  public init(pattern: String, options: CFlags = .extended) throws {
    let result = regcomp(&preg, pattern, options.rawValue)

    guard result == 0 else {
      throw Error(from: result, preg: preg)
    }
  }

  /// Destroy
  deinit {
    regfree(&preg)
  }

  
}
