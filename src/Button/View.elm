module Button.View exposing (..)

import Html exposing (..)
import Html.Events exposing (..)

import Button.Model exposing (Model)

view : Model a -> Html a
view {label, msg} =
  button
    [onClick msg]
    [text label]
