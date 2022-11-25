# dependence
# macOS
# cliclick
	# "brew install cliclick"
	# マウスエミュレータ
# imagemagick
	# "brew install imagemagick"
	# jpg->pdfのconvertコマンド

osascript -e '
    tell application "Google Chrome"
        activate
    end tell
'

# X1, Y1: ページの左上角の座標
# X2, Y2: ページの右上角の座標
X1=75, Y1=185
X2=572, Y2=884

# ページ送りボタンの座標
BTNX=145, BTNY=170

# ページすぐ外側の空白部分の座標
BLANKX=70, BLANKY=470

screencapture -m -R $X1,$Y1,$(($X2-$X1)),$(($Y2-$Y1)) -t jpg ~/M2PlusPDF/0.jpg

for i in `seq -w 1 368`
do
    cliclick c:$BTNX,$BTNY
    sleep 0.2
		screencapture -m -R $X1,$Y1,$(($X2-$X1)),$(($Y2-$Y1)) -t jpg ~/M2PlusPDF/${i}.jpg
		cliclick c:$BLANKX,$BLANKY
		cliclick c:$BLANKX,$($BLANKY+100)
done

convert `ls -v | grep .jpg` SurgicalOperationForResident.pdf
