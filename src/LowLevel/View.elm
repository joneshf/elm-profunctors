module LowLevel.View exposing (..)

import Html

import LowLevel.Model exposing (Model)
import LowLevel.Update exposing (Msg)

import Buttons.Button.View as Button
import Buttons.Count.View as Count

view : Model -> Html.Html Msg
view model =
  Html.div
    []
    [ (Button.view << .firstButton) model
    , (Count.view << .count) model
    , (Button.view << .secondButton) model
    ]
