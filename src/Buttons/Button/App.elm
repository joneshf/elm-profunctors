module Buttons.Button.App exposing (..)

import Html
import Html.App

import Buttons.Button.Model exposing (..)
import Buttons.Button.Update exposing (..)
import Buttons.Button.View exposing (..)

beginnerProgram : {model : Model (), update : a -> b -> b, view : Model c -> Html.Html c}
beginnerProgram =
  { model = model "" ()
  , update = update
  , view = view
  }

main : Program Never
main =
  Html.App.beginnerProgram beginnerProgram
