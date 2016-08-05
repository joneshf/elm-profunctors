module Checkboxes.Checkbox.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (checked, type')
import Html.Events exposing (onCheck)

import Checkboxes.Checkbox.Model exposing (..)
import Checkboxes.Checkbox.Update exposing (..)

view : a -> String -> Model -> Html (Msg a)
view attribute value model =
  label []
    [ input
        [ type' "checkbox"
        , checked model
        , onCheck (interpret attribute value)
        ]
        []
    , text value
    ]

interpret : a -> String -> Model -> Msg a
interpret attribute value checked =
  (attribute, if checked then value else "")
