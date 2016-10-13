module Cursor exposing (view)

import Mouse exposing (Position)
import Html exposing (Html, text)


view : Position -> Html msg
view { x, y } =
    text (toString x ++ ", " ++ toString y)
