$(document).ready(function () {
    $('.moeda').maskMoney({ thousands: '', decimal: ',' });


    $('form').submit(function () {
        var faults = $('input').filter(function () {
            return $(this).data('required') && $(this).val() === "";
        }).css("background-color", "red");
        if (faults.length) return false;
    });

    $('input[validacao|="dia"]').numeric({ max: 31 });
    $('input[validacao|="mes"]').numeric({ max: 12 });
    $('input[validacao|="horas"]').numeric({ max: 23 });
    $('input[validacao|="minutos"]').numeric({ max: 59 });

});

(function ($) {

    $.fn.numeric = function (options) {

        return this.each(function () {
            var $this = $(this);

            $this.keypress(options, function (e) {
                // allow backspace and delete
                if (e.which == 8 || e.which == 0)
                    return true;

                //if the letter is not digit
                if (e.which < 48 || e.which > 57)
                    return false;

                // check max range
                var dest = e.which - 48;
                var result = this.value + dest.toString();
                if (result > e.data.max) {
                    return false;
                }
            });
        });
    };
})(jQuery);
