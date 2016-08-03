module Form.Validation.App exposing (..)

import Html exposing (..)
import Html.App

import Form.Validation.Model exposing (..)
import Form.Validation.Update exposing (..)
import Form.Validation.View exposing (..)

beginnerProgram :
  { model : Model String String
  , update : Msg a a -> Model a a -> Model a a
  , view : Model b c -> Html.Html d
  }
beginnerProgram =
  {model = model "" "", update = update, view = view}

main : Program Never
main =
  Html.App.beginnerProgram beginnerProgram
