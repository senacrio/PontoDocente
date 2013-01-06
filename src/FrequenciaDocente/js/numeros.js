function verificaNumero(e) {
    if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        return false;
    }
}

$(document).ready(function () {
    $('.sonumero').keypress(verificaNumero);
});

var prm = Sys.WebForms.PageRequestManager.getInstance();

prm.add_endRequest(function () {
    $('.sonumero').keypress(verificaNumero);
});