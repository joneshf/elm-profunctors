module Checkboxes.Checkbox.App exposing (..)

import Html.App

import Html.App.Compose exposing (BeginnerProgram)

import Checkboxes.Checkbox.Model exposing (..)
import Checkboxes.Checkbox.Update exposing (..)
import Checkboxes.Checkbox.View exposing (..)

beginnerProgram : BeginnerProgram Model (Msg String)
beginnerProgram =
  {model = model False, update = update, view = view "" ""}

main : Program Never
main =
  Html.App.beginnerProgram beginnerProgram
