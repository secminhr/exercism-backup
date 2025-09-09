# Determine if a year is a leap year
# IsLeapYear ? Year

# I don't see "and" and "or", so I use × and +
Leap ← |1 ◿2 +× ⊃⊃(≠0 ◿100)(=0 ◿4)(=0 ◿400)
