# (Makers on Alpha) ? String
# e.g. "abe!" -> [1 1 1 0]
IsAlpha ← |1 ×⊃(≥@A|≤@Z) ⌵

# Determine a sentence's acronym
# Acronym ? Sentence
Acronym ← |1 (
    ⌵
    ▽≠0 ++⊸⊃(IsAlpha|=@-|=@ )
    ∵◇⊢ /◇⊂ ⊜(□⊜□≠@-.)≠@ .
)
