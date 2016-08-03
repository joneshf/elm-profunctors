module Form.App exposing (..)

import Html.App as App
import Html.App.Compose as Compose exposing (..)

import Form.Name.App as Name
import Form.Password.App as Password
import Form.Password.Model as Password
import Form.Password.Update as Password
import Form.Password.View as Password
import Form.Validation.App as Validation

main : Program Never
main =
  Name.beginnerProgram
    |> before passwords
    |> usingOk (shareMsg above) Validation.beginnerProgram
    |> App.beginnerProgram

passwords : BeginnerProgram (Password.Model String, Password.Model String) (Result Password.Msg Password.Msg)
passwords =
  (Password.beginnerProgram |> view (Password.view "Password"))
    |> before (Password.beginnerProgram |> view (Password.view "Re-enter Password"))
