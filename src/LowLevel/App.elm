module LowLevel.App exposing (..)

import Html.App

import LowLevel.Model exposing (..)
import LowLevel.Update exposing (..)
import LowLevel.View exposing (..)

main : Program Never
main =
  Html.App.beginnerProgram
    { model = {model | firstButton = "First Button", secondButton = "Second Button", counts = [1..10]}
    , update = update
    , view = view
    }
