![Rexy](https://github.com/vadymmarkov/Rexy/blob/master/Images/RexyPresentation.png)

[![CI Status](http://img.shields.io/travis/vadymmarkov/Rexy.svg?style=flat)](https://travis-ci.org/vadymmarkov/Rexy)
![Mac OS X](https://img.shields.io/badge/os-Mac%20OS%20X-green.svg?style=flat)
![Linux](https://img.shields.io/badge/os-linux-green.svg?style=flat)
![Swift](https://img.shields.io/badge/%20in-swift%203.0-orange.svg)
[![License](http://img.shields.io/badge/license-MIT-brightgreen.svg)](http://opensource.org/licenses/MIT)

**Rexy** is a pure Swift implementation of POSIX Regular Expressions.

## Features

- [x] Pattern matching
- [x] Capturing groups
- [x] Replace method
- [x] Representation of a regular expression error
- [x] Option sets with default constants for compilation flags (`cflag`) and regex matching flags (`eflag`)
- [x] Extensive unit test coverage

## Usage

### Pattern matching

When you need to check if a given string matches regular expression:

```swift
import Rexy

do {
  let regex = try Regex(pattern: "Tyrannosaurus")
  regex.matches("Tyrannosaurus") // => true
  regex.matches("Spinosaurus") // => false
} catch {
  print(error)
}
```

### Capturing Groups

When you need to match and capture groups:

```swift
import Rexy

do {
  let regex = try Regex(pattern: "(Tyrannosaurus) (Rex)")
  regex.groups("Tyrannosaurus Rex") // => ["Tyrannosaurus", "Rex"]
  regex.groups("Spinosaurus") // => []
} catch {
  print(error)
}
```

### Replace

When you need to replace all strings that match a regular expression pattern
with a specified replacement string:

```swift
import Rexy

do {
  let regex = try! Regex(pattern: "Tyrannosaurus")
  regex.replace("Tyrannosaurus Rex Tyrannosaurus", with: "Dinosaur") // => "Dinosaur Rex Dinosaur"
  regex.replace("Spinosaurus", with: "Dinosaur") // => Spinosaurus
} catch {
  print(error)
}
```

## Installation

`Rexy` is available through [Swift Package Manager](https://github.com/apple/swift-package-manager).
To install it, simply add the following lines to your `Package.swift`:

```swift
.Package(url: "https://github.com/vadymmarkov/Rexy.git", versions: Version(0,1,0)..<Version(1,0,0))
```

## Author

Vadym Markov, markov.vadym@gmail.com

## Contributing

Check the [CONTRIBUTING](https://github.com/vadymmarkov/Rexy/blob/master/CONTRIBUTING.md)
file for more info.

## License

**Rexy** is available under the MIT license. See the [LICENSE](https://github.com/vadymmarkov/Rexy/blob/master/LICENSE.md) file for more info.
