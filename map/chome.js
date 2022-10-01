function fhreq() {
    $.ajax({
        url: "datahome.php?q=f1req_ss1",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            setTimeout(function () {

                //var taxon = ["An. gambiae s.l.","An. funestus","Culex sp.","Mansonia sp."];
                var taxon = [];
                var tx1 = [];
                var tx2 = [];
                var tx3 = [];
                var tx4 = [];
                var tx5 = [];
                var tx6 = [];

                for (var i in data) {
                    taxon.push(italicize(data[i].TaxonName));
                    tx1.push(data[i].TotalMale);
                    tx2.push(data[i].Unfed);
                    tx3.push(data[i].Fed);
                    tx4.push(data[i].PartlyFed);
                    tx5.push(data[i].Gravid);
                    tx6.push(data[i].TotalFemale);
                }

                var chartdata = {
                    labels: taxon,
                    datasets: [{
                            label: 'Total female',
                            backgroundColor: randomColor(),
                            hoverBorderColor: randomColor(),
                            data: tx6
                        },

                        {
                            label: 'Unfed female',
                            backgroundColor: randomColor(),
                            hoverBorderColor: randomColor(),
                            data: tx2
                        },

                        {
                            label: 'Fed female',
                            backgroundColor: randomColor(),
                            hoverBorderColor: randomColor(),
                            data: tx3
                        },

                        {
                            label: 'Partly fed female',
                            backgroundColor: randomColor(),
                            hoverBorderColor: randomColor(),
                            data: tx4
                        },

                        {
                            label: 'Gravid female',
                            backgroundColor: randomColor(),
                            hoverBorderColor: randomColor(),
                            data: tx5
                        },

                        {
                            label: 'Total male',
                            backgroundColor: randomColor(),
                            hoverBorderColor: randomColor(),
                            data: tx1
                        }
                    ]
                };


                if (data.length == 0) {
                    $('#loadnonefhss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
                } else {
                    $('#tblhome').html(tabledata(chartdata));
                }

            }, 0);

        },
        error: function (data) {
            $('#loadnonefhss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            console.log("Request fhreq error");

        },
        complete: function (data) {
            $('.loader22').fadeOut();
        },

        beforeSend: function (data) {

            fhreq_ss2();

            $('#load3').html('<div class="loader22" style="height:100px;"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div></div></div>');

            $("html, body").animate({
                scrollTop: $(
                    'html, body').get(0).scrollHeight
            }, 500);

        }

    });
}


function fhreq_ss2() {
    $.ajax({
        url: "data2.php?q=f7req_ss2",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var tx = [];
            var l1l2 = [];
            var l3l4 = [];
            var l1 = [];
            var l2 = [];
            var l3 = [];
            var l4 = [];


            for (var i in data) {
                tx.push(data[i].TaxonName);
                l1l2.push(data[i].L1L2);
                l3l4.push(data[i].L3L4);
                l1.push(data[i].L1);
                l2.push(data[i].L2);
                l3.push(data[i].L3);
                l4.push(data[i].L4);
            }

            var chartdata = {
                labels: tx,
                datasets: [{
                        label: 'L1',
                        fill: false,

                        data: l1
                    },
                    {
                        label: 'L2',
                        fill: false,

                        data: l2
                    },
                    {
                        label: 'L3',
                        fill: false,

                        data: l3
                    },
                    {
                        label: 'L4',
                        fill: false,

                        data: l4
                    },
                    {
                        label: 'L1L2',
                        fill: false,

                        data: l1l2
                    },
                    {
                        label: 'L3L4',
                        fill: false,

                        data: l3l4
                    }
                ]
            };



            $('#tblhomess2').html(tabledata(chartdata));

            if (data.length == 0) {
                $('#loadnonefhss2').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }

        },
        error: function (data) {
            $('#loadnonefhss2').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            console.log("Request fhss2req error");
            console.log(data);
        },
        complete: function (data) {
            console.log("Request fhss2req done");
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadhomefhss2').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');

            fhreq_ss4("B");
        }


    });
}


var barGraph;

function fhreq_ss4(type) {


    $.ajax({
        url: "data2.php?q=f4req_ss4",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {

            var species = [];
            var total = [];

            for (var i in data) {
                species.push(data[i].species_name);
                total.push(data[i].totalnumber);
            }

            var chartdata = {
                labels: species,
                datasets: [{
                    label: "Total Number",
                    fill: false,
                    data: total,
                    backgroundColor: [
                        randomColor(),
                        randomColor()
                    ],

                }]
            };


            var canvas = $("#canvashomess4");


            if (barGraph) {
                barGraph.destroy();
            };


            if (type == "B") {


                barGraph = new Chart(canvas, {
                    type: 'horizontalBar',
                    maintainAspectRatio: false,
                    animation: {
                        onComplete: function (animation) {}
                    },

                    data: chartdata,
                    options: {
                        responsive: true,
                        title: {
                            display: false,
                            fontSize: 17,
                            position: 'bottom',
                            text: ""
                        },
                        legend: {
                            display: false,
                            position: 'top',

                        },
                        plugins: {
                            labels: {
                                render: 'value',
                                fontSize: 12,
                            },
                            colorschemes: {
                                scheme: 'tableau.Classic10'
                            }
                        },
                        scales: {
                            xAxes: [{
                                display: true,
                                stacked: true,
                                gridLines: {
                                    drawBorder: false,
                                    color: "#FFFFFF"
                                },
                                stacked: true,
                                scaleLabel: {
                                    display: true,
                                    fontSize: 15,
                                    labelString: 'Total number'

                                }
                            }],
                            yAxes: [{
                                display: true,
                                gridLines: {
                                    drawBorder: false,
                                    color: "#E0E0E0"
                                },

                                stacked: true,
                                scaleLabel: {
                                    display: true,
                                    fontSize: 15,
                                    position: 'bottom',
                                    labelString: 'Species'
                                }
                            }]
                        }

                    }

                });





            } else {


                barGraph = new Chart(canvas, {
                    type: 'pie',
                    maintainAspectRatio: false,
                    animation: {
                        onComplete: function (animation) {}
                    },

                    data: chartdata,
                    options: {
                        responsive: true,
                        title: {
                            display: false,
                            fontSize: 17,
                            position: 'bottom',
                            text: ""
                        },
                        legend: {
                            display: true,
                            position: 'left',

                        }

                    }

                });




            }


            if (data.length == 0) {
                $('#loadnonefhss4').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }

        },
        error: function (data) {
            $('#loadnonefhss4').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            console.log("Request fhss4req error");
            console.log(data);
        },
        complete: function (data) {
            console.log("Request fhss4req done");
            console.log(data);
            $('.loader').fadeOut();


        },
        beforeSend: function (data) {

            $('#loadhomefhss4').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');

        }


    });
}

$(document).ready(function () {

    var homelink = window.location.pathname.split('/');
    if (homelink[homelink.length - 1] === 'home.php') {
        fhreq();
    }

});