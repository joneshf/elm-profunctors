module Form.Password.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

import Form.Password.Model exposing (..)

view : String -> Model a -> Html a
view place event =
  input [ type' "password", placeholder place, onInput event ] []
