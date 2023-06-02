SetWorkingDir,%A_scriptdir%
CoordMode mouse, screen
Menu, Tray, Icon, shell32.dll, 44
Menu, Tray, Tip, PvZ Coin Collector
Menu, Tray, Add, Auto Collect Coins, CollectCoins ; Adds Settings button to Tray Icon context menu
Menu, Tray, Default , Auto Collect Coins

Coins:= Array("SilverCoin.png", "GoldCoin.png")

return
CollectCoins:
WinGetPos, X, Y, WindowW, WindowH, ahk_exe popcapgame1.exe
RowCount:= 4
ColumnCount:=15
StartingyPos:= y+160
StartingxPos:= x+55

loop {
    xPos:= StartingxPos
    yPos:= StartingyPos
    loop %RowCount% {
        loop %ColumnCount%{
            click, %xPos% %yPos%
            xPos:= xPos+50
            ; sleep, 10
            if (stopcode){
                stopcode=0
                return
            }
        }
        yPos:= yPos+100
        xPos:=StartingxPos
    }
}

return
loop {
    loop % Coins.Length(){
        Coin:= "CoinImages\" Coins[A_index], Coin:= "SilverCoin.png"
        ; msgbox, %coin%
        ImageSearch, CoinX, CoinY, %X%, %Y%, %width%, %height%, %Coin%
        if (errorlevel = 0){
            msgbox, i find coin!!!
            click, %Coinx% %CoinY%
        }
        if (errorlevel = 2){
            msgbox, error
        }
    }
    sleep, 100
}

ClickCoin(X, Y){

}

return

escape::
stopcode=1
return