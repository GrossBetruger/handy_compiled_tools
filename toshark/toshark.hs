import Data.List.Split
import System.Environment
import Data.List


splitDelim s = splitWhen (\c -> (c==' ' || c==',' || c=='\n' || c=='\t')) s
clean s = filter (/="") s

checkLogicArg args
  | length args < 2 = False
  | otherwise = head (tail args) == "and"

addOrLogic terms = intercalate " or " terms

addAndLogic terms = intercalate " and " terms

toHosts terms = map ("host " ++) terms

brackets expresion = "(" ++ expresion ++ ")"

main = do
     args <- getArgs
     let raw = head args
     if checkLogicArg args == True
        then putStrLn $ brackets $ addAndLogic $ toHosts $ clean (splitDelim raw)
     else putStrLn $ brackets $ addOrLogic $ toHosts $ clean (splitDelim raw)

