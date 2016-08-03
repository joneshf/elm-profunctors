module Field.Style exposing (..)

import Html exposing (Attribute)
import Html.Attributes exposing (style)

myStyle : Attribute a
myStyle =
  style
    [ ("width", "100%")
    , ("height", "40px")
    , ("padding", "10px 0")
    , ("font-size", "2em")
    , ("text-align", "center")
    ]
