module Field.App exposing (..)

import Html.App

import Html.App.Compose exposing (..)

import Field.Reverse.App as Reverse
import Field.Text.App as Text

main : Program Never
main =
  Reverse.beginnerProgram
    |> shareMsg above Text.beginnerProgram
    |> Html.App.beginnerProgram
