module Main (main) where

import Story (runStory)

main :: IO ()
main = do
    putStrLn "\n\nCalouro, está na hora de se matricular!!!"
    putStrLn "\n                                  ou não rs\n"
    runStory