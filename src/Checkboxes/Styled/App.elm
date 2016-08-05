module Checkboxes.Styled.App exposing (..)

import Html exposing (Html)
import Html.App

import Checkboxes.Styled.Model exposing (..)
import Checkboxes.Styled.Update exposing (..)
import Checkboxes.Styled.View exposing (..)

beginnerProgram : {model : Model, update : Msg -> Model -> Model , view : Model -> Html msg}
beginnerProgram =
  {model = model, update = update, view = view}

main : Program Never
main =
  Html.App.beginnerProgram beginnerProgram
