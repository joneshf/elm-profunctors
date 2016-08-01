module LowLevel.Update exposing (..)

import LowLevel.Model exposing (Model)

import Button.Update as Button
import Count.Model as Count
import Count.Update as Count

type alias Msg =
  Count.Msg Count.Model Count.Model

update : Msg -> Model -> Model
update msg model =
  { model
  | firstButton = Button.update msg model.firstButton
  , count = Count.update msg model.count
  , secondButton = Button.update msg model.secondButton
  }
