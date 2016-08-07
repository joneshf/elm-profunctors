module Buttons.Button.View exposing (..)

import Html exposing (..)
import Html.Events exposing (..)

import Buttons.Button.Model exposing (Model)

view : Model a -> Html a
view {label, msg} =
  div []
    [ button
        [onClick msg]
        [text label]
    ]
