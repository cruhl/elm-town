module Roads exposing (Model, Msg, init, view)

import Roads.Types exposing (Road, Density(..), Section, section)
import Html exposing (Html)
import Svg exposing (Svg, svg, line)
import Svg.Attributes exposing (viewBox, width, height, x, y, x1, y1, x2, y2, stroke, strokeWidth)


type alias Model =
    { roads : List Road }


type Msg
    = NoOp


init : Model
init =
    Model
        [ Road
            Medium
            [ section ( 100, 100 ) ( 200, 200 )
            , section ( 200, 200 ) ( 325, 430 )
            , section ( 325, 430 ) ( 400, 670 )
            , section ( 400, 670 ) ( 500, 860 )
            ]
        ]


view : Model -> Html msg
view { roads } =
    svg [ width "1000", height "1000", viewBox "0 0 1000 1000" ]
        (List.concatMap road roads)


road : Road -> List (Svg msg)
road { sections } =
    List.map sectionDisplay sections


sectionDisplay : Section -> Svg msg
sectionDisplay { start, end } =
    line
        [ x1 (toString start.x)
        , y1 (toString start.y)
        , x2 (toString end.x)
        , y2 (toString end.y)
        , stroke "hsl(0, 0%, 100%)"
        , strokeWidth "5"
        ]
        []
