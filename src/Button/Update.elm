module Button.Update exposing (..)

import Button.Model exposing (..)

type Msg
  = Set String

update : Msg -> Model -> Model
update (Set str) _=
  str
