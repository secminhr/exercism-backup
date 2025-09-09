# Point ? Letter
LetterToPoint ← ˜⊡[1 2 3 4 5 8 10] ⊗1 ⍚∊{"AEIOULNRST" "DG" "BCMP" "FHVWY" "K" "JX" "QZ"}

# Calculate the scrabble score of a word
# Score ? Word
Score ← |1 /+ ∵LetterToPoint ⌵
