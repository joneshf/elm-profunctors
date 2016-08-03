module Buttons.Count.View exposing (..)

import Html exposing (..)

import Buttons.Count.Model exposing (Model)

view : Model -> Html.Html a
view model =
  Html.div []
    [Html.text (toString model)]
