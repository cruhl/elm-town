module Roads exposing (Model, init, view, lineTo)

import Html exposing (Html, text)
import Svg exposing (Svg, svg, path)
import Svg.Attributes
    exposing
        ( width
        , height
        , d
        , fill
        , stroke
        , strokeWidth
        , strokeLinecap
        , opacity
        )


type alias Model =
    List Road


type alias Road =
    { start : Point
    , bends : List Point
    , end : Point
    }


type alias Point =
    { x : Float
    , y : Float
    }


init : Model
init =
    [ Road
        (Point 100 100)
        [ Point 200 210
        , Point 310 300
        , Point 400 410
        ]
        (Point 500 510)
    ]


view : Model -> Html msg
view roads =
    svg [ width "100%", height "100%" ]
        (List.map viewRoad roads)


viewRoad : Road -> Svg msg
viewRoad road =
    path
        [ d (pathDescription road)
        , fill "transparent"
        , stroke "white"
        , strokeWidth "10"
        , strokeLinecap "round"
        , opacity "0.5"
        ]
        []


pathDescription : Road -> String
pathDescription { start, bends, end } =
    String.join " "
        [ moveTo start
        , String.join " "
            (List.map lineTo bends)
        , lineTo end
        ]


moveTo : Point -> String
moveTo =
    pathCommand "M"


lineTo : Point -> String
lineTo =
    pathCommand "L"


pathCommand : String -> Point -> String
pathCommand command { x, y } =
    command ++ " " ++ toString x ++ " " ++ toString y
