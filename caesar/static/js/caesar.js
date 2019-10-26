'use strict';

var log = function() {
    console.log.apply(console, arguments);
}

var lower = 'abcdefghijklmnopqrstuvwxyz';

var lowercase = function(str) {
    var result = str.toLowerCase();
    return result;
}

var caesar_encrypt = function(str, shift) {
    var result = '';
    var code = lowercase(str);
    for (var i = 0; i < code.length; i++) {
        var index = lower.indexOf(code[i]);
        if (index >= 0) {
            var shiftindex = (index + shift) % 26;
            result += lower[shiftindex];
        } else {
            result += code[i];
        }
    }
    return result;
}

var caesar_decrypt = function(str, shift) {
    var result = '';
    var code = lowercase(str);
    for (var i = 0; i < code.length; i++) {
        var index = lower.indexOf(code[i]);
        if (index >= 0) {
            var shiftindex = (index + 26 - shift) % 26;
            result += lower[shiftindex];
        } else {
            result += code[i];
        }
    }
    return result;
}

var crypt = function(funcname) {
    var todo = document.getElementById("todo").value;
    var shift = document.getElementById("shift").value;
    document.getElementById("processed").value = eval(funcname + '(todo, parseInt(shift));');
}

var crack = function() {
    var todo = document.getElementById("todo").value;
    var result = '';
    for (var i = 0; i < 26; i++) {
        result += '偏移量' + i + '：' + caesar_decrypt(todo, i) + '\n\n';
    }
    document.getElementById("processed").value = result;
}

var encryptButton = document.querySelector("#encrypt");
encryptButton.addEventListener("click", function() {
    crypt('caesar_encrypt');
});

var decryptButton = document.querySelector("#decrypt");
decryptButton.addEventListener("click", function() {
    crypt('caesar_decrypt');
});

var crackButton = document.querySelector("#crack");
crackButton.addEventListener("click", crack);

var intelButton = document.querySelector("#intel");
intelButton.addEventListener("click", function() {
    alert('开发中');
});