module Field.Text.App exposing (..)

import Html.App

import Field.Text.Model exposing (..)
import Field.Text.Update exposing (..)
import Field.Text.View exposing (..)

import HighLevel.Compose exposing (BeginnerProgram)

beginnerProgram : BeginnerProgram Model Model
beginnerProgram =
  {model = model "", update = update, view = view}

main : Program Never
main =
  Html.App.beginnerProgram beginnerProgram
