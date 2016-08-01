module LowLevel.App exposing (..)

import Html.App

import LowLevel.Model exposing (..)
import LowLevel.Update exposing (..)
import LowLevel.View exposing (..)

main : Program Never
main =
  Html.App.beginnerProgram
    { model = (model "-" 0 "+")
    , update = update
    , view = view
    }
