module RadioButtons.RadioButton.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (checked, name, type')
import Html.Events exposing (on, targetChecked)

import Json.Decode exposing (..)

import RadioButtons.RadioButton.Model exposing (..)
import RadioButtons.RadioButton.Update exposing (..)

view : a -> String -> Model -> Html (Msg a String)
view attribute value model =
  label []
    [ input
        [ type' "radio"
        , name model
        , on "change" (interpret attribute value)
        ]
        []
    , text value
    ]

interpret : a -> b -> Decoder (Msg a b)
interpret attribute value =
  targetChecked `andThen` \b ->
    if b then
      succeed (attribute, value)
    else
      fail ""
