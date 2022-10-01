$(window).load(function () {
    $("#loading").fadeOut();
    upload();

    $.ajaxSetup({
        cache: false
    });
})

$(function () {
    $.ajax({
        type: 'POST',
        url: 'scripts/getsites.php',
        success: function (html) {
            $('#site_id').html(html);

        }
    });

    $("li.disabled a").click(function () {
        return false;
    });

    /* # Bootstrap Multiselects
     ================================================== */
    //===== Default multiselect =====//

    $('.multi-select').multiselect({
        buttonClass: 'btn btn-default',
        onChange: function (element, checked) {
            $.uniform.update();
        }
    });


    //===== Multiselect with colored button =====//

    $('.multi-select-color').multiselect({
        buttonClass: 'btn btn-danger',
        onChange: function (element, checked) {
            $.uniform.update();
        }
    });


    //===== Multiselect with "Select All" option =====//

    $('.multi-select-all').multiselect({
        buttonClass: 'btn btn-default',
        includeSelectAllOption: true,
        onChange: function (element, checked) {
            $.uniform.update();
        }
    });


    //===== onChange function =====//

    $('.multi-select-onchange').multiselect({
        buttonClass: 'btn btn-default',
        onChange: function (element, checked) {
            $.uniform.update();
            $.jGrowl('Change event invoked!', {
                header: 'Update',
                position: 'center',
                life: 1500
            });
        }
    });


    //===== Right aligned multiselect dropdown =====//

    $('.multi-select-right').multiselect({
        buttonClass: 'btn btn-default',
        dropRight: true,
        onChange: function (element, checked) {
            $.uniform.update();
        }
    });


    //===== Search field select =====//

    $('.multi-select-search').multiselect({
        buttonClass: 'btn btn-link btn-lg btn-icon',
        dropRight: true,
        buttonText: function (options) {
            if (options.length == 0) {
                return '<b class="caret"></b>';
            } else {
                return ' <b class="caret"></b>';
            }
        },
        onChange: function (element, checked) {
            $.uniform.update();
        }
    });


    /* # Select2 dropdowns
     ================================================== */


    //===== Datatable select =====//

    $(".dataTables_length select").select2({
        minimumResultsForSearch: "-1"
    });


    //===== Default select =====//

    $(".select").select2({
        minimumResultsForSearch: "-1",
        width: 200
    });


    //===== Liquid select =====//

    $(".select-liquid").select2({
        minimumResultsForSearch: "-1",
        width: "off"
    });


    //===== Full width select =====//

    $(".select-full").select2({
        minimumResultsForSearch: "-1",
        width: "100%"
    });


    //===== Select with filter input =====//

    $(".select-search").select2({
        width: 200
    });


    //===== Multiple select =====//

    $(".select-multiple").select2({
        width: "100%"
    });


    //===== Loading data select =====//

    $("#loading-data").select2({
        placeholder: "Enter at least 1 character",
        allowClear: true,
        minimumInputLength: 1,
        query: function (query) {
            var data = {
                    results: []
                },
                i, j, s;
            for (i = 1; i < 5; i++) {
                s = "";
                for (j = 0; j < i; j++) {
                    s = s + query.term;
                }
                data.results.push({
                    id: query.term + i,
                    text: s
                });
            }
            query.callback(data);
        }
    });


    //===== Select with maximum =====//

    $(".maximum-select").select2({
        maximumSelectionSize: 3,
        width: "100%"
    });


    //===== Allow clear results select =====//

    $(".clear-results").select2({
        placeholder: "Select a State",
        allowClear: true,
        width: 200
    });


    //===== Select with minimum =====//

    $(".minimum-select").select2({
        minimumInputLength: 2,
        width: 200
    });


    //===== Multiple select with minimum =====//

    $(".minimum-multiple-select").select2({
        minimumInputLength: 2,
        width: "100%"
    });


    //===== Disabled select =====//

    $(".select-disabled").select2(
        "enable", false
    );


    /* # Form Related Plugins
     ================================================== */


    //===== Pluploader (multiple file uploader) =====//

    $(".multiple-uploader").pluploadQueue({
        runtimes: 'html5, html4',
        url: '../upload.php',
        chunk_size: '1mb',
        unique_names: true,
        filters: {
            max_file_size: '10mb',
            mime_types: [{
                    title: "Image files",
                    extensions: "jpg,gif,png"
                },
                {
                    title: "Zip files",
                    extensions: "zip"
                }
            ]
        },
        resize: {
            width: 320,
            height: 240,
            quality: 90
        }
    });


    //===== WYSIWYG editor =====//

    $('.editor').wysihtml5({
        stylesheets: "css/wysihtml5/wysiwyg-color.css"
    });


    //===== Elastic textarea =====//

    $('.elastic').autosize();


    //===== Dual select boxes =====//

    $.configureBoxes();


    //===== Input limiter =====//

    $('.limited').inputlimiter({
        limit: 100,
        boxId: 'limit-text',
        boxAttach: false
    });


    //===== Tags Input =====//

    $('.tags').tagsInput({
        width: '100%'
    });
    $('.tags-autocomplete').tagsInput({
        width: '100%',
        autocomplete_url: 'tags_autocomplete.html'
    });


    //===== Form elements styling =====//

    $(".styled, .multiselect-container input").uniform({
        radioClass: 'choice',
        selectAutoWidth: false
    });


    /* # Form Validation
     ================================================== */

    $(".validate").validate({
        errorPlacement: function (error, element) {
            if (element.parent().parent().attr("class") == "checker" || element.parent().parent().attr("class") == "choice") {
                error.appendTo(element.parent().parent().parent().parent().parent());
            } else if (element.parent().parent().attr("class") == "checkbox" || element.parent().parent().attr("class") == "radio") {
                error.appendTo(element.parent().parent().parent());
            } else {
                error.insertAfter(element);
            }
        },
        rules: {
            minimum_characters: {
                required: true,
                minlength: 3
            },
            maximum_characters: {
                required: true,
                maxlength: 6
            },
            minimum_number: {
                required: true,
                min: 3
            },
            maximum_number: {
                required: true,
                max: 6
            },
            range: {
                required: true,
                range: [6, 16]
            },
            email_field: {
                required: true,
                email: true
            },
            url_field: {
                required: true,
                url: true
            },
            date_field: {
                required: true,
                date: true
            },
            digits_only: {
                required: true,
                digits: true
            },
            enter_password: {
                required: true,
                minlength: 5
            },
            repeat_password: {
                required: true,
                minlength: 5,
                equalTo: "#enter_password"
            },
            custom_message: "required",
            group_styled: {
                required: true,
                minlength: 2
            },
            group_unstyled: {
                required: true,
                minlength: 2
            },
            agree: "required"
        },
        messages: {
            custom_message: {
                required: "Bazinga! This message is editable",
            },
            agree: "Please accept our policy"
        },
        success: function (label) {
            label.text('Success!').addClass('valid');
        }
    });


    //===== jGrowl notifications defaults =====//

    $.jGrowl.defaults.closer = false;
    $.jGrowl.defaults.easing = 'easeInOutCirc';


    //===== Time pickers =====//

    $('#defaultValueExample, #time').timepicker({
        'scrollDefaultNow': true
    });

    $('#durationExample').timepicker({
        'minTime': '2:00pm',
        'maxTime': '11:30pm',
        'showDuration': true
    });

    $('#onselectExample').timepicker();
    $('#onselectExample').on('changeTime', function () {
        $('#onselectTarget').text($(this).val());
    });

    $('#timeformatExample1, #timeformatExample3').timepicker({
        'timeFormat': 'H:i:s'
    });
    $('#timeformatExample2, #timeformatExample4').timepicker({
        'timeFormat': 'h:i A'
    });


    //===== Color picker =====//

    $('.color-picker').colorpicker();

    $('.color-picker-hex').colorpicker({
        format: 'hex'
    });


    //===== jQuery UI Datepicker =====//

    $(".datepicker").datepicker({
        showOtherMonths: true,
        dateFormat: 'yy-mm-dd'
    });

    $(".datepicker-inline").datepicker({
        showOtherMonths: true
    });

    $(".datepicker-multiple").datepicker({
        showOtherMonths: true,
        numberOfMonths: 3
    });

    $(".datepicker-trigger").datepicker({
        showOn: "button",
        buttonImage: "images/interface/datepicker_trigger.png",
        buttonImageOnly: true,
        dateFormat: 'yy-mm-dd',
        showOtherMonths: true
    });

    $(".from-date").datepicker({
        defaultDate: "+1w",
        numberOfMonths: 3,
        dateFormat: 'yy-mm-dd',
        showOtherMonths: true,
        onClose: function (selectedDate) {
            $(".to-date").datepicker("option", "minDate", selectedDate);
        }
    });
    $(".to-date").datepicker({
        defaultDate: "+1w",
        numberOfMonths: 3,
        dateFormat: 'yy-mm-dd',
        showOtherMonths: true,
        onClose: function (selectedDate) {
            $(".from-date").datepicker("option", "maxDate", selectedDate);
        }
    });

    $(".datepicker-restricted").datepicker({
        minDate: -20,
        maxDate: "+1M +10D",
        showOtherMonths: true
    });


    //===== Jquery UI sliders =====//

    $("#default-slider").slider();

    $("#increments-slider").slider({
        value: 100,
        min: 0,
        max: 500,
        step: 50,
        slide: function (event, ui) {
            $("#donation-amount").val("$" + ui.value);
        }
    });
    $("#donation-amount").val("$" + $("#increments-slider").slider("value"));

    $("#range-slider, #range-slider1").slider({
        range: true,
        min: 0,
        max: 500,
        values: [75, 300],
        slide: function (event, ui) {
            $("#price-amount, #price-amount1").val("$" + ui.values[0] + " - $" + ui.values[1]);
        }
    });
    $("#price-amount, #price-amount1").val("$" + $("#range-slider, #range-slider1").slider("values", 0) +
        " - $" + $("#range-slider, #range-slider1").slider("values", 1));

    $("#slider-range-min, #slider-range-min1").slider({
        range: "min",
        value: 37,
        min: 1,
        max: 700,
        slide: function (event, ui) {
            $("#min-amount, #min-amount1").val("$" + ui.value);
        }
    });
    $("#min-amount, #min-amount1").val("$" + $("#slider-range-min, #slider-range-min1").slider("value"));

    $("#slider-range-max, #slider-range-max1").slider({
        range: "max",
        min: 1,
        max: 10,
        value: 2,
        slide: function (event, ui) {
            $("#max-amount, #max-amount1").val(ui.value);
        }
    });
    $("#max-amount, #max-amount1").val($("#slider-range-max, #slider-range-max1").slider("value"));


    //===== Code prettifier =====//

    window.prettyPrint && prettyPrint();


    //===== Fancy box (lightbox plugin) =====//

    $(".lightbox").fancybox({
        padding: 1
    });


    //===== Fullcalendar =====//

    var date = new Date();
    var d = date.getDate();
    var m = date.getMonth();
    var y = date.getFullYear();
    var calendar = $('.fullcalendar').fullCalendar({
        header: {
            left: 'prev,next,today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        selectable: true,
        selectHelper: true,
        select: function (start, end, allDay) {
            var title = prompt('Event Title:');
            if (title) {
                calendar.fullCalendar('renderEvent', {
                        title: title,
                        start: start,
                        end: end,
                        allDay: allDay
                    },
                    true // make the event "stick"
                );
            }
            calendar.fullCalendar('unselect');
        },
        editable: true,
        events: [{
                title: 'All Day Event',
                start: new Date(y, m, 1)
            },
            {
                title: 'Long Event',
                start: new Date(y, m, d - 5),
                end: new Date(y, m, d - 2)
            },
            {
                id: 999,
                title: 'Repeating Event',
                start: new Date(y, m, d - 3, 16, 0),
                allDay: false
            },
            {
                id: 999,
                title: 'Repeating Event',
                start: new Date(y, m, d + 4, 16, 0),
                allDay: false
            },
            {
                title: 'Meeting',
                start: new Date(y, m, d, 10, 30),
                allDay: false
            },
            {
                title: 'Lunch',
                start: new Date(y, m, d, 12, 0),
                end: new Date(y, m, d, 14, 0),
                allDay: false
            },
            {
                title: 'Birthday Party',
                start: new Date(y, m, d + 1, 19, 0),
                end: new Date(y, m, d + 1, 22, 30),
                allDay: false
            }
        ]
    });

    /* Render hidden calendar on tab show */
    $('a[data-toggle="tab"]').on('shown.bs.tab', function () {
        $('.fullcalendar').fullCalendar('render');
    });


    /* # Bootstrap Plugins
     ================================================== */


    //===== Tooltip =====//

    $('.tip').tooltip();


    //===== Popover =====//

    $("[data-toggle=popover]").popover().click(function (e) {
        e.preventDefault()
    });


    //===== Loading button =====//

    $('.btn-loading').click(function () {
        var btn = $(this)
        btn.button('loading')
        setTimeout(function () {
            btn.button('reset')
        }, 3000)
    });


    //===== Add fadeIn animation to dropdown =====//

    $('.dropdown, .btn-group').on('show.bs.dropdown', function (e) {
        $(this).find('.dropdown-menu').first().stop(true, true).fadeIn(100);
    });


    //===== Add fadeOut animation to dropdown =====//

    $('.dropdown, .btn-group').on('hide.bs.dropdown', function (e) {
        $(this).find('.dropdown-menu').first().stop(true, true).fadeOut(100);
    });


    /* # Interface Related Plugins
     ================================================== */


    //===== Collapsible navigation =====//

    $('.expand').collapsible({
        defaultOpen: 'second-level,third-level',
        cssOpen: 'level-opened',
        cssClose: 'level-closed',
        speed: 150
    });


    /* # Default Layout Options
     ================================================== */

    //===== Hiding sidebar =====//

    $('.sidebar-toggle').click(function () {
        $('.page-container').toggleClass('hidden-sidebar');
    });


});


function randomColor() {
    var letters = '0123456789ABCDEF'.split('');
    var color = '#';
    for (var i = 0; i < 6; i++) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}


function goback() {
    window.history.back();
}

function rowStyle(row, index) {

    var classes = ['active', 'success', 'info', 'warning', 'danger'];
    console.log(row, row.keyid);
    if (parseInt(row.keyid) > 0) {
        return {
            classes: "warning"
        }
    }
    return {};
}

function findLongestWord(str) {
    var strSplit = str.split(' ');
    var longestWord = 0;
    var word = ""
    for (var i = 0; i < strSplit.length; i++) {
        if (strSplit[i].length > longestWord) {
            longestWord = strSplit[i].length;
            word = strSplit[i];
        }
    }

    var res = str.replace(word, word.italics());

    return res;
}

function italicize(str) {

    var word = str;

    if (word.length) {
        var res = str.replace(word, word.italics());
    }

    return res;
}

function tabledata(dataset) {
    var html = '<table class="table table-bordered animate__animated animate__zoomIn" style="border: 1px solid: #ddd !important;">';
    html += '<thead><tr><th> </th>';

    var columnCount = 0;
    jQuery.each(dataset.datasets, function (idx, item) {
        html += '<th style="background-color:' + item.fillColor + ';">' + item.label + '</th>';
        columnCount += 1;
    });

    html += '</tr></thead>';

    jQuery.each(dataset.labels, function (idx, item) {
        html += '<tr><td>' + item + '</td>';
        for (i = 0; i < columnCount; i++) {
            html += '<td style="background-color:' + dataset.datasets[i].fillColor + ';">' + (dataset.datasets[i].data[idx] === '0' ? '0' : dataset.datasets[i].data[idx]) + '</td>';
        }
        html += '</tr>';
    });

    html += '</tr><tbody></table>';

    return html;
}

function sortdata(dataset, labels) {

    var list = [];
    for (var j = 0; j < dataset.length; j++)
        list.push({
            'data': dataset[j],
            'label': labels[j]
        });

    list.sort(function (a, b) {
        return ((a.data > b.data) ? -1 : ((a.data == b.data) ? 0 : 1));

    });


    return list;
}

function LineChart(carea, cdata, ctitle) {
    var options = {
        responsive: true,
        maintainAspectRatio: false,

        plugins: {
            colorschemes: {
                scheme: 'tableau.Classic10'
            }
        },


        legend: {
            display: true,
            position: 'top',
            labels: {
                boxWidth: 2,
                fontColor: "black",
                fontStyle: "italic",
                fontSize: 9,
                usePointStyle: true
            }
        },
        title: {
            display: true,
            position: 'bottom',
            text: ctitle,
            fontSize: 18,
            padding: 5,
            fontFamily: 'Calibri',
            fontStyle: 'bold',

        },
        scales: {
            xAxes: [{
                ticks: {
                    autoSkip: true,
                    maxRotation: 90,
                    minRotation: 50,
                    maxTicksLimit: 15,
                    fontStyle: "italic",
                },
                display: true,
                gridLines: {
                    display: true,
                    color: "#F0F0F0"
                },
            }],
            yAxes: [{
                display: true,
                gridLines: {
                    drawBorder: false,
                    color: "#E0E0E0"
                },
                ticks: {
                    min: 1

                }
            }]
        }
    };

    Chart.defaults.global.defaultFontFamily = "Calibri";
    Chart.defaults.global.defaultFontColor = "#1e272e";
    Chart.defaults.global.defaultFontSize = 12;
    Chart.defaults.global.defaultFontStyle = "normal";

    var mchart = new Chart(carea, {
        type: 'line',
        data: cdata,
        options: options
    });

    return mchart;
}

function BarChart(carea, cdata, ctitle) {
    var options = {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
            labels: {
                render: 'value',
                fontSize: 1,
            },
            colorschemes: {
                scheme: 'tableau.Classic10'
            }
        },

        legend: {
            display: true,
            position: 'top',
            labels: {
                boxWidth: 2,
                fontColor: "black",
                fontStyle: "italic",
                fontSize: 11,
                usePointStyle: true
            }
        },
        title: {
            display: true,
            position: 'bottom',
            text: ctitle,
            fontSize: 18,
            padding: 5,
            fontFamily: 'Calibri',
            fontStyle: 'bold',
        },
        tooltips: {
            mode: 'index',
            position: 'nearest',
            intersect: false,
            callbacks: {}
        },
        scales: {
            xAxes: [{
                ticks: {
                    autoSkip: false,
                    maxRotation: 90,
                    minRotation: 50,
                    fontStyle: "italic",
                    min: 0,
                },

                display: true,
                gridLines: {
                    display: true
                },
            }],
            yAxes: [{
                display: true,
                gridLines: {
                    drawBorder: true
                },
                ticks: {
                    min: 0,
                    beginAtZero: true,
                    fontStyle: "normal",

                }
            }]
        }

    };

    Chart.defaults.global.defaultFontFamily = "Calibri";
    Chart.defaults.global.defaultFontColor = "#1e272e";
    Chart.defaults.global.defaultFontSize = 12;
    Chart.defaults.global.defaultFontStyle = "normal";


    var mchart = new Chart(carea, {
        type: 'bar',
        data: cdata,
        options: options
    });


    return mchart;
}

function DoughnutChart(carea, cdata, ctitle) {
    var options = {
        responsive: true,
        maintainAspectRatio: false,
        legend: {
            display: true,
            position: 'top',
            labels: {
                boxWidth: 2,
                fontColor: "black",
                fontStyle: "italic",
                fontSize: 9,
                usePointStyle: true
            }
        },
        plugins: {
            colorschemes: {
                scheme: 'tableau.Classic10'
            }
        },
        animation: {
            animateScale: true,
            animateRotate: true
        },
        title: {
            display: true,
            position: 'bottom',
            text: ctitle,
            fontSize: 9,
            padding: 5,
            fontFamily: 'Calibri',
            fontStyle: 'bold',
        }

    };

    Chart.defaults.global.defaultFontFamily = "Calibri";
    Chart.defaults.global.defaultFontColor = "#1e272e";
    Chart.defaults.global.defaultFontSize = 12;
    Chart.defaults.global.defaultFontStyle = "normal";

    var mchart = new Chart(carea, {
        type: 'doughnut',
        data: cdata,
        options: options
    });

    return mchart;
}


function PieChart(carea, cdata, ctitle) {
    var options = {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
            labels: [

                {
                    render: 'percentage',
                    overlap: false,
                    fontColor: '#fff',
                    precision: 2
                }
            ],
            colorschemes: {
                scheme: 'tableau.Classic10'
            }
        },
        legend: {
            display: true,
            position: 'top',
            labels: {
                boxWidth: 2,
                fontColor: "black",
                fontStyle: "italic",
                fontSize: 9,
                usePointStyle: true
            }
        },
        animation: {
            animateScale: true,
            animateRotate: true
        },
        title: {
            display: true,
            position: 'bottom',
            text: ctitle,
            fontSize: 9,
            padding: 5,
            fontFamily: 'Calibri',
            fontStyle: 'bold',
        },
        labels: {
            render: 'percentage',
            fontColor: function (data) {
                var rgb = hexToRgb(data.dataset.backgroundColor[data.index]);
                var threshold = 140;
                var luminance = 0.299 * rgb.r + 0.587 * rgb.g + 0.114 * rgb.b;
                return luminance > threshold ? 'black' : 'white';
            },
            precision: 2
        }

    };

    Chart.defaults.global.defaultFontFamily = "Calibri";
    Chart.defaults.global.defaultFontColor = "#1e272e";
    Chart.defaults.global.defaultFontSize = 12;
    Chart.defaults.global.defaultFontStyle = "normal";

    var mchart = new Chart(carea, {
        type: 'pie',
        data: cdata,
        options: options
    });

    return mchart;
}

function hBarChart(carea, cdata, ctitle) {
    var options = {
        responsive: true,
        maintainAspectRatio: false,
        legend: {
            display: true,
            position: 'top',
            labels: {
                boxWidth: 2,
                fontColor: "black",
                fontStyle: "italic",
                fontSize: 9,
                usePointStyle: true
            }
        },
        plugins: {
            labels: {
                render: 'value',
                fontSize: 9,
            },
            colorschemes: {
                scheme: 'tableau.Classic10'
            }
        },
        title: {
            display: true,
            position: 'bottom',
            text: ctitle,
            fontSize: 9,
            padding: 5,
            fontFamily: 'Calibri',
            fontStyle: 'bold',
        },

        scales: {
            xAxes: [{
                display: true,
                ticks: {
                    autoSkip: true,
                    maxRotation: 0,
                    minRotation: 0,
                    maxTicksLimit: 5,
                    fontStyle: "italic",
                },
                gridLines: {
                    display: true
                },
            }],
            yAxes: [{
                display: true,
                gridLines: {
                    drawBorder: true
                },
                ticks: {
                    beginAtZero: true,


                }
            }]
        }
    };

    Chart.defaults.global.defaultFontFamily = "Calibri";
    Chart.defaults.global.defaultFontColor = "#1e272e";
    Chart.defaults.global.defaultFontSize = 12;
    Chart.defaults.global.defaultFontStyle = "normal";

    var mchart = new Chart(carea, {
        type: 'horizontalBar',
        data: cdata,
        options: options
    });

    return mchart;
}


function PolarChart(carea, cdata, ctitle) {
    var options = {
        responsive: true,
        maintainAspectRatio: false,
        plugins: {
            labels: [{
                    render: 'label',
                    fontColor: '#000',
                    fontColor: "black",
                    fontStyle: "italic",
                    fontSize: 9,
                    position: 'outside'
                },
                {
                    render: 'percentage',
                    overlap: false,
                    fontColor: '#fff',
                    precision: 2
                }
            ],
            colorschemes: {
                scheme: 'tableau.Classic10'
            }
        },
        legend: {
            display: true,
            position: 'top',
            labels: {
                boxWidth: 2,
                fontColor: "black",
                fontStyle: "italic",
                fontSize: 9,
                usePointStyle: true
            }
        },
        title: {
            display: true,
            position: 'bottom',
            text: ctitle,
            fontSize: 18,
            padding: 5,
            fontFamily: 'Calibri',
            fontStyle: 'bold',
        },

        scales: {
            xAxes: [{
                display: true,
                ticks: {
                    autoSkip: true,
                    maxRotation: 0,
                    minRotation: 0,
                    maxTicksLimit: 5,
                    fontStyle: "italic",
                },
                gridLines: {
                    display: true
                },
            }],
            yAxes: [{
                display: true,
                gridLines: {
                    drawBorder: true
                },
                ticks: {
                    beginAtZero: true,

                }
            }]
        }
    };

    Chart.defaults.global.defaultFontFamily = "Calibri";
    Chart.defaults.global.defaultFontColor = "#1e272e";
    Chart.defaults.global.defaultFontSize = 12;
    Chart.defaults.global.defaultFontStyle = "normal";

    var mchart = new Chart(carea, {
        type: 'polarArea',
        data: cdata,
        options: options
    });

    return mchart;
}

function upload() {

    $(document).ready(function () {
        var btnUpload = $('#upload');
        var status = $('#status');
        new AjaxUpload(btnUpload, {
            action: "scripts/upload-file.php",
            name: 'uploadfile',
            onSubmit: function (file, ext) {
                if (!(ext && /^(csv)$/.test(ext))) {

                    status.val('Only CSV File');

                    return false;
                }

                status.val('............');


            },
            onComplete: function (file, response) {

                status.val(file);

            }
        });

    });

}


function googleTranslateElementInit() {
    new google.translate.TranslateElement({
        pageLanguage: 'en',
        layout: google.translate.TranslateElement.InlineLayout.SIMPLE,
        autoDisplay: false
    }, 'google_translate_element');
}

function translateLanguage(lang) {
    googleTranslateElementInit();
    var $frame = $('.goog-te-menu-frame:first');
    if (!$frame.size()) {
        alert("Error: Could not find Google translate frame.");
        return false;
    }
    $frame.contents().find('.goog-te-menu2-item span.text:contains(' + lang + ')').get(0).click();
    return false;
}