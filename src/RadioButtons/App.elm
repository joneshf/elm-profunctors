module RadioButtons.App exposing (..)

import Html.App exposing (beginnerProgram)

import Result.Extra exposing (mapBoth)

import Html.App.Compose exposing (..)

import RadioButtons.RadioButton.App as RadioButton
import RadioButtons.RadioButton.Model as RadioButton
import RadioButtons.RadioButton.Update as RadioButton
import RadioButtons.RadioButton.View as RadioButton
import RadioButtons.Styled.App as Styled
import RadioButtons.Styled.Model as Styled
import RadioButtons.Styled.Update as Styled

main : Program Never
main =
  styled
    |> shareMsg above radioButtons
    |> Html.App.beginnerProgram

radioButtons
  : BeginnerProgram
      ((RadioButton.Model, RadioButton.Model), RadioButton.Model)
      (Result
        (Result (RadioButton.Msg String String) (RadioButton.Msg String String))
        (RadioButton.Msg String String))
radioButtons =
  let
    radioProgram =
      RadioButton.beginnerProgram
  in
    { radioProgram
    | view = RadioButton.view "color" "red"
    , model = RadioButton.model "style"
    }
      |> above
        { radioProgram
        | view = RadioButton.view "text-decoration" "underline"
        , model = RadioButton.model "style"
        }
      |> above
        { radioProgram
        | view = RadioButton.view "font-weight" "bold"
        , model = RadioButton.model "style"
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
