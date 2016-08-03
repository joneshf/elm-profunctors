module Field.Reverse.App exposing (..)

import Html.App

import Field.Reverse.Model exposing (..)
import Field.Reverse.Update exposing (..)
import Field.Reverse.View exposing (..)

import HighLevel.Compose exposing (BeginnerProgram)

beginnerProgram : BeginnerProgram Model Msg
beginnerProgram =
  {model = model, update = update, view = always view}

main : Program Never
main =
  Html.App.beginnerProgram beginnerProgram
