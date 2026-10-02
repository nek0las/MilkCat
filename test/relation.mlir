// Example: x86 `mov rax, rbx` and AArch64 `mov x0, x1` map to the same relation.
func.func @f(%a: i64, %b: i64) {
  %0 = milkcat.relation %a, %b {arch = "x86_64", opcode = "mov"} : i64, i64
  %1 = milkcat.relation %a, %b {arch = "aarch64", opcode = "mov"} : i64, i64
  return
}
