module LowLevel.Model exposing (..)

import Buttons.Button.Model as Button

import Buttons.Count.Model as Count

type alias Model =
  { firstButton : Button.Model (Int -> Int)
  , count : Count.Model
  , secondButton : Button.Model (Int -> Int)
  }

model : String -> Int -> String -> Model
model first count second =
  { firstButton = Button.model first (\x -> x + 1)
  , count = Count.model count
  , secondButton = Button.model second (\x -> x + 1)
  }
