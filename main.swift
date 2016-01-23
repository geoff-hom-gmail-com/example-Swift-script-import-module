#!/usr/bin/env xcrun swift

/* A Swift script that imports a custom module.

Why? You want to have common custom code, such as utility functions, in one place.

Solution: Build a custom module. Import it. 

Example (dynamic library):
  1) Make module and dynamic library: swiftc -emit-library -emit-module Utility1.swift
  2) Compile script: swiftc -I . -L . -lUtility1 main.swift -o example_dynamic

Issues: If using the dynamic library, then the library must be in the same directory as where you call the script from. In theory, one could fix this with something like swiftc -Xlinker -rpath -Xlinker @executable_path/, but I couldn't get it to work. Also, this requires the library to be included.

Example (static library):
  1) Make module: swiftc -emit-module Utility1.swift.
  2) Make object: swiftc -parse-as-library -c Utility1.swift. (Makes Utility1.o.)
  3) Make static library: ar rvs libUtility1_static.a Utility1.o. (Makes libUtility1_static.a.)
  4) Compile script: swiftc -I . -L . -lUtility1_static main.swift -o example_static

Static library: To update: Do at least steps 1–3.
*/

import Foundation
import Utility1

func printMain() {
    print("")
    print("main")
}

print("")
print("Script 1 (0.0.1) started.")
printMain()
printUtility1()