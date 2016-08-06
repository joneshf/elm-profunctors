module RadioButtons.Styled.App exposing (..)

import Html exposing (Html)
import Html.App

import RadioButtons.Styled.Model exposing (..)
import RadioButtons.Styled.Update exposing (..)
import RadioButtons.Styled.View exposing (..)

beginnerProgram : {model : Model, update : Msg -> Model -> Msg , view : Model -> Html msg}
beginnerProgram =
  {model = model ("", ""), update = update, view = view}

main : Program Never
main =
  Html.App.beginnerProgram beginnerProgram
