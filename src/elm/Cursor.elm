module Cursor exposing (Model, Msg, init, update, subscriptions, view)

import Mouse exposing (Position)
import Html exposing (Html, div)
import Html.Attributes exposing (class, style)
import Utils exposing ((=>), px)


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


view : Model -> Html msg
view { x, y } =
    let
        radius =
            30

        borderSize =
            6

        offset =
            radius // 2 + borderSize // 2

        css =
            style
                [ "left" => px (x - offset)
                , "top" => px (y - offset)
                , "width" => px radius
                , "height" => px radius
                ]
    in
        div [ class "cursor", css ] []
