module LowLevel.View exposing (..)

import Html

import LowLevel.Model exposing (Model)
import LowLevel.Update exposing (Msg)

import Button.View as Button
import Count.View as Count

view : Model -> Html.Html Msg
view model =
  Html.div
    []
    [ (Button.view (\x -> x - 1) << .firstButton) model
    , (Count.view << .count) model
    , (Button.view (\x -> x + 1) << .secondButton) model
    ]
