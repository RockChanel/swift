// Ensure that driver issues a remark iff in batch mode.
//
// RUN: %swiftc_driver -whole-module-optimization -enable-batch-mode   %S/../Inputs/empty.swift -### 2>&1 >/dev/null | %FileCheck %s
// RUN: %swiftc_driver                                                 %S/../Inputs/empty.swift -### 2>&1 >/dev/null | %FileCheck -allow-empty %s
// RUN: %swiftc_driver -enable-batch-mode        -disable-batch-mode   %S/../Inputs/empty.swift -### 2>&1 >/dev/null | %FileCheck -allow-empty %s
//
// CHECK-NOT: remark: using batch mode
//
//
// RUN: %swiftc_driver -enable-batch-mode  %S/../Inputs/empty.swift -### 2>&1 | %FileCheck %s -check-prefix USING-BATCH-MODE
//
// USING-BATCH-MODE: remark: using batch mode
