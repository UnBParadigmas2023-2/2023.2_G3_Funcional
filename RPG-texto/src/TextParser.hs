module TextParser
  ( stringToInt,
    parseOption,
    parseLine,
    Item (..),
    Option (..),
  )
where

import Data.List.Split (splitOn)

data Option = Option
  { destiny :: Int,
    description :: String
  }
  deriving (Show)

data Item = Item
  { index :: Int,
    text :: String,
    options :: [Option]
  }
  deriving (Show)

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
      index_ = stringToInt (head splitLine)
      optionStrings = splitOn ";" (head (tail splitLine))
      options_ = map parseOption optionStrings
      text_ = last splitLine
   in Item index_ text_ options_