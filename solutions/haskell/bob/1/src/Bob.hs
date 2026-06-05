module Bob (responseFor) where

import Data.Text (Text, strip, toUpper, empty, last, pack, filter)
import Data.Char (isAlpha)

isSilence :: Text -> Bool
isSilence  = (empty ==)

isQuestion :: Text -> Bool
isQuestion t = not (isSilence t) && Data.Text.last t == '?'

isYelling :: Text -> Bool
isYelling t = not (isSilence t) && t == toUpper t && Data.Text.filter isAlpha t /= empty

responseFor :: Text -> Text
responseFor xs
  | isSilence $ strip xs = pack "Fine. Be that way!"
  | let stripped = strip xs in isQuestion stripped && isYelling stripped = pack "Calm down, I know what I'm doing!"
  | isQuestion $ strip xs = pack "Sure."
  | isYelling $ strip xs = pack "Whoa, chill out!"
  | otherwise = pack "Whatever."
  
