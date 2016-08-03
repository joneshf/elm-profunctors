module Buttons.Count.App exposing (..)

import Html
import Html.App

import Buttons.Count.Model exposing (..)
import Buttons.Count.Update exposing (..)
import Buttons.Count.View exposing (..)

beginnerProgram : {model : Model, update : Msg Model Model -> Model -> Model, view : Model -> Html.Html a}
beginnerProgram =
  { model = model 0
  , update = update
  , view = view
  }

main : Program Never
main =
  Html.App.beginnerProgram beginnerProgram
