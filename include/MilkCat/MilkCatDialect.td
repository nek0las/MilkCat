// MilkCat dialect: architecture-neutral binary relations lifted from
// machine instructions (x86, ARM, RISC-V, ...).
#ifndef MILKCAT_DIALECT
#define MILKCAT_DIALECT

include "mlir/IR/OpBase.td"

def MilkCat_Dialect : Dialect {
  let name = "milkcat";
  let summary = "Binary relations extracted from machine instructions";
  let cppNamespace = "::milkcat";
}

class MilkCat_Op<string mnemonic, list<Trait> traits = []>
    : Op<MilkCat_Dialect, mnemonic, traits>;

// Relation between a value read (input) and a value written (output) by an
// instruction of the given architecture.
def MilkCat_RelationOp : MilkCat_Op<"relation", [Pure]> {
  let summary = "Binary relation (lhs, rhs) induced by a machine instruction";
  let arguments = (ins AnyType:$lhs, AnyType:$rhs,
                       StrAttr:$arch, StrAttr:$opcode);
  let results = (outs I1:$holds);
  let assemblyFormat =
      "$lhs `,` $rhs attr-dict `:` type($lhs) `,` type($rhs)";
}

#endif // MILKCAT_DIALECT
