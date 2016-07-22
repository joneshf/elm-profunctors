module View exposing (..)

import Html exposing (..)
import Html.App

import View.Button as Button
import View.Counts as Counts

view : {button : Button.Model, counts : Counts.Model} -> Html (Result Button.Msg Counts.Msg)
view model =
  div
    []
    [ (Html.App.map Err << Button.view << .button) model
    , (Html.App.map Ok << Counts.view << .counts) model
    , (Html.App.map Err << Button.view << .button) model
    ]
