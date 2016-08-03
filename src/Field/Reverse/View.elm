module Field.Reverse.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import String exposing (..)

import Field.Reverse.Update exposing (..)
import Field.Style exposing (..)

view : Html Msg
view =
  input [ placeholder "Text to reverse", onInput reverse, myStyle ] []
