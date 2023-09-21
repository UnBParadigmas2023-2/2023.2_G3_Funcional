module TextParser(
     stringToInt
    ,parseOption
    ,parseLine
    ) where

import Data.List.Split (splitOn)

data Option = Option { destiny :: Int  
                        , description :: String
                        } deriving (Show)

data Item = Item { index :: Int  
                     , text :: String  
                     , options :: [Option]
                     } deriving (Show)

stringToInt :: String -> Int
stringToInt "" = -1
stringToInt str = read str

parseOption :: String -> Option
parseOption "" = Option (stringToInt "") "(FIM)"
parseOption input =
    let [destinyStr, desc] = splitOn "-" input
    in Option (stringToInt destinyStr) desc

parseLine :: String -> Item
parseLine input =
    let splitLine = splitOn "|" input
        index = stringToInt (head splitLine)
        optionStrings = splitOn ";" (head (tail splitLine))
        options = map parseOption optionStrings
        text = last splitLine
    in Item index text options