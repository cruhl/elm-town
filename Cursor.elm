module Cursor exposing (Model, Msg, init, update, subscriptions, view)

import Mouse exposing (Position)
import Html exposing (Html, div)
import Html.Attributes exposing (style)
import Utils exposing ((=>), em, px)


type alias Model =
    Position


type Msg
    = MoveMouse Position


init : Model
init =
    Position 0 0


update : Msg -> Model -> Model
update msg model =
    case msg of
        MoveMouse { x, y } ->
            { model | x = x, y = y }


subscriptions : Sub Msg
subscriptions =
    Mouse.moves MoveMouse


view : Position -> Html msg
view { x, y } =
    let
        radius =
            20

        halfRadius =
            radius / 2

        positioning =
            [ "position" => "absolute"
            , "width" => px radius
            , "height" => px radius
            , "left" => px (toFloat x - halfRadius)
            , "top" => px (toFloat y - halfRadius)
            ]

        display =
            [ "background" => "black"
            , "border-radius" => px radius
            ]
    in
        div [ style (positioning ++ display) ] []
