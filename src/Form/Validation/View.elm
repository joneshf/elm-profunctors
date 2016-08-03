module Form.Validation.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Form.Validation.Model exposing (..)

view : Model a b -> Html c
view {color, message} =
    div [ style [("color", color)] ] [ text message ]
