module Main (main) where

import GraphStructure (buildNodeMap, createGraph, playRPG)
import TextParser (parseLine)
import FileReader (readFileLines)

main :: IO ()
main = do
  lines_ <- readFileLines "./history/rpg.txt"
  let x = map parseLine lines_
  let graph = createGraph x
  let nodeMap = buildNodeMap graph x
  playRPG graph nodeMap 1 -- Inicie o jogo no nó inicial (1 ou o nó que você preferir)