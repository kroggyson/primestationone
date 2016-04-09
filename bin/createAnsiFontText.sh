#!/bin/bash
source "/home/pi/primestationone/reference/lib/primestation_bash_functions.sh"
pushd ~


fancy_console_message "Listing possible fancy ANSI text fonts..." tux
convert -list font | grep Font:
#Font: AvantGarde-Book
#Font: AvantGarde-BookOblique
#Font: AvantGarde-Demi
#Font: AvantGarde-DemiOblique
#Font: Bookman-Demi
#Font: Bookman-DemiItalic
#Font: Bookman-Light
#Font: Bookman-LightItalic
#Font: Courier
#Font: Courier-Bold
#Font: Courier-BoldOblique
#Font: Courier-Oblique
#Font: fixed
#Font: Helvetica
#Font: Helvetica-Bold
#Font: Helvetica-BoldOblique
#Font: Helvetica-Narrow
#Font: Helvetica-Narrow-Bold
#Font: Helvetica-Narrow-BoldOblique
#Font: Helvetica-Narrow-Oblique
#Font: Helvetica-Oblique
#Font: NewCenturySchlbk-Bold
#Font: NewCenturySchlbk-BoldItalic
#Font: NewCenturySchlbk-Italic
#Font: NewCenturySchlbk-Roman
#Font: Palatino-Bold
#Font: Palatino-BoldItalic
#Font: Palatino-Italic
#Font: Palatino-Roman
#Font: Symbol
#Font: Times-Bold
#Font: Times-BoldItalic
#Font: Times-Italic
#Font: Times-Roman
#Font: Bitstream-Charter
#Font: Bitstream-Charter-Bold
#Font: Bitstream-Charter-Bold-Italic
#Font: Bitstream-Charter-Italic
#Font: Century-Schoolbook-L-Bold
#Font: Century-Schoolbook-L-Bold-Italic
#Font: Century-Schoolbook-L-Italic
#Font: Century-Schoolbook-L-Roman
#Font: Courier-10-Pitch
#Font: Courier-10-Pitch-Bold
#Font: Courier-10-Pitch-Bold-Italic
#Font: Courier-10-Pitch-Italic
#Font: DejaVu-Sans
#Font: DejaVu-Sans-Bold
#Font: DejaVu-Sans-Mono
#Font: DejaVu-Sans-Mono-Bold
#Font: DejaVu-Serif
#Font: DejaVu-Serif-Bold
#Font: Dingbats
#Font: FreeMono
#Font: FreeMono-Bold
#Font: FreeMono-Bold-Oblique
#Font: FreeMono-Oblique
#Font: FreeSans
#Font: FreeSans-Bold
#Font: FreeSans-Bold-Oblique
#Font: FreeSans-Oblique
#Font: FreeSerif
#Font: FreeSerif-Bold
#Font: FreeSerif-Bold-Italic
#Font: FreeSerif-Italic
#Font: Liberation-Mono
#Font: Liberation-Mono-Bold
#Font: Liberation-Mono-Bold-Italic
#Font: Liberation-Mono-Italic
#Font: Liberation-Sans
#Font: Liberation-Sans-Bold
#Font: Liberation-Sans-Bold-Italic
#Font: Liberation-Sans-Italic
#Font: Liberation-Sans-Narrow
#Font: Liberation-Sans-Narrow-Bold
#Font: Liberation-Sans-Narrow-Bold-Italic
#Font: Liberation-Sans-Narrow-Italic
#Font: Liberation-Serif
#Font: Liberation-Serif-Bold
#Font: Liberation-Serif-Bold-Italic
#Font: Liberation-Serif-Italic
#Font: Nimbus-Mono-L
#Font: Nimbus-Mono-L-Bold
#Font: Nimbus-Mono-L-Bold-Oblique
#Font: Nimbus-Mono-L-Regular-Oblique
#Font: Nimbus-Roman-No9-L
#Font: Nimbus-Roman-No9-L-Medium
#Font: Nimbus-Roman-No9-L-Medium-Italic
#Font: Nimbus-Roman-No9-L-Regular-Italic
#Font: Nimbus-Sans-L
#Font: Nimbus-Sans-L-Bold
#Font: Nimbus-Sans-L-Bold-Condensed
#Font: Nimbus-Sans-L-Bold-Condensed-Italic
#Font: Nimbus-Sans-L-Bold-Italic
#Font: Nimbus-Sans-L-Regular-Condensed
#Font: Nimbus-Sans-L-Regular-Condensed-Italic
#Font: Nimbus-Sans-L-Regular-Italic
#Font: Standard-Symbols-L
#Font: URW-Bookman-L-Demi-Bold
#Font: URW-Bookman-L-Demi-Bold-Italic
#Font: URW-Bookman-L-Light
#Font: URW-Bookman-L-Light-Italic
#Font: URW-Chancery-L-Medium-Italic
#Font: URW-Gothic-L-Book
#Font: URW-Gothic-L-Book-Oblique
#Font: URW-Gothic-L-Demi
#Font: URW-Gothic-L-Demi-Oblique
#Font: URW-Palladio-L-Bold
#Font: URW-Palladio-L-Bold-Italic
#Font: URW-Palladio-L-Italic
#Font: URW-Palladio-L-Roman


if [ -z "$19" ]
then
    echo ""
    echo "."
    echo "Usage: the first 19 arguments are <required>!  The last 1 is [optional]."
    echo "createAnsiFontText.sh <filenamePrefix> <backgroundColor> <marginSquash> <text1size> <text1color> <text1font> <text1> <text2size> <text2color> <text2font> <text2> <text3size> <text3color> <text3font> <text3> <text4size> <text4color> <text4font> <text4> [ansiWidthInChars]"
    echo ""
    echo "Example:"
    echo "createAnsiFontText.sh primestationfancytextimage 'black' 35 200 'white' 'Helvetica-BoldOblique' '.P.R.I.M.E.' 200 'yellow' 'URW-Palladio-L-Bold' '.S.T.A.T.I.O.N.' 200 'blue' 'Bitstream-Charter-Bold' '.O.N.E.' 200 'green' 'Liberation-Mono-Bold' 'v1.00' 160"
    echo "...will create a primestationfancytextimage.png and a primestationfancytextimage.ansi (160 characters wide) on a black background with the specified 4 lines of text in the specified colors all sized at 200pt and a marginsquash of 35pt (larger = less vertical space between text, possibly overlapping)"
    echo "."
    echo ""
else
    fancy_console_message "Generating fancy text ANSI art..." unipony

    filenameprefix="$1"
    echo "Filename prefix: $filenameprefix"

    marginsquash=$2
    echo "MarginSquash: $marginsquash"

    canvasbackgroundcolor="$3"
    echo "CanvasBackgroundColor: $canvasbackgroundcolor"

    #Text Line 1:
    size1=$4
    echo "Size1: $size1 pt."
    color1="$5"
    echo "Color1: $color1"
    font1="$6"
    echo "Font1: $font1"
    text1="$7"
    echo "Text1: $text1"

    #Text Line 2:
    size2=$8
    echo "Size2: $size2 pt."
    color2="$9"
    echo "Color2: $color2"
    font2="$10"
    echo "Font2: $font2"
    text2="$11"
    echo "Text2: $text2"

    #Text Line 3:
    size3=$12
    echo "Size3: $size3 pt."
    color3="$13"
    echo "Color3: $color3"
    font3="$14"
    echo "Font3: $font3"
    text3="$15"
    echo "Text3: $text3"

    #Text Line 4:
    size4=$16
    echo "Size4: $size4 pt."
    color4="$17"
    echo "Color4: $color4"
    font4="$18"
    echo "Font4: $font4"
    text4="$19"
    echo "Text4: $text4"

    if [ -z "$20" ]
    then
        ansicharwidth=160
    else
        ansicharwidth=$20
    fi
    echo "AnsiCharacterWidth: $ansicharwidth"

    rm canvas.png
    fudgepixels=4
    totalheight=$((size1+$size2+$size3+$size4-$marginsquash-$marginsquash-$marginsquash-$marginsquash+$fudgepixels))
    convert -size "1920x$totalheight" xc:"$canvasbackgroundcolor" canvas.png
    convert -pointsize $size1 -fill "$color1" -draw "text 0,$(($size1-$marginsquash)) \"$text1\"" -font "$font1" -pointsize $size2 -fill "$color2" -draw "text 0,$(($size1+$size2-$marginsquash-$marginsquash)) \"$text2\"" -font "$font2" -pointsize $size3 -fill "$color3" -draw "text 0,$(($size1+$size2+$size3-$marginsquash-$marginsquash-$marginsquash)) \"$text3\"" -font "$font3" -pointsize $size4 -fill "$color4" -draw "text 0,$(($size1+$size2+$size3+$size4-$marginsquash-$marginsquash-$marginsquash-$marginsquash)) \"$text4\"" -font "$font4" canvas.png "$filenameprefix.png"
    ansize "$filenameprefix.png" "$filenameprefix.ansi" $ansicharwidth
fi

popd
