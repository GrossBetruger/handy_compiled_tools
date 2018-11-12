import Data.List.Split
import System.Environment

splitDelim s = splitWhen (\c -> (c==' ' || c==',')) s
clean s = filter (/="") s

main = do
     args <- getArgs
     let raw = head args
     print $ clean (splitDelim raw)
