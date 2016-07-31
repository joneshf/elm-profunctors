module LowLevel.Model exposing (..)

import Button.Model as Button

import Counts.Model as Counts

type alias Model =
  { firstButton : Button.Model
  , counts : Counts.Model
  , secondButton : Button.Model
  }

model : Model
model =
  { firstButton = Button.model
  , counts = Counts.model
  , secondButton = Button.model
  }
