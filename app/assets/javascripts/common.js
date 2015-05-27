$(window).load(function() {
    $(".input_date_picker").datepicker();
});

$(document).ready(function()
{
    var ctrlDown = false;
    var vKey = 86, cKey = 67, aKey = 65;

    $(".numberinput").keydown(function(e)
    {
        if (e.ctrlKey && (e.keyCode == vKey || e.keyCode == cKey ||e.keyCode == aKey))
            return true;
        if (!e.shiftKey && !e.altKey && !e.ctrlKey &&
            // numbers
            e.keyCode >= 48 && e.keyCode <= 57 ||
            // Numeric keypad
            e.keyCode >= 96 && e.keyCode <= 105 ||
            // comma, period and minus, . on keypad
            e.keyCode == 190 || e.keyCode == 188 || e.keyCode == 109 || e.keyCode == 110 ||
            // Backspace and Tab and Enter
            e.keyCode == 8 || e.keyCode == 9 || e.keyCode == 13 ||
            // Home and End
            e.keyCode == 35 || e.keyCode == 36 ||
            // left and right arrows
            e.keyCode == 37 || e.keyCode == 39 ||
            // Del and Ins
            e.keyCode == 46 || e.keyCode == 45 )
            return true;
        return false
    });

    adjustLayout();
});

$(window).resize(function() {
    adjustLayout();
});

function adjustLayout() {

    if($(".with_sidebar").length > 0) {
        var dw = $(document).width();
        if( $(document).width() > ($('#active_admin_content').width() + 60) ) { //60 padding
            $('#active_admin_content').width(dw + 60);
        }
    }
}