module Checkboxes.Styled.View exposing (..)

import Dict exposing (..)
import Html exposing (..)
import Html.Attributes exposing (style)

import Checkboxes.Styled.Model exposing (..)

view : Model -> Html a
view model =
  span [style (toList model)] [text "Hello, how are you?!"]
