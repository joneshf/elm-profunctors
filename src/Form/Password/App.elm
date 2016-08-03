module Form.Password.App exposing (..)

import Html.App

import Form.Password.Model exposing (..)
import Form.Password.Update exposing (..)
import Form.Password.View exposing (..)

import Html.App.Compose as Compose exposing (BeginnerProgram)

beginnerProgram : BeginnerProgram (Model String) String
beginnerProgram =
  {model = model identity, update = update, view = view ""}

main : Program Never
main =
  Html.App.beginnerProgram beginnerProgram
