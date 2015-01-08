module Label (
    Label(..)
    , notWord
    , Label.showChar
    , labelIsWord
    , isCipherText
) where

import Data.Char

-- | The Label type has a character (ie. the one in the word), a frequency
-- which is the frequency in (English) text that the word exhibits (ie. 0
-- if it is not the end of a word) and a count which is the numbers of words
-- in the branch.
data Label = Label {ch::Char, logFreq::Double, count::Int}

instance Show Label where
    show (Label ch f n) = (show ch) ++ ", " ++ (show n) ++ ", " ++ (show f)

instance Eq Label where
    (Label c1 f1 n1) == (Label c2 f2 n2) = f1 == f2

instance Ord Label where
    compare (Label c1 f1 n1) (Label c2 f2 n2) = compare f1 f2

showChar :: Label -> String
showChar (Label ch f n) = [ch]

-- | This is the -log(frequency) that we use for non words
-- ie e^(-1000) == 0. One in a billion is 20.72
notWord = 1000.0

-- | Strings adhere to the convention that plain text is lowercase and cipher text is upper case
isCipherText = isUpper

-- | Checks whether the label is the end of a word, ie. the freq > 0.0
-- or the log frequency < 1000.0
labelIsWord :: Label -> Bool
labelIsWord l = logFreq l < notWord


