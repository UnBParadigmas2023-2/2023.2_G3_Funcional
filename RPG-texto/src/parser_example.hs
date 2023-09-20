import FileReader
import TextParser

main :: IO()
main = do
    lines <- readFileLines "rpg.txt"
    let x = map parseLine lines
    print x