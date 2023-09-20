module FileReader(readFileLines) where
import System.IO

readFileLines :: FilePath -> IO [String]
readFileLines filePath = do
    contents <- readFile filePath
    return (lines contents)