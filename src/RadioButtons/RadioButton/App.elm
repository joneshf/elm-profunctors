module RadioButtons.RadioButton.App exposing (..)

import Html.App

import Html.App.Compose exposing (BeginnerProgram)

import RadioButtons.RadioButton.Model exposing (..)
import RadioButtons.RadioButton.Update exposing (..)
import RadioButtons.RadioButton.View exposing (..)

beginnerProgram : BeginnerProgram Model (Msg String String)
beginnerProgram =
  {model = model "", update = update, view = view "" ""}

main : Program Never
main =
  Html.App.beginnerProgram beginnerProgram
