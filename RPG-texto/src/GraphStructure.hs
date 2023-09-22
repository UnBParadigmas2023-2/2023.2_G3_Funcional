module GraphStructure
  ( playRPG,
    buildNodeMap,
    createGraph,
  )
where

import Data.Graph.Inductive.Graph
import Data.Graph.Inductive.PatriciaTree
import qualified Data.Map as Map
import Data.Maybe
import TextParser

createGraph :: [Item] -> Gr String ()
createGraph items = mkGraph nodes edges
  where
    nodes = [(index item, text item) | item <- items]
    edges = [(index item, dest, ()) | item <- items, Option dest _ <- getItemOptions item]

    -- Função para obter as opções de um Item
    getItemOptions :: Item -> [Option]
    getItemOptions = options

-- Constrói um mapa de nós para opções.
buildNodeMap :: Gr String () -> [Item] -> Map.Map Node Item
buildNodeMap graph items = Map.fromList [(n, item) | (n, item) <- zip (nodes graph) items]

-- Mostrar opções para o jogador
showOptions :: Gr String () -> Map.Map Node Item -> Node -> IO Node
showOptions graph nodeMap currentNode = do
  let currentNodeLabel = fromJust (lab graph currentNode)
  putStrLn currentNodeLabel
  let successors = lsuc graph currentNode
  putStrLn "Escolha uma opção:"
  mapM_
    ( \(dest, _) -> do
        let Just item = Map.lookup dest nodeMap
        putStrLn (show dest ++ ": " ++ description (head (options item)))
    )
    successors
  userInput <- getLine
  let selectedNode = read userInput
  if selectedNode `elem` (map fst successors)
    then return selectedNode
    else do
      putStrLn "Opção inválida. Tente novamente."
      showOptions graph nodeMap currentNode

-- Jogar o RPG
playRPG :: Gr String () -> Map.Map Node Item -> Node -> IO ()
playRPG graph nodeMap currentNode = do
  nextNode <- showOptions graph nodeMap currentNode
  let Just item = Map.lookup nextNode nodeMap
  playRPG graph nodeMap nextNode