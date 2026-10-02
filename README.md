# MilkCat

MLIR infrastructure for lifting instructions of different architectures into
binary relations. `include/MilkCat/MilkCatDialect.td` defines the `milkcat`
dialect (`milkcat.relation`); `test/relation.mlir` shows usage. Per-architecture
front ends emit `milkcat.relation` ops tagged with `arch` and `opcode`.
