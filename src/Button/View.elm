module Button.View exposing (..)

import Html exposing (..)

import Button.Model exposing (Model)
import Button.Update exposing (Msg)

view : Model -> Html Msg
view str =
  button
    []
    [text str]
