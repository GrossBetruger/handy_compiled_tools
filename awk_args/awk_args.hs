import System.Environment

trim s = take ((length s) -1) s
to_awk_args range = trim (concat (map (++",") (map ("$"++) (map (show) range))))
main = do
     args <- getArgs
     let start_raw = head args
     let start = (read start_raw)::Int

     let end_raw = head (tail args)
     let end = (read end_raw)::Int
     putStrLn $ to_awk_args [start..end]
