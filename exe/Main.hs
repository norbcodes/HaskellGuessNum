module Main where

import System.Exit (exitSuccess)
import System.Random (randomRIO)

guessLoop :: Int -> IO ()
guessLoop theNumber = do
    userStrInput <- getLine
    let userInt = read userStrInput :: Int

    if userInt > 100 || userInt < 0 then do
        putStrLn "Input must be within [0,100]!\nTry again..."
        guessLoop theNumber
    else putStr ""  -- Each if always has an else?

    if userInt == theNumber then do
        putStrLn "You won!\nRerun the program to play again..."
    else do
        if userInt > theNumber then do
            putStrLn "Lower!"
            guessLoop theNumber
        else do
            putStrLn "Higher!"
            guessLoop theNumber
    
    -- This learning journey will be interesting

mainMenu :: IO ()
mainMenu = do
    randomNumber <- randomRIO (0, 100)
    putStrLn "Yo, guess a number from 0 to 100!"

    -- No for/while loops is kinda weird...
    guessLoop randomNumber

main :: IO Int
main = do
    mainMenu
    exitSuccess