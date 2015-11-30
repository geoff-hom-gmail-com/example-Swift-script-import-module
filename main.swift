#!/usr/bin/env xcrun swift

/* A Swift script that imports a custom module.

Why? You want to have common custom code, such as utility functions, in one place.

Solution: Build a custom module. Import it. 

Example: 
  1) Make module: swiftc -emit-library -emit-module Utility1.swift
  2) Compile script: swiftc -I . -L . -lUtility1 main.swift -o example
  3) Run script: ./example
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