module Button.View exposing (..)

import Html exposing (..)
import Html.Events exposing (..)

import Button.Model exposing (Model)

view : a -> Model -> Html a
view modification str =
  button
    [onClick modification]
    [text str]
