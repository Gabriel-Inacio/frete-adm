$(window).load(function() {
    $('form').on('change', '#motorist_percentage', function() {
        setTotal();
    });

    $('form').on('change', '#motorist_salary', function() {
        setTotal();
    });

});

function setTotal() {
    if($('#motorist_percentage').val() == null){
        $('#motorist_percentage').val(0);
    }
    if($('#motorist_salary').val() == null){
        $('#motorist_salary').val(0);
    }
    var salary_by_percentage = (Number($('#motorist_percentage').val()) * Number($('#motorist_value_total_freight').val()))/100;
    $('#motorist_total').val(salary_by_percentage + (Number($('#motorist_salary').val())));
};
