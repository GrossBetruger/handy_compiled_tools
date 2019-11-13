import Data.List.Split
import System.Environment
import Data.List


splitDelim s = splitWhen (\c -> (c==' ' || c==',' || c=='\n' || c=='\t')) s
clean s = filter (/="") s

getFieldName args
  | length args > 2 = "host"
  | otherwise = head (tail args)

addOrLogic terms = intercalate " or " terms

addAndLogic terms = intercalate " and " terms

toShark field terms = map ((field ++ " ") ++) terms

brackets expresion = "(" ++ expresion ++ ")"

main = do
     args <- getArgs
     let raw = head args
     putStrLn $ brackets $ addOrLogic $ toShark (getFieldName args) (clean (splitDelim raw))
