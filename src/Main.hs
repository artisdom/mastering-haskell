{-# LANGUAGE RankNTypes #-}
module Main where
import Control.Monad.ST
import Data.STRef


newIntRef :: ST s (STRef s Int)
newIntRef = newSTRef 42

incrIntRef :: STRef s Int -> ST s ()
incrIntRef ref = modifySTRef ref (+1)

switch :: (forall t. ST t a) -> ST s a
switch body = return $ runST body

invalid :: ST s Int
invalid = do
  ref <- newIntRef
  _ <- switch $ do
    ref2 <- newIntRef
    incrIntRef ref
    readSTRef ref2
  readSTRef ref









main :: IO ()
main = return ()
