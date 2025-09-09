# Convert a DNA strand to its RNA complement
# RanChar ? DnaChar
SingleDnaToRna ← ˜get map "ACGT" "UGCA"

# RNA ? DNA
ToRna ← |1 ∵SingleDnaToRna
