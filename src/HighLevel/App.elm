module HighLevel.App exposing (..)

import Html.App

import Button.App as Button
import Counts.App as Counts

import HighLevel.Compose exposing (..)

main : Program Never
main =
  setModel "First Button" Button.beginnerProgram
    |> above (setModel [1..10] Counts.beginnerProgram)
    |> above (setModel "Second Button" Button.beginnerProgram)
    |> before (setModel [10..15] Counts.beginnerProgram)
    |> Html.App.beginnerProgram

setModel : b -> {r | model : a} -> {r | model : b}
setModel x record =
  {record | model = x}
