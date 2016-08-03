module Form.Name.App exposing (..)

import Html.App

import Form.Name.Model exposing (..)
import Form.Name.Update exposing (..)
import Form.Name.View exposing (..)

import Html.App.Compose as Compose exposing (BeginnerProgram)

beginnerProgram : BeginnerProgram Model String
beginnerProgram =
  {model = model "", update = update, view = view}

main : Program Never
main =
  Html.App.beginnerProgram beginnerProgram
