module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

ageOn :: Planet -> Float -> Float
ageOn planet seconds =
    let year = seconds / secondsInAnEarthYear
    in case planet of 
        Mercury -> year / 0.2408467
        Venus -> year / 0.61519726
        Earth -> year
        Mars -> year / 1.8808158
        Jupiter -> year / 11.862615
        Saturn -> year / 29.447498
        Uranus -> year / 84.016846
        Neptune -> year / 164.79132

secondsInAnEarthYear = 31557600