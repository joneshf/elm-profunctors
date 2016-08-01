module Button.App exposing (..)

import Html
import Html.App

import Button.Model exposing (..)
import Button.Update exposing (..)
import Button.View exposing (..)

beginnerProgram : {model : Model, update : a -> Model -> Model, view : Model -> Html.Html ()}
beginnerProgram =
  { model = model ""
  , update = update
  , view = view ()
  }

main : Program Never
main =
  Html.App.beginnerProgram beginnerProgram
