$(function () {

    $('input[type="checkbox"][readonly="readonly"]').click(function (e) {
        e.preventDefault();
    });


    //$('a[href="#panel_frequency"]').tab('show');



    $(".nav a[data-toggle=tab]").on("click", function (e) {
        if ($(this).hasClass("disabled")) {
            e.preventDefault();
            return false;
        }
    });


    var project1;

    $.ajaxSetup({
        cache: false
    });

    var tourGuide = new TourGuide();

    $("#project").change(function () {
        var project = $(this).val();

        console.log(project);

        $.ajax({
            type: 'POST',
            url: 'scripts/getexperiments.php',
            data: 'project=' + project,
            success: function (html) {


                $('#exp').html(html);

                document.getElementById('pname').innerHTML = "";

                project1 = project;

                var x = "- Select Project -";

                if (x === project) {
                    document.getElementById('pname').insertAdjacentHTML('beforeend', '');
                    console.log("true");

                    tourGuide.start();

                } else {
                    document.getElementById('pname').insertAdjacentHTML('beforeend', project);
                    console.log("false");
                    // $(":input#exp").trigger('change', 'triggered');
                }

                setTimeout(function () {
                    $("#loaderexp").hide();
                    $("#loading").fadeOut();
                }, 1500);

            },
            beforeSend: function (html) {
                $("#loaderexp").show();
                $("#loading").show();

            }
        });

    });

    $(":input#project").trigger('change', 'triggered');


    $("#exp").on('change', function () {
        var projectexp = $(this).val();
        var projectexp2 = $("#exp option:selected").text();

        $.jGrowl('', {
            life: 3000,
            theme: 'growl-success',
            header: ' Project  : ' + project1 + ', Experiment : ' + projectexp2
        });

        $.ajax({
            type: 'POST',
            url: 'scripts/getproexp.php',
            data: {
                project: project1,
                exp: projectexp
            },
            success: function (html) {
                console.log(html);
            },
            complete: function () {
                location = window.location;

            },
            beforeSend: function (html) {
                $("#loaderexp").show();
                $("#loading").show();

            },
            success: function (html) {
                $("#loaderexp").hide();
                $("#loading").fadeOut();

            }

        });
    });


    $('#filter').click(function () {

        $('#action').val('1');

        $.ajax({
            type: 'POST',
            url: 'data2.php',
            data: $('#filterform').serialize(),
            success: function (html) {

            },
            complete: function () {
                location = window.location;
            }
        });

    });


    $('#filterclear').click(function () {

        $('#action').val('2');

        $.ajax({
            type: 'POST',
            url: 'data2.php',
            data: $('#filterform').serialize(),
            success: function (html) {

            },
            complete: function () {
                location = window.location;
            }
        });

    });


    $('#filterh').click(function () {


        $.ajax({
            type: 'POST',
            url: 'datahome.php',
            data: $('#filterhome').serialize(),
            success: function (html) {

            },
            complete: function () {
                location = window.location;
            }
        });

    });

});


function confirmationDelete(anchor) {

    var conf = confirm('Are you sure want to delete this? This action is irrevesible');
    if (conf)
        window.location = anchor.attr("href");
}


function validate() {

    var exp = document.getElementById("exp");
    var pro = document.getElementById("project");
    var tot = document.getElementById('total');

    if (pro.value == "") {
        //If the "Please Select" option is selected display error.
        alert("Please select project!");
        return false;
    }
    if (exp.value == "") {
        //If the "Please Select" option is selected display error.
        alert("Please select experiment!");
        return false;
    }
    if (tot.value == "") {
        //If the "Please Select" option is selected display error.
        alert("Please select form!");
        return false;
    }
    return true;
}