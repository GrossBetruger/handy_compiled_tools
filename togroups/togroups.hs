import System.Environment
import Data.List.Split
import Data.List

brackets w = "(" ++ w ++ ")"

splitDelim s = splitWhen (\c -> (c==' ' || c==',' || c=='\n' || c=='\t')) s

pipe groups = intercalate "|" groups

groups :: String -> String
groups s = pipe $ map brackets $ splitDelim s

main = do 
  args <- getArgs
  let raw = head args
  print $ groups raw
 

