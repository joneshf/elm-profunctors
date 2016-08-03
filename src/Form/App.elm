module Form.App exposing (..)

import Html exposing (..)
import Html.App as App
import Html.App.Compose as Compose exposing (..)

import Result.Extra exposing (mapBoth)

import Form.Name.App as Name
import Form.Password.App as Password
import Form.Password.Model as Password
import Form.Password.Update as Password
import Form.Password.View as Password
import Form.Validation.App as Validation
import Form.Validation.Model as Validation
import Form.Validation.Update as Validation

main : Program Never
main =
  Name.beginnerProgram
    |> before passwords
    |> shareMsgAbove validationBeginnerProgram
    |> App.beginnerProgram

passwords : BeginnerProgram (Password.Model String, Password.Model String) (Result Password.Msg Password.Msg)
passwords =
  Password.beginnerProgram
    |> Compose.view (Password.view "Password")
    |> before (Password.beginnerProgram |> Compose.view (Password.view "Re-enter Password"))

validationBeginnerProgram :
  { model : Validation.Model String String
  , view : Validation.Model a b -> Html c
  , update : Result d (Validation.Msg e e) -> Validation.Model e e -> Validation.Model e e
  }
validationBeginnerProgram =
  Validation.beginnerProgram
    |> Compose.updateMap (mapBoth (\_ model -> model))

