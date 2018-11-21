import Data.List.Split
import System.Environment
import Data.List

splitDelim s = splitWhen (\c -> (c==' ' || c==',' || c=='\n' || c=='\t')) s
clean s = filter (/="") s

pystring s = pylistWrap $ pystringWrap $ intercalate  "','" s
pystringWrap s = "'" ++ s ++ "'"
pylistWrap s = "[" ++ s ++ "]"

checkSingleQuotesArg args
  | length args < 2 = False
  | otherwise = head (tail args) == "single"

main = do
     args <- getArgs
     let raw = head args
     if checkSingleQuotesArg args == True 
        then putStrLn $ pystring $ clean (splitDelim raw) 
     else print $ clean (splitDelim raw) 

