module LowLevel.View exposing (..)

import Html
import Html.App

import LowLevel.Model exposing (Model)
import LowLevel.Update exposing (Msg)

import Button.View as Button
import Counts.View as Counts

view : Model -> Html.Html Msg
view model =
  Html.div
    []
    [ (Html.App.map Err << Button.view << .firstButton) model
    , (Html.App.map Ok << Html.App.map Err << Counts.view << .counts) model
    , (Html.App.map Ok << Html.App.map Ok << Button.view << .secondButton) model
    ]
