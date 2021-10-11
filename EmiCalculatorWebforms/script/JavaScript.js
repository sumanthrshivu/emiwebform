
function loanamt() {

    var slider = document.getElementById("sld_loanamt");
    var output = document.getElementById("txt_loanamt");
    output.value = slider.value;

}


function loanamt_rev() {
    var slider = document.getElementById("sld_loanamt");
    var output = document.getElementById("txt_loanamt");
    slider.value = output.value;
}


function tenure() {
    var slider1 = document.getElementById("sld_tenure");
    var output1 = document.getElementById("drp_tenure");
    output1.value = slider1.value;
}

function tenure_rev() {
    var slider1 = document.getElementById("sld_tenure");
    var output1 = document.getElementById("drp_tenure");
    slider1.value = output1.value;
}

function interest() {
    var slider2 = document.getElementById("sld_interest");
    var output2 = document.getElementById("txt_interest");
    output2.value = slider2.value;
}

function interest_rev() {
    var slider2 = document.getElementById("sld_interest");
    var output2 = document.getElementById("txt_interest");
    slider2.value = output2.value;
}