import           Debug.Trace
import           Test.Hspec
import           Test.Hspec.QuickCheck
import           Test.QuickCheck
import           Text.Unidecode

main :: IO ()
main = hspec spec

spec = describe "unidecode" $ do
  it "doesn't hurt ascii text" $ do
    unidecode 'a' `shouldBe` "a"

  it "doesn't crash" $ property $
    \x ->  unidecode x == unidecode x

  it "strips out non-ASCII text" $ do
    concatMap unidecode "五十音順" `shouldBe` "" 
