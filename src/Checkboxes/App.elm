module Checkboxes.App exposing (..)

import Html.App exposing (beginnerProgram)

import Result.Extra exposing (mapBoth)

import Html.App.Compose exposing (..)

import Checkboxes.Checkbox.App as Checkbox
import Checkboxes.Checkbox.Model as Checkbox
import Checkboxes.Checkbox.Update as Checkbox
import Checkboxes.Checkbox.View as Checkbox
import Checkboxes.Styled.App as Styled
import Checkboxes.Styled.Model as Styled
import Checkboxes.Styled.Update as Styled

main : Program Never
main =
  styled
    |> shareMsg above checkboxes
    |> Html.App.beginnerProgram

checkboxes
  : BeginnerProgram
      ((Checkbox.Model, Checkbox.Model), Checkbox.Model)
      (Result
        (Result (Checkbox.Msg String) (Checkbox.Msg String))
        (Checkbox.Msg String))
checkboxes =
  let
    checkboxProgram =
      Checkbox.beginnerProgram
  in
    { checkboxProgram
    | view = Checkbox.view "color" "red"
    }
      |> above
        { checkboxProgram
        | view = Checkbox.view "text-decoration" "underline"
        }
      |> above
        { checkboxProgram
        | view = Checkbox.view "font-weight" "bold"
        }

styled
  : BeginnerProgram
      Styled.Model
      (Result (Result Styled.Msg Styled.Msg) Styled.Msg)
styled =
  let
    styledProgram =
      Styled.beginnerProgram
  in
    { styledProgram
    | update = Styled.update << mapBoth (mapBoth identity identity) identity
    }
