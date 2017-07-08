{-# LANGUAGE CPP #-}

module Data.List.Gostan where

import Control.Lens
import Control.Monad.Trans.State
import Data.Foldable
import Data.List
import Data.Monoid
import Data.Ord

-- Schwartzian programmer
gostanSchwartzian :: [a] -> [a]
gostanSchwartzian = fmap snd . sortOn (Down . fst) . zip [0 :: Int ..]


-- Origami programmer
gostanOrigami :: [a] -> [a]
gostanOrigami = flip appEndo [] . getDual . foldMap (Dual . Endo . (:))


-- Imperative programmer
gostanImperative :: [a] -> [a]
gostanImperative = flip execState [] . traverse_ (modify . (:))


-- Lens programmer
gostanLens :: Reversing a => a -> a
gostanLens = view reversed


-- Stack Overflow programmer

-- | 'gostanStackOverflow' @xs@ returns the elements of @xs@ in reverse order.
-- @xs@ must be finite.
gostanStackOverflow     :: [a] -> [a]
#ifdef USE_REPORT_PRELUDE
gostanStackOverflow     =  foldl (flip (:)) []
#else
gostanStackOverflow l =  rev l []
  where
    rev []     a = a
    rev (x:xs) a = rev xs (x:a)
#endif


-- Haskell programmer
gostanHaskell :: [a] -> [a]
gostanHaskell = reverse
