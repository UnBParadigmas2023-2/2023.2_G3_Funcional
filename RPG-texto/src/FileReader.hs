module FileReader(readFileLines) where

readFileLines :: FilePath -> IO [String]
readFileLines filePath = do
    contents <- readFile filePath
    return (lines contents)