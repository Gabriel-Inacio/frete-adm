function maxLengthText(obj) {
  var maxLength = parseInt(obj.getAttribute('maxlength'));
  var currentLength = obj.value.length;
  if(currentLength <= maxLength) {
    var left = maxLength - (currentLength + obj.value.split('\n').length);
    document.getElementById('contador').innerHTML = ((left + 1) + ' caracteres restantes');
    return true;
  } else {
    return false;
  }
}

function lengthText(obj) {
  var maxLength = parseInt(obj.getAttribute('maxlength'));
  var currentLength = obj.value.length;
  if(currentLength <= maxLength) {
    var left = maxLength - (currentLength + obj.value.split('\n').length);
    document.getElementById('counter').innerHTML = ((left + 1) + ' caracteres restantes');
    return true;
  } else {
    return false;
  }
}
