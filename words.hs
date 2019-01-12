import Data.Char
import Data.List
import Control.Arrow ((&&&))

text = "It was the best of times, it was the worst of times, it was the age of wisdom, it was the age of foolishness, it was the epoch of belief, it was the epoch of incredulity, it was the season of Light, it was the season of Darkness, it was the spring of hope, it was the winter of despair, we had everything before us, we had nothing before us, we were all going direct to Heaven, we were all going direct the other way--in short, the period was so far like the present period, that some of its noisiest authorities insisted on its being received, for good or for evil, in the superlative degree of comparison only.\nThere were a king with a large jaw and a queen with a plain face, on the throne of England; there were a king with a large jaw and a queen with a fair face, on the throne of France. In both countries it was clearer than crystal to the lords of the State preserves of loaves and fishes, that things in general were settled for ever."

commonWords = ["the", "be", "to", "of", "and", "a", "in", "that", "have", "i", "it", "for", "not", "on", "with", "he", "as", "you", "do", "at"]

toWordList :: String -> [String]
toWordList str = (words . filter (\x -> isAlpha x || isSpace x) . map toLower) str

countCommonWords :: [String] -> Int
countCommonWords words = length (filter (\x -> elem x commonWords) words)

dropCommonWords :: [String] -> [String]
dropCommonWords words = filter (\x -> not (elem x commonWords)) words

countWords :: [String] -> [(String, Int)]
countWords words = (map (head &&& length) . group . sort) words

sortWords :: [(String, Int)] -> [(String, Int)]
sortWords word = reverse (sortOn snd word)

makeHistogramRow :: (String, Int) -> String
makeHistogramRow coup = (intercalate "" (replicate (snd coup) "*")) ++ " -> " ++ (fst coup) ++ "\n"

makeHistogram :: [(String, Int)] -> String
makeHistogram words = intercalate "" (map makeHistogramRow words)

main = do
 let wordlist = toWordList text
 putStrLn "Report:"
 putStrLn ("\t" ++ (show $ length wordlist) ++ " words")
 putStrLn ("\t" ++ (show $ countCommonWords wordlist) ++ " common words")
 putStrLn "\nHistogram of the most frequent words (excluding common words):\n"
 putStr $ makeHistogram $ sortWords $ countWords $ dropCommonWords $ wordlist