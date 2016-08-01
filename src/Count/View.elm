module Count.View exposing (..)

import Html exposing (..)

import Count.Model exposing (Model)

view : Model -> Html.Html a
view model =
  Html.div []
    [Html.text (toString model)]
