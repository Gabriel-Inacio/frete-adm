// Only integer
function isIntegerKey(event) {
    var charCode = (window.event.which) ? window.event.which : window.event.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

// Only float
function isFloatKey(sender, evt) {
    var keyChar;
    if (window.event)
        keyChar = String.fromCharCode(window.event.keyCode);
    else if (e)
        keyChar = String.fromCharCode(e.which);
    else
        return true;

    if (keyChar == ",")
        return false;
    var val = (sender.value + keyChar).replace(/,/, '.');
    var number = parseFloat(val);
    if (number != val && val != '-')
        return false;
    return true;
}

$(window).load(function() {
    // CPF
    $("input.cpf").mask("999.999.999-99");

    $("input.phone").mask("(99) 9999-9999?9")

});