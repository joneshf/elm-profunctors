module Counts.App exposing (..)

import Html
import Html.App

import Counts.Model exposing (..)
import Counts.Update exposing (..)
import Counts.View exposing (..)

beginnerProgram : {model : Model, update : Msg -> Model -> Model, view : Model -> Html.Html Msg}
beginnerProgram =
  { model = model
  , update = update
  , view = view
  }

main : Program Never
main =
  Html.App.beginnerProgram beginnerProgram
