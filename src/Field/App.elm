module Field.App exposing (..)

import Html.App

import HighLevel.Compose exposing (..)

import Field.Reverse.App as Reverse
import Field.Text.App as Text

main : Program Never
main =
  Reverse.beginnerProgram
    |> shareMsgAbove Text.beginnerProgram
    |> Html.App.beginnerProgram
