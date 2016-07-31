module Counts.View exposing (..)

import Html exposing (..)

import Counts.Model exposing (Model)
import Counts.Update exposing (Msg)

view : Model -> Html Msg
view xs =
  ul
    []
    (List.map countView xs)

countView : Int -> Html Msg
countView x =
  li
    []
    [text (toString x)]
