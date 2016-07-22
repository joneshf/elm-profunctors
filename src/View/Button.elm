module View.Button exposing (..)

import Html exposing (..)

type alias Model =
  String

type alias Msg =
  ()

view : Model -> Html Msg
view str =
  button
    []
    [text str]
