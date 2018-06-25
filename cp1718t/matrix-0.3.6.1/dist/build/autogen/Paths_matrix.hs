module Paths_matrix (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,3,6,1] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/pedro/.cabal/bin"
libdir     = "/home/pedro/.cabal/lib/x86_64-linux-ghc-7.10.3/matrix-0.3.6.1-FrbVWK9rzLG9TyYw8mhOyN"
datadir    = "/home/pedro/.cabal/share/x86_64-linux-ghc-7.10.3/matrix-0.3.6.1"
libexecdir = "/home/pedro/.cabal/libexec"
sysconfdir = "/home/pedro/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "matrix_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "matrix_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "matrix_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "matrix_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "matrix_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
