module Cursor exposing (Model, Msg, init, update, subscriptions, view)

import Mouse exposing (Position)
import Html exposing (Html, div)


type alias Model =
    Position


type Msg
    = MoveMouse Position


init : Model
init =
    { x = 0, y = 0 }


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
    div [] []
