public final class Regex {

  var preg = regex_t()

  

  deinit {
    regfree(&preg)
  }
}
