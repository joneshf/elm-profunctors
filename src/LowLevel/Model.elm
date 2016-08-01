module LowLevel.Model exposing (..)

import Button.Model as Button

import Count.Model as Count

type alias Model =
  { firstButton : Button.Model
  , count : Count.Model
  , secondButton : Button.Model
  }

model : String -> Int -> String -> Model
model first count second =
  { firstButton = Button.model first
  , count = Count.model count
  , secondButton = Button.model second
  }
