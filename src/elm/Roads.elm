module Roads exposing (Model, Msg, init, view)

import Html exposing (Html, text)


type alias Model =
    List Road


type alias Road =
    List Section


type alias Section =
    List Point


type alias Point =
    { x : Float
    , y : Float
    }


type Msg
    = NoOp


init : Model
init =
    [ road
        [ ( 100, 100 )
        , ( 200, 200 )
        , ( 325, 430 )
        , ( 400, 670 )
        , ( 500, 860 )
        ]
    ]


road : List ( Float, Float ) -> Road
road points =
    [ [] ]


view : Model -> Html msg
view roads =
    text "Hello!"
