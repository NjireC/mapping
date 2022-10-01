function f1req_ss1(ctype) {
    $.ajax({
        url: "data2.php?q=f1req_ss1",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            //var taxon = ["An. gambiae s.l","An. funestus s.l","Culex sp.","Mansonia sp."];
            var taxon = [];
            var tx1 = [];
            var tx2 = [];
            var tx3 = [];
            var tx4 = [];
            var tx5 = [];
            var tx6 = [];

            for (var i in data) {
                taxon.push(data[i].TaxonName);
                tx1.push(data[i].TotalMale);
                tx2.push(data[i].Unfed);
                tx3.push(data[i].Fed);
                tx4.push(data[i].PartlyFed);
                tx5.push(data[i].Gravid);
                tx6.push(data[i].TotalFemale);
            }

            var chartdata = {
                labels: taxon,
                datasets: [

                    {
                        label: 'Total Female',
                        backgroundColor: "#c85200",
                        hoverBorderColor: "#c85200",
                        data: tx6
                    },


                    {
                        label: 'Total Male',
                        backgroundColor: "#5fa2ce",
                        hoverBorderColor: "#5fa2ce",
                        data: tx1
                    }

                ]
            };

            var type = ctype;

            if (type == "B") {

                $("#canvasf1ss1").show();
                $("#canvasf1ss1l").hide();
                $("#canvasf1ss1p").hide();
                $("#canvasf1ss1d").hide();
                var canvas = $("#canvasf1ss1");
                hBarChart(canvas, chartdata, "Mosquito Population Summary");

            } else if (type == "L") {

                $("#canvasf1ss1").hide();
                $("#canvasf1ss1l").show();
                $("#canvasf1ss1p").hide();
                $("#canvasf1ss1d").hide();
                var canvas = $("#canvasf1ss1l");
                LineChart(canvas, chartdata, "Mosquito Population Summary");


            } else if (type == "P") {

                $("#canvasf1ss1").hide();
                $("#canvasf1ss1l").hide();
                $("#canvasf1ss1p").show();
                $("#canvasf1ss1d").hide();
                var canvas = $("#canvasf1ss1p");
                PieChart(canvas, chartdata, "Mosquito Population Summary");

            } else if (type == "D") {

                $("#canvasf1ss1").hide();
                $("#canvasf1ss1l").hide();
                $("#canvasf1ss1p").hide();
                $("#canvasf1ss1d").show();
                var canvas = $("#canvasf1ss1d");
                PolarChart(canvas, chartdata, "Mosquito Population Summary");


            }


            $('#tblf1ss1').html(tabledata(chartdata));

            if (data.length == 0) {
                $('#loadnonef1ss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }

        },
        error: function (data) {
            $('#loadnonef1ss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            console.log("Request f1ss1 error");
            console.log(data);
        },
        complete: function (data) {
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf1ss1').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div></div></div>');
        }

    });
}

function f2req_ss1(ctype) {
    $.ajax({
        url: "data2.php?q=f2req_ss1",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);

            var taxon = [];
            var tx1 = [];
            var tx2 = [];
            var tx3 = [];
            var tx4 = [];
            var tx5 = [];
            var tx6 = [];

            for (var i in data) {
                taxon.push(data[i].TaxonName);
                tx1.push(data[i].TotalMale);
                tx2.push(data[i].Unfed);
                tx3.push(data[i].Fed);
                tx4.push(data[i].PartlyFed);
                tx5.push(data[i].Gravid);
                tx6.push(data[i].TotalFemale);
            }

            var chartdata = {
                labels: taxon,
                datasets: [

                    {
                        label: 'TotalFemale',
                        backgroundColor: "#c85200",
                        hoverBorderColor: "#c85200",
                        data: tx6
                    },

                    {
                        label: 'Total Male',
                        backgroundColor: "#5fa2ce",
                        hoverBorderColor: "#5fa2ce",
                        data: tx1
                    }

                ]
            };

            var type = ctype;

            if (type == "B") {

                $("#canvasf2ss1").show();
                $("#canvasf2ss1l").hide();
                $("#canvasf2ss1p").hide();
                $("#canvasf2ss1d").hide();
                var canvas = $("#canvasf2ss1");
                hBarChart(canvas, chartdata, "Mosquito Population Summary");

            } else if (type == "L") {

                $("#canvasf2ss1").hide();
                $("#canvasf2ss1l").show();
                $("#canvasf2ss1p").hide();
                $("#canvasf2ss1d").hide();
                var canvas = $("#canvasf2ss1l");
                LineChart(canvas, chartdata, "Mosquito Population Summary");


            } else if (type == "P") {

                $("#canvasf2ss1").hide();
                $("#canvasf2ss1l").hide();
                $("#canvasf2ss1p").show();
                $("#canvasf2ss1d").hide();
                var canvas = $("#canvasf2ss1");
                PieChart(canvas, chartdata, "Mosquito Population Summary");

            } else if (type == "D") {

                $("#canvasf2ss1").hide();
                $("#canvasf2ss1l").hide();
                $("#canvasf2ss1p").hide();
                $("#canvasf2ss1d").show();
                var canvas = $("#canvasf2ss1d");
                PolarChart(canvas, chartdata, "Mosquito Population Summary");
            }

            $('#tblf2ss1').html(tabledata(chartdata));

            if (data.length == 0) {
                $('#loadnonef2ss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }

        },
        error: function (data) {
            $('#loadnonef2ss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            console.log("Request f2ss1 error");
            console.log(data);
        },
        complete: function (data) {
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf2ss1').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div></div></div>');

        }

    });
}

function f3req_ss1(ctype) {
    $.ajax({
        url: "data2.php?q=f3req_ss1",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var dt = [];
            var tx1 = [];
            var tx2 = [];
            var tx3 = [];

            for (var i in data) {
                dt.push(data[i].DT);
                tx1.push(data[i].An_gambiae);
                tx2.push(data[i].An_funestus);
                tx3.push(data[i].Aedes_sp);
            }

            var chartdata = {
                labels: dt,
                datasets: custom_taxon(data)
            };


            var type = ctype;

            if (type == "B") {

                $("#canvasf3ss1").show();
                $("#canvasf3ss1l").hide();
                $("#canvasf3ss1p").hide();
                $("#canvasf3ss1d").hide();
                var canvas = $("#canvasf3ss1");
                BarChart(canvas, chartdata, "Female Mosquito Caught ");

            } else if (type == "L") {

                $("#canvasf3ss1").hide();
                $("#canvasf3ss1l").show();
                $("#canvasf3ss1p").hide();
                $("#canvasf3ss1d").hide();
                var canvas = $("#canvasf3ss1l");
                LineChart(canvas, chartdata, " Female Mosquito Caught ");


            } else if (type == "P") {

                $("#canvasf3ss1").hide();
                $("#canvasf3ss1l").hide();
                $("#canvasf3ss1p").show();
                $("#canvasf3ss1d").hide();
                var canvas = $("#canvasf3ss1p");
                PieChart(canvas, chartdata, " Female Mosquito Caught ");

            } else if (type == "D") {

                $("#canvasf3ss1").hide();
                $("#canvasf3ss1l").hide();
                $("#canvasf3ss1p").hide();
                $("#canvasf3ss1d").show();
                var canvas = $("#canvasf3ss1d");
                PolarChart(canvas, chartdata, " Female Mosquito Caught ");


            }


            $('#tblf3ss1').html(tabledata(chartdata));

            if (data.length == 0) {
                $('#loadnonef3ss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }
        },
        error: function (data) {
            $('#loadnonef3ss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            console.log("Request f3ss1 error");
            console.log(data);
        },
        complete: function (data) {
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf3ss1').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');
        }


    });
}

function f4req_ss1(ctype) {
    $.ajax({
        url: "data2.php?q=f4req_ss1",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var dt = [];
            var tx1 = [];
            var tx2 = [];
            var tx3 = [];

            for (var i in data) {
                dt.push(data[i].weekyear);
                tx1.push(data[i].An_gambiae);
                tx2.push(data[i].An_funestus);
                tx3.push(data[i].Aedes_sp);
            }

            var chartdata = {
                labels: dt,
                datasets: custom_taxon(data)
            };


            //var canvas = $("#canvas1");

            //LineChart(canvas, chartdata,"Summary");

            var type = ctype;

            if (type == "B") {

                $("#canvasf4ss1").show();
                $("#canvasf4ss1l").hide();
                $("#canvasf4ss1p").hide();
                $("#canvasf4ss1d").hide();
                var canvas = $("#canvasf4ss1");
                BarChart(canvas, chartdata, " ");

            } else if (type == "L") {

                $("#canvasf4ss1").hide();
                $("#canvasf4ss1l").show();
                $("#canvasf4ss1p").hide();
                $("#canvasf4ss1d").hide();
                var canvas = $("#canvasf4ss1l");
                LineChart(canvas, chartdata, "");


            } else if (type == "P") {

                $("#canvasf4ss1").hide();
                $("#canvasf4ss1l").hide();
                $("#canvasf4ss1p").show();
                $("#canvasf4ss1d").hide();
                var canvas = $("#canvasf4ss1p");
                PieChart(canvas, chartdata, "");

            } else if (type == "D") {

                $("#canvasf4ss1").hide();
                $("#canvasf4ss1l").hide();
                $("#canvasf4ss1p").hide();
                $("#canvasf4ss1d").show();
                var canvas = $("#canvasf4ss1d");
                PolarChart(canvas, chartdata, "");


            }


            $('#tblf4ss1').html(tabledata(chartdata));

            if (data.length == 0) {
                $('#loadnonef4ss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }

        },
        error: function (data) {
            $('#loadnonef4ss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            console.log("Request f4ss1 error");
            console.log(data);
        },
        complete: function (data) {

            console.log("Request f4ss1 done");
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf4ss1').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');

        }

    });
}

function f5req_ss1(ctype) {
    $.ajax({
        url: "data2.php?q=f5req_ss1",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var dt = [];
            var tx1 = [];
            var tx2 = [];
            var tx3 = [];

            for (var i in data) {
                dt.push(data[i].month);
                tx1.push(data[i].An_gambiae);
                tx2.push(data[i].An_funestus);
                tx3.push(data[i].Aedes_sp);
            }


            var chartdata = {
                labels: dt,
                datasets: custom_taxon(data)
            };


            //var canvas = $("#canvas1");

            //LineChart(canvas, chartdata,"Summary");


            var type = ctype;

            if (type == "B") {

                $("#canvasf5ss1").show();
                $("#canvasf5ss1l").hide();
                $("#canvasf5ss1p").hide();
                $("#canvasf5ss1d").hide();
                var canvas = $("#canvasf5ss1");
                BarChart(canvas, chartdata, "");

            } else if (type == "L") {

                $("#canvasf5ss1").hide();
                $("#canvasf5ss1l").show();
                $("#canvasf5ss1p").hide();
                $("#canvasf5ss1d").hide();
                var canvas = $("#canvasf5ss1l");
                LineChart(canvas, chartdata, "");


            } else if (type == "P") {

                $("#canvasf5ss1").hide();
                $("#canvasf5ss1l").hide();
                $("#canvasf5ss1p").show();
                $("#canvasf5ss1d").hide();
                var canvas = $("#canvasf5ss1p");
                PieChart(canvas, chartdata, " ");

            } else if (type == "D") {

                $("#canvasf5ss1").hide();
                $("#canvasf5ss1l").hide();
                $("#canvasf5ss1p").hide();
                $("#canvasf5ss1d").show();
                var canvas = $("#canvasf5ss1d");
                PolarChart(canvas, chartdata, " ");

            }


            $('#tblf5ss1').html(tabledata(chartdata));

            if (data.length == 0) {
                $('#loadnonef5ss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }

        },
        error: function (data) {
            $('#loadnonef5ss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            console.log("Request f5ss1 error");
            console.log(data);
        },
        complete: function (data) {

            console.log("Request f5ss1 done");
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf5ss1').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');
        }

    });
}

function f6req_ss1(ctype) {
    $.ajax({
        url: "data2.php?q=f6req_ss1",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var dt = [];
            var tx1 = [];
            var tx2 = [];
            var tx3 = [];

            for (var i in data) {
                dt.push(data[i].DT);
            }

            var chartdata = {
                labels: dt,
                datasets: custom_taxonc(data)
            };


            var type = ctype;

            if (type == "B") {

                $("#canvasf6ss1").show();
                $("#canvasf6ss1l").hide();
                $("#canvasf6ss1p").hide();
                $("#canvasf6ss1d").hide();
                var canvas = $("#canvasf6ss1");
                BarChart(canvas, chartdata, "Female Mosquito Caught ");

            } else if (type == "L") {

                $("#canvasf6ss1").hide();
                $("#canvasf6ss1l").show();
                $("#canvasf6ss1p").hide();
                $("#canvasf6ss1d").hide();
                var canvas = $("#canvasf6ss1l");
                LineChart(canvas, chartdata, " Female Mosquito Caught ");


            } else if (type == "P") {

                $("#canvasf6ss1").hide();
                $("#canvasf6ss1l").hide();
                $("#canvasf6ss1p").show();
                $("#canvasf6ss1d").hide();
                var canvas = $("#canvasf6ss1p");
                PieChart(canvas, chartdata, " Female Mosquito Caught ");

            } else if (type == "D") {

                $("#canvasf6ss1").hide();
                $("#canvasf6ss1l").hide();
                $("#canvasf6ss1p").hide();
                $("#canvasf6ss1d").show();
                var canvas = $("#canvasf6ss1d");
                PolarChart(canvas, chartdata, " Female Mosquito Caught ");


            }


            $('#tblf6ss1').html(tabledata(chartdata));

            if (data.length == 0) {
                $('#loadnonef6ss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }

        },
        error: function (data) {
            $('#loadnonef6ss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            console.log("Request f6ss1 error");
            console.log(data);
        },
        complete: function (data) {
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf6ss1').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');
            //f4req('B');
        }


    });
}

function f7req_ss1(ctype) {
    $.ajax({
        url: "data2.php?q=f7req_ss1",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var dt = [];


            for (var i in data) {
                dt.push(data[i].weekyear);

            }

            var chartdata = {
                labels: dt,
                datasets: custom_taxonc(data)
            };



            var type = ctype;

            if (type == "B") {

                $("#canvasf7ss1").show();
                $("#canvasf7ss1l").hide();
                $("#canvasf7ss1p").hide();
                $("#canvasf7ss1d").hide();
                var canvas = $("#canvasf7ss1");
                BarChart(canvas, chartdata, " ");

            } else if (type == "L") {

                $("#canvasf7ss1").hide();
                $("#canvasf7ss1l").show();
                $("#canvasf7ss1p").hide();
                $("#canvasf7ss1d").hide();
                var canvas = $("#canvasf7ss1l");
                LineChart(canvas, chartdata, "");


            } else if (type == "P") {

                $("#canvasf7ss1").hide();
                $("#canvasf7ss1l").hide();
                $("#canvasf7ss1p").show();
                $("#canvasf7ss1d").hide();
                var canvas = $("#canvasf7ss1p");
                PieChart(canvas, chartdata, "");

            } else if (type == "D") {

                $("#canvasf7ss1").hide();
                $("#canvasf7ss1l").hide();
                $("#canvasf7ss1p").hide();
                $("#canvasf7ss1d").show();
                var canvas = $("#canvasf7ss1d");
                PolarChart(canvas, chartdata, "");


            }


            $('#tblf7ss1').html(tabledata(chartdata));

            if (data.length == 0) {
                $('#loadnonef7ss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }

        },
        error: function (data) {
            $('#loadnonef7ss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            console.log("Request f7ss1 error");
            console.log(data);
        },
        complete: function (data) {

            console.log("Request f7ss1 done");
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf7ss1').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');
            
        }

    });
}

function f8req_ss1(ctype) {
    $.ajax({
        url: "data2.php?q=f8req_ss1",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var dt = [];
            var tx1 = [];
            var tx2 = [];
            var tx3 = [];

            for (var i in data) {
                dt.push(data[i].month);
            }

            var chartdata = {
                labels: dt,
                datasets: custom_taxonc(data)
            };

            var type = ctype;

            if (type == "B") {

                $("#canvasf8ss1").show();
                $("#canvasf8ss1l").hide();
                $("#canvasf8ss1p").hide();
                $("#canvasf8ss1d").hide();
                var canvas = $("#canvasf8ss1");
                BarChart(canvas, chartdata, "");

            } else if (type == "L") {

                $("#canvasf8ss1").hide();
                $("#canvasf8ss1l").show();
                $("#canvasf8ss1p").hide();
                $("#canvasf8ss1d").hide();
                var canvas = $("#canvasf8ss1l");
                LineChart(canvas, chartdata, "");


            } else if (type == "P") {

                $("#canvasf8ss1").hide();
                $("#canvasf8ss1l").hide();
                $("#canvasf8ss1p").show();
                $("#canvasf8ss1d").hide();
                var canvas = $("#canvasf8ss1p");
                PieChart(canvas, chartdata, " ");

            } else if (type == "D") {

                $("#canvasf8ss1").hide();
                $("#canvasf8ss1l").hide();
                $("#canvasf8ss1p").hide();
                $("#canvasf8ss1d").show();
                var canvas = $("#canvasf8ss1d");
                PolarChart(canvas, chartdata, " ");


            }


            $('#tblf8ss1').html(tabledata(chartdata));

            if (data.length == 0) {
                $('#loadnonef8ss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }

        },
        error: function (data) {
            $('#loadnonef8ss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            console.log("Request f8ss1 error");
            console.log(data);
        },
        complete: function (data) {

            console.log("Request f8ss1 done");
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf8ss1').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');
           
        }

    });
}

function f9req_ss1(ctype) {
    $.ajax({
        url: "data2.php?q=f9req_ss1",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var dt = [];


            for (var i in data) {
                dt.push(data[i].EA);

            }

            var chartdata = {
                labels: dt,
                datasets: custom_taxon(data)

            };

            //var canvas = $("#canvas4");

            //	hBarChart(canvas, chartdata,"Mosquito Population Summary by EA");

            var type = ctype;

            if (type == "B") {

                $("#canvasf9ss1").show();
                $("#canvasf9ss1l").hide();
                $("#canvasf9ss1p").hide();
                $("#canvasf9ss1d").hide();
                var canvas = $("#canvasf9ss1");
                BarChart(canvas, chartdata, "Mosquito Population Summary by site");

            } else if (type == "L") {

                $("#canvasf9ss1").hide();
                $("#canvasf9ss1l").show();
                $("#canvasf9ss1p").hide();
                $("#canvasf9ss1d").hide();
                var canvas = $("#canvasf9ss1l");
                LineChart(canvas, chartdata, "Mosquito Population Summary by site");


            } else if (type == "P") {

                $("#canvasf9ss1").hide();
                $("#canvasf9ss1l").hide();
                $("#canvasf9ss1p").show();
                $("#canvasf9ss1d").hide();
                var canvas = $("#canvasf9ss1p");
                PieChart(canvas, chartdata, "Mosquito Population Summary by site");

            } else if (type == "D") {

                $("#canvasf9ss1").hide();
                $("#canvasf9ss1l").hide();
                $("#canvasf9ss1p").hide();
                $("#canvasf9ss1d").show();
                var canvas = $("#canvasf9ss1d");
                PolarChart(canvas, chartdata, "Mosquito Population Summary by site");


            }


            $('#tblf9ss1').html(tabledata(chartdata));

            if (data.length == 0) {
                $('#loadnonef9ss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }


        },
        error: function (data) {
            $('#loadnonef9ss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            console.log("Request f9ss1 error");
            console.log(data);
        },
        complete: function (data) {
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf9ss1').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div></div></div>');

        }
    });
}

function f10req_ss1(ctype) {
    $.ajax({
        url: "data2.php?q=f10req_ss1",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);

            var tx1 = [];
            var labelname = ["Total Male", "Unfed", "Fed", "PartlyFed", "Gravid"];

            for (var i in data) {
                tx1.push(parseInt(data[i].TotalMale));
                tx1.push(parseInt(data[i].Unfed));
                tx1.push(parseInt(data[i].Fed));
                tx1.push(parseInt(data[i].PartlyFed));
                tx1.push(parseInt(data[i].Gravid));

            }


            var dataset = tx1;
            var labels = labelname;

            var list = [];

            list = sortdata(dataset, labels);

            for (var k = 0; k < list.length; k++) {
                dataset[k] = list[k].data;
                labels[k] = list[k].label;
            }


            var chartdata = {
                datasets: [{
                    data: dataset

                }],
                labels: labels
            };

            //var canvas = $("#canvas5");

            //PieChart(canvas, chartdata,"Summary");


            var type = ctype;

            if (type == "B") {

                $("#canvasf10ss1").show();
                $("#canvasf10ss1l").hide();
                $("#canvasf10ss1p").hide();
                $("#canvasf10ss1d").hide();
                var canvas = $("#canvasf10ss1");
                BarChart(canvas, chartdata, "Summary");

            } else if (type == "L") {

                $("#canvasf10ss1").hide();
                $("#canvasf10ss1l").show();
                $("#canvasf10ss1p").hide();
                $("#canvasf10ss1d").hide();
                var canvas = $("#canvasf10ss1l");
                LineChart(canvas, chartdata, "Summary");


            } else if (type == "P") {

                $("#canvasf10ss1").hide();
                $("#canvasf10ss1l").hide();
                $("#canvasf10ss1p").show();
                $("#canvasf10ss1d").hide();
                var canvas = $("#canvasf10ss1p");
                PieChart(canvas, chartdata, "Summary");

            } else if (type == "D") {

                $("#canvasf10ss1").hide();
                $("#canvasf10ss1l").hide();
                $("#canvasf10ss1p").hide();
                $("#canvasf10ss1d").show();
                var canvas = $("#canvasf10ss1d");
                PolarChart(canvas, chartdata, "Summary");


            }

            $('#tblf10ss1').html(tabledata(chartdata));

            if (data.length == 0) {
                $('#loadnonef10ss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }


        },
        error: function (data) {
            $('#loadnonef10ss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            console.log("Request f10ss1 error");
            console.log(data);
        },
        complete: function (data) {
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf10ss1').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div></div></div>');
        }
    });
}

function f11req_ss1(ctype) {
    $.ajax({
        url: "data2.php?q=f11req_ss1",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);

            var tx1 = [];
            var labelname = ["Total Male", "Unfed", "Fed", "PartlyFed", "Gravid"];

            for (var i in data) {
                tx1.push(parseInt(data[i].TotalMale));
                tx1.push(parseInt(data[i].Unfed));
                tx1.push(parseInt(data[i].Fed));
                tx1.push(parseInt(data[i].PartlyFed));
                tx1.push(parseInt(data[i].Gravid));

            }


            var dataset = tx1;
            var labels = labelname;

            var list = [];

            list = sortdata(dataset, labels);

            for (var k = 0; k < list.length; k++) {
                dataset[k] = list[k].data;
                labels[k] = list[k].label;
            }


            var chartdata = {
                datasets: [{
                    data: dataset

                }],
                labels: labels
            };

    

            var type = ctype;

            if (type == "B") {

                $("#canvasf11ss1").show();
                $("#canvasf11ss1l").hide();
                $("#canvasf11ss1p").hide();
                $("#canvasf11ss1d").hide();
                var canvas = $("#canvasf11ss1");
                BarChart(canvas, chartdata, "Summary");

            } else if (type == "L") {

                $("#canvasf11ss1").hide();
                $("#canvasf11ss1l").show();
                $("#canvasf11ss1p").hide();
                $("#canvasf11ss1d").hide();
                var canvas = $("#canvasf11ss1l");
                LineChart(canvas, chartdata, "Summary");


            } else if (type == "P") {

                $("#canvasf11ss1").hide();
                $("#canvasf11ss1l").hide();
                $("#canvasf11ss1p").show();
                $("#canvasf11ss1d").hide();
                var canvas = $("#canvasf11ss1p");
                PieChart(canvas, chartdata, "Summary");

            } else if (type == "D") {

                $("#canvasf11ss1").hide();
                $("#canvasf11ss1l").hide();
                $("#canvasf11ss1p").hide();
                $("#canvasf11ss1d").show();
                var canvas = $("#canvasf11ss1d");
                PolarChart(canvas, chartdata, "Summary");


            }

        
            $('#tblf11ss1').html(tabledata(chartdata));

            if (data.length == 0) {
                $('#loadnonef11ss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }

        },
        error: function (data) {
            $('#loadnonef11ss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            console.log("Request f11ss1 error");
            console.log(data);
        },
        complete: function (data) {
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf11ss1').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div></div></div>');

        }
    });
}

//biting rate SS1

function f12req_ss1(ctype) {
    $.ajax({
        url: "data2.php?q=f12req_ss1",
        method: "GET",

        dataType: 'json',
        success: function (data) {
            console.log(data);
                     var time = [];
                     var biting = [];

                    for (var i in data) {
                        time.push(data[i].TimeRange);
                        biting.push(data[i].bitingrate);
                    }

                    var chartdata = {
                        labels: time,
                        datasets: [
                            {
                                label: 'Hourly Biting Rate',
                                fill: false,
                                backgroundColor: '#49e2ff',
                                borderColor: '#46d5f1',
                                hoverBackgroundColor: '#CCCCCC',
                                hoverBorderColor: '#666666',
                                data: biting
                            }
                        ]
                    };


            var type = ctype;

            if (type == "B") {

                $("#canvasf12ss1").show();
                $("#canvasf12ss1l").hide();
                $("#canvasf12ss1p").hide();
                $("#canvasf12ss1d").hide();
                var canvas = $("#canvasf12ss1");
                BarChart(canvas, chartdata, "Hourly Biting Rate");

            } 
            if (type == "L") {

                $("#canvasf12ss1").hide();
                $("#canvasf12ss1l").show();
                $("#canvasf12ss1p").hide();
                $("#canvasf12ss1d").hide();
                var canvas = $("#canvasf12ss1l");
                LineChart(canvas, chartdata, " Hourly Biting Rate");


            } else if (type == "P") {

                $("#canvasf12ss1").hide();
                $("#canvasf12ss1l").hide();
                $("#canvasf12ss1p").show();
                $("#canvasf12ss1d").hide();
                var canvas = $("#canvasf12ss1p");
                PieChart(canvas, chartdata, " Hourly Biting Rate");

            } else if (type == "D") {

                $("#canvasf12ss1").hide();
                $("#canvasf12ss1l").hide();
                $("#canvasf12ss1p").hide();
                $("#canvasf12ss1d").show();
                var canvas = $("#canvasf12ss1d");
                PolarChart(canvas, chartdata, " Hourly Biting Rate");


            }

            $('#tblf12ss1').html(tabledata(chartdata));
            if (data.length == 0) {
                $('#loadnonef12ss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }

        },
        error: function (data) {
            $('#loadnonef12ss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            console.log("Request f12ss1 error");
            console.log(data);
        },
        complete: function (data) {
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf12ss1').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div></div></div>');

        }
    });
}


//species composition SS1

function f13req_ss1(ctype) {
    $.ajax({
        url: "data2.php?q=f13req_ss1",
        method: "GET",

        dataType: 'json',
        success: function (data) {
            console.log(data);
                     var tx = [];
                     var gambiae = [];
                     var funestus = [];
                     var coustani = [];
                     var pharoensis = [];
                     var paludis = [];
                     var ziemanni = [];
                     var rculex = [];
                     var rmansonia = [];
                     var raedes = [];
                     var rcoquilettidia = [];

                    for (var i in data) {
                        gambiae.push(parseInt(data[i].An_gambiae));
                        funestus.push(parseInt(data[i].An_funestus));
                        coustani.push(data[i].An_coustani);
                        pharoensis.push(data[i].An_pharoensis);
                        paludis.push(data[i].An_paludis);
                        ziemanni.push(data[i].An_ziemanni);
                        rculex.push(data[i].culex);
                        rmansonia.push(data[i].mansonia);
                        raedes.push(data[i].aedes);
                        rcoquilettidia.push(data[i].coquilettidia);
                        tx.push(data[i].TaxonName)
                    }

                    
var c = gambiae.concat(funestus,coustani,rculex,rmansonia,rcoquilettidia)
var d = c.filter((item, pos) => c.indexOf(item) === pos)



console.log(d) // d is [1, 2, 3, 101, 10]  
                    

                    var chartdata = {
                        labels: ["An_gambiae","An_funestus","An_coustani","Culex Sp.","Mansonia Sp.","Coquilettidia"],
                        backgroundColor: randomColor(),
                        datasets: [
                            {
                                //label: 'An_gambiae',
                                // fill: false,
                                
                                //borderColor: '#46d5f1',
                                //hoverBackgroundColor: '#CCCCCC',
                                //hoverBorderColor: '#666666',
                                //data: [53,0]
                                data: d
                            }
                            
                        ]
                    };


            var type = ctype;

            if (type == "B") {

                $("#canvasf13ss1").show();
                $("#canvasf13ss1l").hide();
                $("#canvasf13ss1p").hide();
                $("#canvasf13ss1d").hide();
                var canvas = $("#canvasf13ss1");
                BarChart(canvas, chartdata, "Species Composition");

            } 
            if (type == "L") {

                $("#canvasf13ss1").hide();
                $("#canvasf13ss1l").show();
                $("#canvasf13ss1p").hide();
                $("#canvasf13ss1d").hide();
                var canvas = $("#canvasf13ss1l");
                LineChart(canvas, chartdata, " Species Composition");


            } else if (type == "P") {

                $("#canvasf13ss1").hide();
                $("#canvasf13ss1l").hide();
                $("#canvasf13ss1p").show();
                $("#canvasf13ss1d").hide();
                var canvas = $("#canvasf13ss1p");
                PieChart(canvas, chartdata, " Species Composition");

            } else if (type == "D") {

                $("#canvasf13ss1").hide();
                $("#canvasf13ss1l").hide();
                $("#canvasf13ss1p").hide();
                $("#canvasf13ss1d").show();
                var canvas = $("#canvasf13ss1d");
                PolarChart(canvas, chartdata, " Species Composition");


            }

            $('#tblf13ss1').html(tabledata(chartdata));
            if (data.length == 0) {
                $('#loadnonef13ss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }

        },
        error: function (data) {
            $('#loadnonef13ss1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            console.log("Request f13ss1 error");
            console.log(data);
        },
        complete: function (data) {
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf13ss1').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div></div></div>');

        }
    });
}

//ss2

function f1req_ss2(ctype) {
    $.ajax({
        url: "data2.php?q=f1req_ss2",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var date = [];
            var anpholes = [];
            var culex = [];
            var Aedes = [];

            for (var i in data) {
                date.push(data[i].DT);
                anpholes.push(data[i].AnophelesSp);
                culex.push(data[i].Culex);
                Aedes.push(data[i].Aedes)
            }

            var chartdata = {
                labels: date,
                datasets: [{
                        label: 'AnophelesSp',
                        fill: false,
                        backgroundColor: '#d40b0b',
                        borderColor: '#d40b0b',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        data: anpholes
                    },
                    {

                        label: 'Culex',
                        fill: false,
                        backgroundColor: '#49e2ff',
                        borderColor: '#46d5f1',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        data: culex
                    },
                    {

                        label: 'Aedes',
                        fill: false,
                        backgroundColor: '#46f162',
                        borderColor: '#46f162',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        data: Aedes
                    }
                ]
            };


            var type = ctype;

            if (type == "B") {

                $("#canvasf1ss2").show();
                $("#canvasf1ss2l").hide();
                $("#canvasf1ss2p").hide();
                $("#canvasf1ss2d").hide();
                var canvas = $("#canvasf1ss2");
                BarChart(canvas, chartdata, "Pupae Density (Total Pupae/Dipping Effort)");

            }
            if (type == "L") {

                $("#canvasf1ss2").hide();
                $("#canvasf1ss2l").show();
                $("#canvasf1ss2p").hide();
                $("#canvasf1ss2d").hide();
                var canvas = $("#canvasf1ss2l");
                LineChart(canvas, chartdata, "Pupae Density (Total Pupae/Dipping Effort)");


            } else if (type == "P") {

                $("#canvasf1ss2").hide();
                $("#canvasf1ss2l").hide();
                $("#canvasf1ss2p").show();
                $("#canvasf1ss2d").hide();
                var canvas = $("#canvasf1ss2p");
                PieChart(canvas, chartdata, "Pupae Density (Total Pupae/Dipping Effort)");

            } else if (type == "D") {

                $("#canvasf1ss2").hide();
                $("#canvasf1ss2l").hide();
                $("#canvasf1ss2p").hide();
                $("#canvasf1ss2d").show();
                var canvas = $("#canvasf1ss2d");
                PolarChart(canvas, chartdata, "Pupae Density (Total Pupae/Dipping Effort)");


            }

            $('#tblf1ss2').html(tabledata(chartdata));

            if (data.length == 0) {
                $('#loadnonef1ss2').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }

        },
        error: function (data) {
            $('#loadnonef1ss2').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            console.log("Request f1ss2req error");
            console.log(data);
        },
        complete: function (data) {
            console.log("Request f1ss2req done");
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf1ss2').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');

        }


    });
}

function f2req_ss2(ctype) {
    $.ajax({
        url: "data2.php?q=f2req_ss2",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var date = [];
            var anpholes = [];
            var culex = [];
            var Aedes = [];

            for (var i in data) {
                date.push(data[i].weekyear);
                anpholes.push(data[i].AnophelesSp);
                culex.push(data[i].Culex);
                Aedes.push(data[i].Aedes)
            }

            var chartdata = {
                labels: date,
                datasets: [{
                        label: 'AnophelesSp',
                        fill: false,
                        backgroundColor: '#d40b0b',
                        borderColor: '#d40b0b',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        data: anpholes
                    },
                    {

                        label: 'Culex',
                        fill: false,
                        backgroundColor: '#49e2ff',
                        borderColor: '#46d5f1',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        data: culex
                    },
                    {

                        label: 'Aedes',
                        fill: false,
                        backgroundColor: '#46f162',
                        borderColor: '#46f162',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        data: Aedes
                    }
                ]
            };


            var type = ctype;

            if (type == "B") {

                $("#canvasf2ss2").show();
                $("#canvasf2ss2l").hide();
                $("#canvasf2ss2p").hide();
                $("#canvasf2ss2d").hide();
                var canvas = $("#canvasf2ss2");
                BarChart(canvas, chartdata, "Pupae Density (Total Pupae/Dipping Effort)");

            }
            if (type == "L") {

                $("#canvasf2ss2").hide();
                $("#canvasf2ss2l").show();
                $("#canvasf2ss2p").hide();
                $("#canvasf2ss2d").hide();
                var canvas = $("#canvasf2ss2l");
                LineChart(canvas, chartdata, "Pupae Density (Total Pupae/Dipping Effort)");


            } else if (type == "P") {

                $("#canvasf2ss2").hide();
                $("#canvasf2ss2l").hide();
                $("#canvasf2ss2p").show();
                $("#canvasf2ss2d").hide();
                var canvas = $("#canvasf2ss2p");
                PieChart(canvas, chartdata, "Pupae Density (Total Pupae/Dipping Effort)");

            } else if (type == "D") {

                $("#canvasf2ss2").hide();
                $("#canvasf2ss2l").hide();
                $("#canvasf2ss2p").hide();
                $("#canvasf2ss2d").show();
                var canvas = $("#canvasf2ss2d");
                PolarChart(canvas, chartdata, "Pupae Density (Total Pupae/Dipping Effort)");


            }

            $('#tblf2ss2').html(tabledata(chartdata));

            if (data.length == 0) {
                $('#loadnonef2ss2').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }

        },
        error: function (data) {
            $('#loadnonef2ss2').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            console.log("Request f2ss2req error");
            console.log(data);
        },
        complete: function (data) {
            console.log("Request f2ss2req done");
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf2ss2').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');

        }


    });
}

function f3req_ss2(ctype) {
    $.ajax({
        url: "data2.php?q=f3req_ss2",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var date = [];
            var anpholes = [];
            var culex = [];
            var Aedes = [];


            for (var i in data) {
                date.push(data[i].month);
                anpholes.push(data[i].AnophelesSp);
                culex.push(data[i].Culex);
                Aedes.push(data[i].Aedes);
            }

            var chartdata = {
                labels: date,
                datasets: [{
                        label: 'AnophelesSp',
                        fill: false,
                        backgroundColor: '#d40b0b',
                        borderColor: '#d40b0b',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        data: anpholes
                    },
                    {

                        label: 'Culex',
                        fill: false,
                        backgroundColor: '#49e2ff',
                        borderColor: '#49e2ff',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        data: culex
                    },
                    {

                        label: 'Aedes',
                        fill: false,
                        backgroundColor: '#46f162',
                        borderColor: '#46f162',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        data: Aedes
                    }
                ]
            };


            var type = ctype;

            if (type == "B") {

                $("#canvasf3ss2").show();
                $("#canvasf3ss2l").hide();
                $("#canvasf3ss2p").hide();
                $("#canvasf3ss2d").hide();
                var canvas = $("#canvasf3ss2");
                BarChart(canvas, chartdata, "Pupae Density (Total Pupae/Dipping Effort)");

            }
            if (type == "L") {

                $("#canvasf3ss2").hide();
                $("#canvasf3ss2l").show();
                $("#canvasf3ss2p").hide();
                $("#canvasf3ss2d").hide();
                var canvas = $("#canvas8l");
                LineChart(canvas, chartdata, "Pupae Density (Total Pupae/Dipping Effort)");


            } else if (type == "P") {

                $("#canvasf3ss2").hide();
                $("#canvasf3ss2l").hide();
                $("#canvasf3ss2p").show();
                $("#canvasf3ss2d").hide();
                var canvas = $("#canvasf3ss2");
                PieChart(canvas, chartdata, "Pupae Density (Total Pupae/Dipping Effort)");

            } else if (type == "D") {

                $("#canvasf3ss2").hide();
                $("#canvasf3ss2l").hide();
                $("#canvasf3ss2p").hide();
                $("#canvasf3ss2d").show();
                var canvas = $("#canvasf3ss2d");
                PolarChart(canvas, chartdata, "Pupae Density (Total Pupae/Dipping Effort)");


            }

            $('#tblf3ss2').html(tabledata(chartdata));

            if (data.length == 0) {
                $('#loadnonef3ss2').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }

        },
        error: function (data) {
            $('#loadnonef3ss2').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            console.log("Request f8req error");
            console.log(data);
        },
        complete: function (data) {
            console.log("Request f3ss2req done");
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf3ss2').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');

        }


    });
}

function f4req_ss2(ctype) {
    $.ajax({
        url: "data2.php?q=f4req_ss2",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var date = [];
            var l1l2 = [];
            var l3l4 = [];
            var l1 = [];
            var l2 = [];
            var l3 = [];
            var l4 = [];

            for (var i in data) {
                date.push(data[i].DT);
                l1l2.push(data[i].L1L2);
                l3l4.push(data[i].L3L4);
                l1.push(data[i].L1);
                l2.push(data[i].L2);
                l3.push(data[i].L3);
                l4.push(data[i].L4);
            }

            var chartdata = {
                labels: date,
                datasets: [{
                        label: 'L1',
                        fill: false,
                        backgroundColor: '#3832a8',
                        borderColor: '#3832a8',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        data: l1
                    },
                    {
                        label: 'L2',
                        fill: false,
                        backgroundColor: '#a8323e',
                        borderColor: '#a8323e',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        data: l2
                    },
                    {
                        label: 'L3',
                        fill: false,
                        backgroundColor: '#d0db35',
                        borderColor: '#d0db35',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        data: l3
                    },
                    {
                        label: 'L4',
                        fill: false,
                        backgroundColor: '#35cddb',
                        borderColor: '#35cddb',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        data: l4
                    },
                    {
                        label: 'Early Stage (L1L2)',
                        fill: false,
                        backgroundColor: '#d40b0b',
                        borderColor: '#d40b0b',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        data: l1l2
                    },
                    {

                        label: 'Late Stage (L3L4)',
                        fill: false,
                        backgroundColor: '#49e2ff',
                        borderColor: '#46d5f1',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        data: l3l4
                    }
                ]
            };


            var type = ctype;

            if (type == "B") {

                $("#canvasf4ss2").show();
                $("#canvasf4ss2l").hide();
                $("#canvasf4ss2p").hide();
                $("#canvasf4ss2d").hide();
                var canvas = $("#canvasf4ss2");
                BarChart(canvas, chartdata, "Larvae Density (Total Larvae/Dipping Effort)");

            }
            if (type == "L") {

                $("#canvasf4ss2").hide();
                $("#canvasf4ss2l").show();
                $("#canvasf4ss2p").hide();
                $("#canvasf4ss2d").hide();
                var canvas = $("#canvasf4ss2l");
                LineChart(canvas, chartdata, "Larvae Density (Total Larvae/Dipping Effort)");


            } else if (type == "P") {

                $("#canvasf4ss2").hide();
                $("#canvasf4ss2l").hide();
                $("#canvasf4ss2p").show();
                $("#canvasf4ss2d").hide();
                var canvas = $("#canvasf4ss2p");
                PieChart(canvas, chartdata, "Larvae Density (Total Larvae/Dipping Effort)");

            } else if (type == "D") {

                $("#canvasf4ss2").hide();
                $("#canvasf4ss2l").hide();
                $("#canvasf4ss2p").hide();
                $("#canvasf4ss2d").show();
                var canvas = $("#canvasf4ss2d");
                PolarChart(canvas, chartdata, "Larvae Density (Total Larvae/Dipping Effort)");


            }

            $('#tblf4ss2').html(tabledata(chartdata));

            if (data.length == 0) {
                $('#loadnonef4ss2').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }

        },
        error: function (data) {
            $('#loadnonef4ss2').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            console.log("Request f4ss2req error");
            console.log(data);
        },
        complete: function (data) {
            console.log("Request f4ss2req done");
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf4ss2').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');

        }


    });
}

function f5req_ss2(ctype) {
    $.ajax({
        url: "data2.php?q=f5req_ss2",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var date = [];
            var l1l2 = [];
            var l3l4 = [];
            var l1 = [];
            var l2 = [];
            var l3 = [];
            var l4 = [];


            for (var i in data) {
                date.push(data[i].weekyear);
                l1l2.push(data[i].L1L2);
                l3l4.push(data[i].L3L4);
                l1.push(data[i].L1);
                l2.push(data[i].L2);
                l3.push(data[i].L3);
                l4.push(data[i].L4);
            }

            var chartdata = {
                labels: date,
                datasets: [{
                        label: 'L1',
                        fill: false,
                        backgroundColor: '#3832a8',
                        borderColor: '#3832a8',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        data: l1
                    },
                    {
                        label: 'L2',
                        fill: false,
                        backgroundColor: '#a8323e',
                        borderColor: '#a8323e',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        data: l2
                    },
                    {
                        label: 'L3',
                        fill: false,
                        backgroundColor: '#d0db35',
                        borderColor: '#d0db35',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        data: l3
                    },
                    {
                        label: 'L4',
                        fill: false,
                        backgroundColor: '#35cddb',
                        borderColor: '#35cddb',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        data: l4
                    },
                    {
                        label: 'Early Stage (L1L2)',
                        fill: false,
                        backgroundColor: '#d40b0b',
                        borderColor: '#d40b0b',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        data: l1l2
                    },
                    {

                        label: 'Late Stage (L3L4)',
                        fill: false,
                        backgroundColor: '#49e2ff',
                        borderColor: '#46d5f1',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        data: l3l4
                    }
                ]
            };


            var type = ctype;

            if (type == "B") {

                $("#canvasf5ss2").show();
                $("#canvasf5ss2l").hide();
                $("#canvasf5ss2p").hide();
                $("#canvasf5ss2d").hide();
                var canvas = $("#canvasf5ss2");
                BarChart(canvas, chartdata, "Larvae Density (Total Larvae/Dipping Effort)");

            }
            if (type == "L") {

                $("#canvasf5ss2").hide();
                $("#canvasf5ss2l").show();
                $("#canvasf5ss2p").hide();
                $("#canvasf5ss2d").hide();
                var canvas = $("#canvasf5ss2l");
                LineChart(canvas, chartdata, "Larvae Density (Total Larvae/Dipping Effort)");


            } else if (type == "P") {

                $("#canvasf5ss2").hide();
                $("#canvasf5ss2l").hide();
                $("#canvasf5ss2p").show();
                $("#canvasf5ss2d").hide();
                var canvas = $("#canvasf5ss2p");
                PieChart(canvas, chartdata, "Larvae Density (Total Larvae/Dipping Effort)");

            } else if (type == "D") {

                $("#canvasf5ss2").hide();
                $("#canvasf5ss2l").hide();
                $("#canvasf5ss2p").hide();
                $("#canvasf5ss2d").show();
                var canvas = $("#canvasf5ss2d");
                PolarChart(canvas, chartdata, "Larvae Density (Total Larvae/Dipping Effort)");


            }

            $('#tblf5ss2').html(tabledata(chartdata));

            if (data.length == 0) {
                $('#loadnonef5ss2').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }

        },
        error: function (data) {
            $('#loadnonef5ss2').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            console.log("Request f5ss2req error");
            console.log(data);
        },
        complete: function (data) {
            console.log("Request f5ss2req done");
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf5ss2').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');
        }


    });
}

function f6req_ss2(ctype) {
    $.ajax({
        url: "data2.php?q=f6req_ss2",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var date = [];
            var l1l2 = [];
            var l3l4 = [];
            var l1 = [];
            var l2 = [];
            var l3 = [];
            var l4 = [];

            for (var i in data) {
                date.push(data[i].month);
                l1l2.push(data[i].L1L2);
                l3l4.push(data[i].L3L4);
                l1.push(data[i].L1);
                l2.push(data[i].L2);
                l3.push(data[i].L3);
                l4.push(data[i].L4);
            }

            var chartdata = {
                labels: date,
                datasets: [{
                        label: 'L1',
                        fill: false,
                        backgroundColor: '#3832a8',
                        borderColor: '#3832a8',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        data: l1
                    },
                    {
                        label: 'L2',
                        fill: false,
                        backgroundColor: '#a8323e',
                        borderColor: '#a8323e',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        data: l2
                    },
                    {
                        label: 'L3',
                        fill: false,
                        backgroundColor: '#d0db35',
                        borderColor: '#d0db35',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        data: l3
                    },
                    {
                        label: 'L4',
                        fill: false,
                        backgroundColor: '#35cddb',
                        borderColor: '#35cddb',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        data: l4
                    },
                    {
                        label: 'Early Stage (L1L2)',
                        fill: false,
                        backgroundColor: '#d40b0b',
                        borderColor: '#d40b0b',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        data: l1l2
                    },
                    {

                        label: 'Late Stage (L3L4)',
                        fill: false,
                        backgroundColor: '#49e2ff',
                        borderColor: '#46d5f1',
                        hoverBackgroundColor: '#CCCCCC',
                        hoverBorderColor: '#666666',
                        data: l3l4
                    }
                ]
            };


            var type = ctype;

            if (type == "B") {

                $("#canvasf6ss2").show();
                $("#canvasf6ss2l").hide();
                $("#canvasf6ss2p").hide();
                $("#canvasf6ss2d").hide();
                var canvas = $("#canvasf6ss2");
                BarChart(canvas, chartdata, "Larvae Density (Total Larvae/Dipping Effort)");

            }
            if (type == "L") {

                $("#canvasf6ss2").hide();
                $("#canvasf6ss2l").show();
                $("#canvasf6ss2p").hide();
                $("#canvasf6ss2d").hide();
                var canvas = $("#canvasf6ss2l");
                LineChart(canvas, chartdata, "Larvae Density (Total Larvae/Dipping Effort)");


            } else if (type == "P") {

                $("#canvasf6ss2").hide();
                $("#canvasf6ss2l").hide();
                $("#canvasf6ss2p").show();
                $("#canvasf6ss2d").hide();
                var canvas = $("#canvasf6ss2p");
                PieChart(canvas, chartdata, "Larvae Density (Total Larvae/Dipping Effort)");

            } else if (type == "D") {

                $("#canvasf6ss2").hide();
                $("#canvasf6ss2l").hide();
                $("#canvasf6ss2p").hide();
                $("#canvasf6ss2d").show();
                var canvas = $("#canvasf6ss2d");
                PolarChart(canvas, chartdata, "Larvae Density (Total Larvae/Dipping Effort)");


            }

            $('#tblf6ss2').html(tabledata(chartdata));

            if (data.length == 0) {
                $('#loadnonef6ss2').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }

        },
        error: function (data) {
            $('#loadnonef6ss2').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            console.log("Request f6ss2req error");
            console.log(data);
        },
        complete: function (data) {
            console.log("Request f6ss2req done");
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf6ss2').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');

        }


    });
}

function f7req_ss2(ctype) {
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


            var type = ctype;

            if (type == "B") {

                $("#canvasf7ss2").show();
                $("#canvasf7ss2l").hide();
                $("#canvasf7ss2p").hide();
                $("#canvasf7ss2d").hide();
                var canvas = $("#canvasf7ss2");
                BarChart(canvas, chartdata, "Larvae Population Summary");

            }
            if (type == "L") {

                $("#canvasf7ss2").hide();
                $("#canvasf7ss2l").show();
                $("#canvasf7ss2p").hide();
                $("#canvasf7ss2d").hide();
                var canvas = $("#canvasf7ss2l");
                LineChart(canvas, chartdata, "Larvae Population Summary");


            } else if (type == "P") {

                $("#canvasf7ss2").hide();
                $("#canvasf7ss2l").hide();
                $("#canvasf7ss2p").show();
                $("#canvasf7ss2d").hide();
                var canvas = $("#canvasf7ss2p");
                PieChart(canvas, chartdata, "Larvae Population Summary");

            } else if (type == "D") {

                $("#canvasf7ss2").hide();
                $("#canvasf7ss2l").hide();
                $("#canvasf7ss2p").hide();
                $("#canvasf7ss2d").show();
                var canvas = $("#canvasf7ss2d");
                PolarChart(canvas, chartdata, "Larvae Population Summary");


            }

            $('#tblf7ss2').html(tabledata(chartdata));

            if (data.length == 0) {
                $('#loadnonef7ss2').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }

        },
        error: function (data) {
            $('#loadnonef7ss2').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            console.log("Request f7ss2req error");
            console.log(data);
        },
        complete: function (data) {
            console.log("Request f7ss2req done");
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf7ss2').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');

        }


    });
}

//ss3

function f1req_ss3(ctype) {
    $.ajax({
        url: "data2.php?q=f1req_ss3",
        method: "GET",

        dataType: 'json',
        success: function (data) {
            console.log(data);

            var mti1 = [];
            var mti2 =[];
            var mti3 = [];
            var mti4 =[];
            var mti5 = [];
            var mti6 =[];
            var mts=[];
            var mtisy1 = [];
            var mtisy2 = [];
            var mtisy3 = [];
            var mtisy4 = [];
            var mtisy5 = [];
            var mtisy6 = [];
            var mtsy = [];

            var labelname = ["Mos KD/Dead 0mins", "Mos KD/Dead 15mins", "Mos KD/Dead 30mins", "Mos KD/Dead 45mins",
             "Mos KD/Dead 60mins","Mos KD/Dead 70mins","Mos KD/Dead 90mins","Mos KD/Dead 105mins",
             "Mos KD/Dead 120mins", "Mos KD/Dead 1440mins","Mos KD/Dead 4320mins"];

            for (var i in data) {
                mti1.push(parseInt(data[i].kd_d0));
                mti1.push(parseInt(data[i].kd_d15));
                mti1.push(parseInt(data[i].kd_d30));
                mti1.push(parseInt(data[i].kd_d45));
                mti1.push(parseInt(data[i].kd_d60));
                mti1.push(parseInt(data[i].kd_d75));
                mti1.push(parseInt(data[i].kd_d90));
                mti1.push(parseInt(data[i].kd_d105));
                mti1.push(parseInt(data[i].kd_d120));
                mti1.push(parseInt(data[i].kd_d24));
                mti1.push(parseInt(data[i].kd_d72));
           
                mti2.push(parseInt(data[i].kd_d0));
                mti2.push(parseInt(data[i].kd_d15));
                mti2.push(parseInt(data[i].kd_d30));
                mti2.push(parseInt(data[i].kd_d45));
                mti2.push(parseInt(data[i].kd_d60));
                mti2.push(parseInt(data[i].kd_d75));
                mti2.push(parseInt(data[i].kd_d90));
                mti2.push(parseInt(data[i].kd_d105));
                mti2.push(parseInt(data[i].kd_d120));
                mti2.push(parseInt(data[i].kd_d24));
                mti2.push(parseInt(data[i].kd_d72));
            

                mti3.push(parseInt(data[i].kd_d0));
                mti3.push(parseInt(data[i].kd_d15));
                mti3.push(parseInt(data[i].kd_d30));
                mti3.push(parseInt(data[i].kd_d45));
                mti3.push(parseInt(data[i].kd_d60));
                mti3.push(parseInt(data[i].kd_d75));
                mti3.push(parseInt(data[i].kd_d90));
                mti3.push(parseInt(data[i].kd_d105));
                mti3.push(parseInt(data[i].kd_d120));
                mti3.push(parseInt(data[i].kd_d24));
                mti3.push(parseInt(data[i].kd_d72));
           
                mti4.push(parseInt(data[i].kd_d0));
                mti4.push(parseInt(data[i].kd_d15));
                mti4.push(parseInt(data[i].kd_d30));
                mti4.push(parseInt(data[i].kd_d45));
                mti4.push(parseInt(data[i].kd_d60));
                mti4.push(parseInt(data[i].kd_d75));
                mti4.push(parseInt(data[i].kd_d90));
                mti4.push(parseInt(data[i].kd_d105));
                mti4.push(parseInt(data[i].kd_d120));
                mti4.push(parseInt(data[i].kd_d24));
                mti4.push(parseInt(data[i].kd_d72));
           

                mti5.push(parseInt(data[i].kd_d0));
                mti5.push(parseInt(data[i].kd_d15));
                mti5.push(parseInt(data[i].kd_d30));
                mti5.push(parseInt(data[i].kd_d45));
                mti5.push(parseInt(data[i].kd_d60));
                mti5.push(parseInt(data[i].kd_d75));
                mti5.push(parseInt(data[i].kd_d90));
                mti5.push(parseInt(data[i].kd_d105));
                mti5.push(parseInt(data[i].kd_d120));
                mti5.push(parseInt(data[i].kd_d24));
                mti5.push(parseInt(data[i].kd_d72));
           
                mti6.push(parseInt(data[i].kd_d0));
                mti6.push(parseInt(data[i].kd_d15));
                mti6.push(parseInt(data[i].kd_d30));
                mti6.push(parseInt(data[i].kd_d45));
                mti6.push(parseInt(data[i].kd_d60));
                mti6.push(parseInt(data[i].kd_d75));
                mti6.push(parseInt(data[i].kd_d90));
                mti6.push(parseInt(data[i].kd_d105));
                mti6.push(parseInt(data[i].kd_d120));
                mti6.push(parseInt(data[i].kd_d24));
                mti6.push(parseInt(data[i].kd_d72));

                mts.push(parseInt(data[i].kd_d0));
                mts.push(parseInt(data[i].kd_d15));
                mts.push(parseInt(data[i].kd_d30));
                mts.push(parseInt(data[i].kd_d45));
                mts.push(parseInt(data[i].kd_d60));
                mts.push(parseInt(data[i].kd_d75));
                mts.push(parseInt(data[i].kd_d90));
                mts.push(parseInt(data[i].kd_d105));
                mts.push(parseInt(data[i].kd_d120));
                mts.push(parseInt(data[i].kd_d24));
                mts.push(parseInt(data[i].kd_d72));

                mtisy1.push(parseInt(data[i].kd_d0));
                mtisy1.push(parseInt(data[i].kd_d15));
                mtisy1.push(parseInt(data[i].kd_d30));
                mtisy1.push(parseInt(data[i].kd_d45));
                mtisy1.push(parseInt(data[i].kd_d60));
                mtisy1.push(parseInt(data[i].kd_d75));
                mtisy1.push(parseInt(data[i].kd_d90));
                mtisy1.push(parseInt(data[i].kd_d105));
                mtisy1.push(parseInt(data[i].kd_d120));
                mtisy1.push(parseInt(data[i].kd_d24));
                mtisy1.push(parseInt(data[i].kd_d72));

                mtisy2.push(parseInt(data[i].kd_d0));
                mtisy2.push(parseInt(data[i].kd_d15));
                mtisy2.push(parseInt(data[i].kd_d30));
                mtisy2.push(parseInt(data[i].kd_d45));
                mtisy2.push(parseInt(data[i].kd_d60));
                mtisy2.push(parseInt(data[i].kd_d75));
                mtisy2.push(parseInt(data[i].kd_d90));
                mtisy2.push(parseInt(data[i].kd_d105));
                mtisy2.push(parseInt(data[i].kd_d120));
                mtisy2.push(parseInt(data[i].kd_d24));
                mtisy2.push(parseInt(data[i].kd_d72));


                mtisy3.push(parseInt(data[i].kd_d0));
                mtisy3.push(parseInt(data[i].kd_d15));
                mtisy3.push(parseInt(data[i].kd_d30));
                mtisy3.push(parseInt(data[i].kd_d45));
                mtisy3.push(parseInt(data[i].kd_d60));
                mtisy3.push(parseInt(data[i].kd_d75));
                mtisy3.push(parseInt(data[i].kd_d90));
                mtisy3.push(parseInt(data[i].kd_d105));
                mtisy3.push(parseInt(data[i].kd_d120));
                mtisy3.push(parseInt(data[i].kd_d24));
                mtisy3.push(parseInt(data[i].kd_d72));
                
                mtisy4.push(parseInt(data[i].kd_d0));
                mtisy4.push(parseInt(data[i].kd_d15));
                mtisy4.push(parseInt(data[i].kd_d30));
                mtisy4.push(parseInt(data[i].kd_d45));
                mtisy4.push(parseInt(data[i].kd_d60));
                mtisy4.push(parseInt(data[i].kd_d75));
                mtisy4.push(parseInt(data[i].kd_d90));
                mtisy4.push(parseInt(data[i].kd_d105));
                mtisy4.push(parseInt(data[i].kd_d120));
                mtisy4.push(parseInt(data[i].kd_d24));
                mtisy4.push(parseInt(data[i].kd_d72));

                mtisy5.push(parseInt(data[i].kd_d0));
                mtisy5.push(parseInt(data[i].kd_d15));
                mtisy5.push(parseInt(data[i].kd_d30));
                mtisy5.push(parseInt(data[i].kd_d45));
                mtisy5.push(parseInt(data[i].kd_d60));
                mtisy5.push(parseInt(data[i].kd_d75));
                mtisy5.push(parseInt(data[i].kd_d90));
                mtisy5.push(parseInt(data[i].kd_d105));
                mtisy5.push(parseInt(data[i].kd_d120));
                mtisy5.push(parseInt(data[i].kd_d24));
                mtisy5.push(parseInt(data[i].kd_d72));

                mtisy6.push(parseInt(data[i].kd_d0));
                mtisy6.push(parseInt(data[i].kd_d15));
                mtisy6.push(parseInt(data[i].kd_d30));
                mtisy6.push(parseInt(data[i].kd_d45));
                mtisy6.push(parseInt(data[i].kd_d60));
                mtisy6.push(parseInt(data[i].kd_d75));
                mtisy6.push(parseInt(data[i].kd_d90));
                mtisy6.push(parseInt(data[i].kd_d105));
                mtisy6.push(parseInt(data[i].kd_d120));
                mtisy6.push(parseInt(data[i].kd_d24));
                mtisy6.push(parseInt(data[i].kd_d72));


                mtsy.push(parseInt(data[i].kd_d0));
                mtsy.push(parseInt(data[i].kd_d15));
                mtsy.push(parseInt(data[i].kd_d30));
                mtsy.push(parseInt(data[i].kd_d45));
                mtsy.push(parseInt(data[i].kd_d60));
                mtsy.push(parseInt(data[i].kd_d75));
                mtsy.push(parseInt(data[i].kd_d90));
                mtsy.push(parseInt(data[i].kd_d105));
                mtsy.push(parseInt(data[i].kd_d120));
                mtsy.push(parseInt(data[i].kd_d24));
                mtsy.push(parseInt(data[i].kd_d72));

            }

            var dataset = mti1, mti2, mti3,mti4, mti5, mti6, mts, mtisy1,mtisy2,mtisy3,mtisy4,mtisy3,mtisy4, mtisy5, mtisy6,mtsy;
            var labels = labelname;

            var list = [];

            list = sortdata(dataset, labels);

            for (var k = 0; k < list.length; k++) {
                dataset[k] = list[k].data;
                labels[k] = list[k].label;
            }


    
            var chartdata = {
                datasets: [{
                

                    label: 'Mosquitoes KnockedDown',
                       
                        data: mti1, mti2, mti3,mti4, mti5, mti6, mts, mtisy1,mtisy2,mtisy3,mtisy4,mtisy3,mtisy4, mtisy5, mtisy6,mtsy
                    
                }],
                labels: labels
            };


            $('#tblf1ss3').html(tabledata(chartdata));


            var type = ctype;

            if (type == "B") {

                $("#canvasf1ss3").show();
                $("#canvasf1ss3l").hide();
                $("#canvasf1ss3p").hide();
                $("#canvasf1ss3d").hide();
                var canvas = $("#canvasf1ss3");
                BarChart(canvas, chartdata, "Res: Count vs KnockDown Time");

            } else if (type == "L") {

                $("#canvasf1ss3").hide();
                $("#canvasf1ss3l").show();
                $("#canvasf1ss3p").hide();
                $("#canvasf1ss3d").hide();
                var canvas = $("#canvasf1ss3l");
                LineChart(canvas, chartdata, "Res: Count vs KnockDown Time");


            } else if (type == "P") {

                $("#canvasf1ss3").hide();
                $("#canvasf1ss3l").hide();
                $("#canvasf1ss3p").show();
                $("#canvasf1ss3d").hide();
                var canvas = $("#canvasf1ss3p");
                PieChart(canvas, chartdata, "Res: Count vs KnockDown Time");

            } else if (type == "D") {

                $("#canvasf1ss3").hide();
                $("#canvasf1ss3l").hide();
                $("#canvasf1ss3p").hide();
                $("#canvasf1ss3d").show();
                var canvas = $("#canvasf1ss3d");
                PolarChart(canvas, chartdata, "Res: Count vs KnockDown Time");


            }

        //     $('#tblf1ss3').html(tabledata(chartdata));


        // },
        // error: function (data) {
        //     console.log("Request f1req_ss3 error");
        //     console.log(data);
        // },
        // complete: function (data) {
        //     $('.loader').fadeOut();
        // },
        // beforeSend: function (data) {
        //     $('#loadf1ss3').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div></div></div>');
        //  f2req_ss3('B');
        // }




        $('#tblf1ss3').html(tabledata(chartdata));

        if (data.length == 0) {
            $('#loadnonef1ss3').html('<div class="bg-danger has-padding text-center">No data available!</div>');
        }

    },
    error: function (data) {
        $('#loadnonef1ss3').html('<div class="bg-danger has-padding text-center">No data available!</div>');
        console.log("Request f1ss3req error");
        console.log(data);
    },
    complete: function (data) {
        $('.loader').fadeOut();
    },
    beforeSend: function (data) {
        $('#loadf1ss3').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div></div></div>');
    }




    });
}


//coneres


function f2req_ss3(ctype) {
    $.ajax({
        url: "data2.php?q=f2req_ss3",
        method: "GET",

        dataType: 'json',
        success: function (data) {
            console.log(data);

            var mt1 = [];
            var mt2 =[];
            var mt3 = [];
            var mt4 =[];
            
         
            var labelname = ["Mos KD 3Omin", "Mos KD 60min", "Mos KD Day1", "Mos KD Day2", "Mos KD Day3","Mos KD 30min",
            "Mos KD 60min","Mos KD Day1","Mos KD Day2",
             "Mos KD Day3", "Mos KD 30min", "Mos KD 60min", "Mos KD Day1", "Mos KD Day2","Mos KD 30min","Mos KD 60min","Mos KD Day1",
             "Mos KD Day1", "Mos KD Day2", "Mos KD Day3"];

            for (var i in data) {
                mt1.push(parseInt(data[i].mkd1));
                mt1.push(parseInt(data[i].mkd2));
                mt1.push(parseInt(data[i].mkd3));
                mt1.push(parseInt(data[i].mkd4));
                mt1.push(parseInt(data[i].mkd5));
           
                mt2.push(parseInt(data[i].mkd6));
                mt2.push(parseInt(data[i].mkd7));
                mt2.push(parseInt(data[i].mkd8));
                mt2.push(parseInt(data[i].mkd9));
                mt2.push(parseInt(data[i].mkd10));
           

                mt3.push(parseInt(data[i].mkd11));
                mt3.push(parseInt(data[i].mkd12));
                mt3.push(parseInt(data[i].mkd13));
                mt3.push(parseInt(data[i].mkd14));
                mt3.push(parseInt(data[i].mkd15));
           

       
                mt4.push(parseInt(data[i].mkd16));
                mt4.push(parseInt(data[i].mkd17));
                mt4.push(parseInt(data[i].mkd18));
                mt4.push(parseInt(data[i].mkd19));
                mt4.push(parseInt(data[i].mkd20));
           

            }
           
          

            var dataset = mt1, mt2, mt3,mt4;
            var labels = labelname;

            var list = [];

            list = sortdata(dataset, labels);

            for (var k = 0; k < list.length; k++) {
                dataset[k] = list[k].data;
                labels[k] = list[k].label;
            }


        
            var chartdata = {
                datasets: [{
                

                    label: 'Mosquitoes KnockedDown',
                       
                        data: mt1, mt2, mt3,mt4
                    
                }],
                labels: labels
            };



            $('#tblf2ss3').html(tabledata(chartdata));


            var type = ctype;

            if (type == "B") {

                $("#canvasf2ss3").show();
                $("#canvasf2ss3l").hide();
                $("#canvasf2ss3p").hide();
                $("#canvasf2ss3d").hide();
                var canvas = $("#canvasf2ss3");
                BarChart(canvas, chartdata, "WHO Cone Resistance: Count vs KnockDown Time");

            } else if (type == "L") {

                $("#canvasf2ss3").hide();
                $("#canvasf2ss3l").show();
                $("#canvasf2ss3p").hide();
                $("#canvasf2ss3d").hide();
                var canvas = $("#canvasf2ss3l");
                LineChart(canvas, chartdata, "WHO Cone Resistance: Count vs KnockDown Time");


            } else if (type == "P") {

                $("#canvasf2ss3").hide();
                $("#canvasf2ss3l").hide();
                $("#canvasf2ss3p").show();
                $("#canvasf2ss3d").hide();
                var canvas = $("#canvasf2ss3p");
                PieChart(canvas, chartdata, "WHO Cone Resistance: Count vs KnockDown Time");

            } else if (type == "D") {

                $("#canvasf2ss3").hide();
                $("#canvasf2ss3l").hide();
                $("#canvasf2ss3p").hide();
                $("#canvasf2ss3d").show();
                var canvas = $("#canvasf2ss3d");
                PolarChart(canvas, chartdata, "WHO Cone Resistance: Count vs KnockDown Time");


            }

            $('#tblf2ss3').html(tabledata(chartdata));


        },
        error: function (data) {
            console.log("Request f2req_ss3 error");
            console.log(data);
        },
        complete: function (data) {
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf2ss3').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div></div></div>');
            f3req_ss3('B');
        }
    });
}


//endconeres


//tuberes

function f3req_ss3(ctype) {
    $.ajax({
        url: "data2.php?q=f3req_ss3",
        method: "GET",

        dataType: 'json',
        success: function (data) {
            console.log(data);

            var mtir1 = [];
            var mtir2 =[];
            var mtir3 = [];
            var mtir4 =[];
            var mtir5 = [];
            var mtir6 =[];
            var mtsr1 =[];
            var mtsr2 =[];
            var mtsr3 =[];
            var mtsr4 =[];
         
            var labelname = ["Mos KD Day1", "Mos KD Day2", "Mos KD Day3", "Mos KD Day4", "Mos KD Day5","Mos KD Day6","Mos KD Day7"];

            for (var i in data) {
                mtir1.push(parseInt(data[i].kd_d1d));
                mtir1.push(parseInt(data[i].kd_d2d));
                mtir1.push(parseInt(data[i].kd_d3d));
                mtir1.push(parseInt(data[i].kd_d4d));
                mtir1.push(parseInt(data[i].kd_d5d));
                mtir1.push(parseInt(data[i].kd_d6d));
                mtir1.push(parseInt(data[i].kd_d7d));
           
                mtir2.push(parseInt(data[i].kd_d1d));
                mtir2.push(parseInt(data[i].kd_d2d));
                mtir2.push(parseInt(data[i].kd_d3d));
                mtir2.push(parseInt(data[i].kd_d4d));
                mtir2.push(parseInt(data[i].kd_d5d));
                mtir2.push(parseInt(data[i].kd_d6d));
                mtir2.push(parseInt(data[i].kd_d7d));

                mtir3.push(parseInt(data[i].kd_d1d));
                mtir3.push(parseInt(data[i].kd_d2d));
                mtir3.push(parseInt(data[i].kd_d3d));
                mtir3.push(parseInt(data[i].kd_d4d));
                mtir3.push(parseInt(data[i].kd_d5d));
                mtir3.push(parseInt(data[i].kd_d6d));
                mtir3.push(parseInt(data[i].kd_d7d));
           
                mtir4.push(parseInt(data[i].kd_d1d));
                mtir4.push(parseInt(data[i].kd_d2d));
                mtir4.push(parseInt(data[i].kd_d3d));
                mtir4.push(parseInt(data[i].kd_d4d));
                mtir4.push(parseInt(data[i].kd_d5d));
                mtir4.push(parseInt(data[i].kd_d6d));
                mtir4.push(parseInt(data[i].kd_d7d));

                mtir5.push(parseInt(data[i].kd_d1d));
                mtir5.push(parseInt(data[i].kd_d2d));
                mtir5.push(parseInt(data[i].kd_d3d));
                mtir5.push(parseInt(data[i].kd_d4d));
                mtir5.push(parseInt(data[i].kd_d5d));
                mtir5.push(parseInt(data[i].kd_d6d));
                mtir5.push(parseInt(data[i].kd_d7d));
           
                mtir6.push(parseInt(data[i].kd_d1d));
                mtir6.push(parseInt(data[i].kd_d2d));
                mtir6.push(parseInt(data[i].kd_d3d));
                mtir6.push(parseInt(data[i].kd_d4d));
                mtir6.push(parseInt(data[i].kd_d5d));
                mtir6.push(parseInt(data[i].kd_d6d));
                mtir6.push(parseInt(data[i].kd_d7d));

                mtsr1.push(parseInt(data[i].kd_d1d));
                mtsr1.push(parseInt(data[i].kd_d2d));
                mtsr1.push(parseInt(data[i].kd_d3d));
                mtsr1.push(parseInt(data[i].kd_d4d));
                mtsr1.push(parseInt(data[i].kd_d5d));
                mtsr1.push(parseInt(data[i].kd_d6d));
                mtsr1.push(parseInt(data[i].kd_d7d));

                mtsr2.push(parseInt(data[i].kd_d1d));
                mtsr2.push(parseInt(data[i].kd_d2d));
                mtsr2.push(parseInt(data[i].kd_d3d));
                mtsr2.push(parseInt(data[i].kd_d4d));
                mtsr2.push(parseInt(data[i].kd_d5d));
                mtsr2.push(parseInt(data[i].kd_d6d));
                mtsr2.push(parseInt(data[i].kd_d7d));

                mtsr3.push(parseInt(data[i].kd_d1d));
                mtsr3.push(parseInt(data[i].kd_d2d));
                mtsr3.push(parseInt(data[i].kd_d3d));
                mtsr3.push(parseInt(data[i].kd_d4d));
                mtsr3.push(parseInt(data[i].kd_d5d));
                mtsr3.push(parseInt(data[i].kd_d6d));
                mtsr3.push(parseInt(data[i].kd_d7d));

                mtsr4.push(parseInt(data[i].kd_d1d));
                mtsr4.push(parseInt(data[i].kd_d2d));
                mtsr4.push(parseInt(data[i].kd_d3d));
                mtsr4.push(parseInt(data[i].kd_d4d));
                mtsr4.push(parseInt(data[i].kd_d5d));
                mtsr4.push(parseInt(data[i].kd_d6d));
                mtsr4.push(parseInt(data[i].kd_d7d));
            }
           
          

            var dataset = mtir1, mtir2, mtir3,mtir4,mtir5,mtir6, mtsr1,mtsr2,mtsr3,mtsr4;
            var labels = labelname;

            var list = [];

            list = sortdata(dataset, labels);

            for (var k = 0; k < list.length; k++) {
                dataset[k] = list[k].data;
                labels[k] = list[k].label;
            }


            var chartdata = {
                datasets: [{
                

                    label: 'Mosquitoes KnockedDown',
                       
                        data: mtir1, mtir2, mtir3,mtir4,mtir5,mtir6, mtsr1,mtsr2,mtsr3,mtsr4
                    
                }],
                labels: labels
            };


            $('#tblf3ss3').html(tabledata(chartdata));


            var type = ctype;

            if (type == "B") {

                $("#canvasf3ss3").show();
                $("#canvasf3ss3l").hide();
                $("#canvasf3ss3p").hide();
                $("#canvasf3ss3d").hide();
                var canvas = $("#canvasf3ss3b");
                BarChart(canvas, chartdata, "WHO Tube Resistance: Count vs KnockDown Time");

            } else if (type == "L") {

                $("#canvasf3ss3").hide();
                $("#canvasf3ss3l").show();
                $("#canvasf3ss3p").hide();
                $("#canvasf3ss3d").hide();
                var canvas = $("#canvasf3ss3l");
                LineChart(canvas, chartdata, "WHO Tube Resistance: Count vs KnockDown Time");


            } else if (type == "P") {

                $("#canvasf3ss3").hide();
                $("#canvasf3ss3l").hide();
                $("#canvasf3ss3p").show();
                $("#canvasf3ss3d").hide();
                var canvas = $("#canvasf3ss3p");
                PieChart(canvas, chartdata, "WHO Tube Resistance: Count vs KnockDown Time");

            } else if (type == "D") {

                $("#canvasf3ss3").hide();
                $("#canvasf3ss3l").hide();
                $("#canvasf3ss3p").hide();
                $("#canvasf3ss3d").show();
                var canvas = $("#canvasf3ss3d");
                PolarChart(canvas, chartdata, "WHO Tube Resistance: Count vs KnockDown Time");


            }

            $('#tblf3ss3').html(tabledata(chartdata));


        },
        error: function (data) {
            console.log("Request f3req_ss3 error");
            console.log(data);
        },
        complete: function (data) {
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf3ss3').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div></div></div>');
      
        }
    });
}

//f4req_ss3

function f4req_ss3(ctype) {
    $.ajax({
        url: "data2.php?q=f4req_ss3",
        method: "GET",

        dataType: 'json',
        success: function (data) {
            console.log(data);
            var it = [];
            var kd_d0 =[];
            var kd_d15 = [];
            var kd_d30 =[];
            var kd_d45 = [];
            var kd_d60 =[];
            var kd_d75=[];
            var kd_d90 = [];
            var kd_d105 = [];
            var kd_d120 = [];
            var kd_d1440 = [];
            var kd_d4320 = [];

            var mti1 = [];
            var mti2 =[];
            var mti3 = [];
            var mti4 =[];
            var mti5 = [];
            var mti6 =[];
            var mts=[];
            var mtisy1 = [];
            var mtisy2 = [];
            var mtisy3 = [];
            var mtisy4 = [];
            var mtisy5 = [];
            var mtisy6 = [];
            var mtsy = [];
         

            for (var i in data) {
                it.push(parseInt(data[i].it));
                // kd_d0.push(parseInt(data[i].kd_d0));
                // kd_d15.push(parseInt(data[i].kd_d15));
                // kd_d30.push(parseInt(data[i].kd_d30));
                // kd_d45.push(parseInt(data[i].kd_d45));
                // kd_d60.push(parseInt(data[i].kd_d60));
                // kd_d75.push(parseInt(data[i].kd_d75));
                // kd_d90.push(parseInt(data[i].kd_d90));
                // kd_d105.push(parseInt(data[i].kd_d105));
                // kd_d120.push(parseInt(data[i].kd_d120));
                // kd_d1440.push(parseInt(data[i].kd_d1440));
                // kd_d4320.push(parseInt(data[i].kd_d4320));



                mti1.push(parseInt(data[i].kd_d0));
                mti1.push(parseInt(data[i].kd_d15));
                mti1.push(parseInt(data[i].kd_d30));
                mti1.push(parseInt(data[i].kd_d45));
                mti1.push(parseInt(data[i].kd_d60));
                mti1.push(parseInt(data[i].kd_d75));
                mti1.push(parseInt(data[i].kd_d90));
                mti1.push(parseInt(data[i].kd_d105));
                mti1.push(parseInt(data[i].kd_d120));
                mti1.push(parseInt(data[i].kd_d24));
                mti1.push(parseInt(data[i].kd_d72));
           
                mti2.push(parseInt(data[i].kd_d0));
                mti2.push(parseInt(data[i].kd_d15));
                mti2.push(parseInt(data[i].kd_d30));
                mti2.push(parseInt(data[i].kd_d45));
                mti2.push(parseInt(data[i].kd_d60));
                mti2.push(parseInt(data[i].kd_d75));
                mti2.push(parseInt(data[i].kd_d90));
                mti2.push(parseInt(data[i].kd_d105));
                mti2.push(parseInt(data[i].kd_d120));
                mti2.push(parseInt(data[i].kd_d24));
                mti2.push(parseInt(data[i].kd_d72));
            

                mti3.push(parseInt(data[i].kd_d0));
                mti3.push(parseInt(data[i].kd_d15));
                mti3.push(parseInt(data[i].kd_d30));
                mti3.push(parseInt(data[i].kd_d45));
                mti3.push(parseInt(data[i].kd_d60));
                mti3.push(parseInt(data[i].kd_d75));
                mti3.push(parseInt(data[i].kd_d90));
                mti3.push(parseInt(data[i].kd_d105));
                mti3.push(parseInt(data[i].kd_d120));
                mti3.push(parseInt(data[i].kd_d24));
                mti3.push(parseInt(data[i].kd_d72));
           
                mti4.push(parseInt(data[i].kd_d0));
                mti4.push(parseInt(data[i].kd_d15));
                mti4.push(parseInt(data[i].kd_d30));
                mti4.push(parseInt(data[i].kd_d45));
                mti4.push(parseInt(data[i].kd_d60));
                mti4.push(parseInt(data[i].kd_d75));
                mti4.push(parseInt(data[i].kd_d90));
                mti4.push(parseInt(data[i].kd_d105));
                mti4.push(parseInt(data[i].kd_d120));
                mti4.push(parseInt(data[i].kd_d24));
                mti4.push(parseInt(data[i].kd_d72));
           

                mti5.push(parseInt(data[i].kd_d0));
                mti5.push(parseInt(data[i].kd_d15));
                mti5.push(parseInt(data[i].kd_d30));
                mti5.push(parseInt(data[i].kd_d45));
                mti5.push(parseInt(data[i].kd_d60));
                mti5.push(parseInt(data[i].kd_d75));
                mti5.push(parseInt(data[i].kd_d90));
                mti5.push(parseInt(data[i].kd_d105));
                mti5.push(parseInt(data[i].kd_d120));
                mti5.push(parseInt(data[i].kd_d24));
                mti5.push(parseInt(data[i].kd_d72));
           
                mti6.push(parseInt(data[i].kd_d0));
                mti6.push(parseInt(data[i].kd_d15));
                mti6.push(parseInt(data[i].kd_d30));
                mti6.push(parseInt(data[i].kd_d45));
                mti6.push(parseInt(data[i].kd_d60));
                mti6.push(parseInt(data[i].kd_d75));
                mti6.push(parseInt(data[i].kd_d90));
                mti6.push(parseInt(data[i].kd_d105));
                mti6.push(parseInt(data[i].kd_d120));
                mti6.push(parseInt(data[i].kd_d24));
                mti6.push(parseInt(data[i].kd_d72));

                mts.push(parseInt(data[i].kd_d0));
                mts.push(parseInt(data[i].kd_d15));
                mts.push(parseInt(data[i].kd_d30));
                mts.push(parseInt(data[i].kd_d45));
                mts.push(parseInt(data[i].kd_d60));
                mts.push(parseInt(data[i].kd_d75));
                mts.push(parseInt(data[i].kd_d90));
                mts.push(parseInt(data[i].kd_d105));
                mts.push(parseInt(data[i].kd_d120));
                mts.push(parseInt(data[i].kd_d24));
                mts.push(parseInt(data[i].kd_d72));

                mtisy1.push(parseInt(data[i].kd_d0));
                mtisy1.push(parseInt(data[i].kd_d15));
                mtisy1.push(parseInt(data[i].kd_d30));
                mtisy1.push(parseInt(data[i].kd_d45));
                mtisy1.push(parseInt(data[i].kd_d60));
                mtisy1.push(parseInt(data[i].kd_d75));
                mtisy1.push(parseInt(data[i].kd_d90));
                mtisy1.push(parseInt(data[i].kd_d105));
                mtisy1.push(parseInt(data[i].kd_d120));
                mtisy1.push(parseInt(data[i].kd_d24));
                mtisy1.push(parseInt(data[i].kd_d72));

                mtisy2.push(parseInt(data[i].kd_d0));
                mtisy2.push(parseInt(data[i].kd_d15));
                mtisy2.push(parseInt(data[i].kd_d30));
                mtisy2.push(parseInt(data[i].kd_d45));
                mtisy2.push(parseInt(data[i].kd_d60));
                mtisy2.push(parseInt(data[i].kd_d75));
                mtisy2.push(parseInt(data[i].kd_d90));
                mtisy2.push(parseInt(data[i].kd_d105));
                mtisy2.push(parseInt(data[i].kd_d120));
                mtisy2.push(parseInt(data[i].kd_d24));
                mtisy2.push(parseInt(data[i].kd_d72));


                mtisy3.push(parseInt(data[i].kd_d0));
                mtisy3.push(parseInt(data[i].kd_d15));
                mtisy3.push(parseInt(data[i].kd_d30));
                mtisy3.push(parseInt(data[i].kd_d45));
                mtisy3.push(parseInt(data[i].kd_d60));
                mtisy3.push(parseInt(data[i].kd_d75));
                mtisy3.push(parseInt(data[i].kd_d90));
                mtisy3.push(parseInt(data[i].kd_d105));
                mtisy3.push(parseInt(data[i].kd_d120));
                mtisy3.push(parseInt(data[i].kd_d24));
                mtisy3.push(parseInt(data[i].kd_d72));
                
                mtisy4.push(parseInt(data[i].kd_d0));
                mtisy4.push(parseInt(data[i].kd_d15));
                mtisy4.push(parseInt(data[i].kd_d30));
                mtisy4.push(parseInt(data[i].kd_d45));
                mtisy4.push(parseInt(data[i].kd_d60));
                mtisy4.push(parseInt(data[i].kd_d75));
                mtisy4.push(parseInt(data[i].kd_d90));
                mtisy4.push(parseInt(data[i].kd_d105));
                mtisy4.push(parseInt(data[i].kd_d120));
                mtisy4.push(parseInt(data[i].kd_d24));
                mtisy4.push(parseInt(data[i].kd_d72));

                mtisy5.push(parseInt(data[i].kd_d0));
                mtisy5.push(parseInt(data[i].kd_d15));
                mtisy5.push(parseInt(data[i].kd_d30));
                mtisy5.push(parseInt(data[i].kd_d45));
                mtisy5.push(parseInt(data[i].kd_d60));
                mtisy5.push(parseInt(data[i].kd_d75));
                mtisy5.push(parseInt(data[i].kd_d90));
                mtisy5.push(parseInt(data[i].kd_d105));
                mtisy5.push(parseInt(data[i].kd_d120));
                mtisy5.push(parseInt(data[i].kd_d24));
                mtisy5.push(parseInt(data[i].kd_d72));

                mtisy6.push(parseInt(data[i].kd_d0));
                mtisy6.push(parseInt(data[i].kd_d15));
                mtisy6.push(parseInt(data[i].kd_d30));
                mtisy6.push(parseInt(data[i].kd_d45));
                mtisy6.push(parseInt(data[i].kd_d60));
                mtisy6.push(parseInt(data[i].kd_d75));
                mtisy6.push(parseInt(data[i].kd_d90));
                mtisy6.push(parseInt(data[i].kd_d105));
                mtisy6.push(parseInt(data[i].kd_d120));
                mtisy6.push(parseInt(data[i].kd_d24));
                mtisy6.push(parseInt(data[i].kd_d72));


                mtsy.push(parseInt(data[i].kd_d0));
                mtsy.push(parseInt(data[i].kd_d15));
                mtsy.push(parseInt(data[i].kd_d30));
                mtsy.push(parseInt(data[i].kd_d45));
                mtsy.push(parseInt(data[i].kd_d60));
                mtsy.push(parseInt(data[i].kd_d75));
                mtsy.push(parseInt(data[i].kd_d90));
                mtsy.push(parseInt(data[i].kd_d105));
                mtsy.push(parseInt(data[i].kd_d120));
                mtsy.push(parseInt(data[i].kd_d24));
                mtsy.push(parseInt(data[i].kd_d72));

            }

                    var chartdata = {
                        labels: it,
                        datasets: [

                            {
                                label: 'An. gambiae s.l',
                                fill: false,
                                backgroundColor: randomColor(),
                                hoverBorderColor: randomColor(),
                                data: kd_d0
                            },
                            
                            {
                                label: 'An. funestus',
                                fill: false,
                                backgroundColor: randomColor(),
                                hoverBorderColor: randomColor(),
                                data: kd_d15
                            },
                            
                            {
                                label: 'An. coustani',
                                fill: false,
                                backgroundColor: randomColor(),
                                hoverBorderColor: randomColor(),
                                data: kd_d30
                            },
                            {
                                label: 'An. pharoensis',
                                fill: false,
                                backgroundColor: randomColor(),
                                hoverBorderColor: randomColor(),
                                data: kd_d45
                            },
                            
                             {
                                label: 'An. squamosus',
                                fill: false,
                                backgroundColor: randomColor(),
                                hoverBorderColor: randomColor(),
                                data: kd_d60
                            }
                            
                            //  {
                            //     label: 'An. maculipalpis',
                            //     fill: false,
                            //     backgroundColor: randomColor(),
                            //     hoverBorderColor: randomColor(),
                            //     data: l1
                            // },
                            
                            

                            // {
                            //     label: 'An. pretoriensis',
                            //     fill: false,
                            //     backgroundColor: randomColor(),
                            //     hoverBorderColor: randomColor(),
                            //     data: l1
                            // },
                            // {
                            //     label: 'An. paludis',
                            //     fill: false,
                            //     backgroundColor: randomColor(),
                            //     hoverBorderColor: randomColor(),
                            //     data: l2
                            // },
                            // {
                            //     label:'An. wellcomei',
                            //     fill: false,
                            //     backgroundColor: randomColor(),
                            //     hoverBorderColor: randomColor(),
                            //     data: l3
                            // },
                            // {
                            //     label:'An. ziemanni',
                            //     fill: false,
                            //     backgroundColor: randomColor(),
                            //     hoverBorderColor: randomColor(),
                            //     data: l4
                            // },
                            // {
                            //     label:'An. rufipes',
                            //     fill: false,
                            //     backgroundColor: randomColor(),
                            //     hoverBorderColor: randomColor(),
                            //     data: l1l2
                            // },
                            // {
                            //     label:  
                            //    'An. implexus',
                            //     fill: false,
                            //     backgroundColor: randomColor(),
                            //     hoverBorderColor: randomColor(),
                            //     data: l1
                            // }
                        ]
                    };




                    $('#tblf4ss3').html(tabledata(chartdata));


            
            var type = ctype;

            if (type == "B") {

                $("#canvasf4ss3").show();
                $("#canvasf4ss3l").hide();
                $("#canvasf4ss3p").hide();
                $("#canvasf4ss3d").hide();
                var canvas = $("#canvasf4ss3");
                BarChart(canvas, chartdata, "CDC Resistance: Mortality vs Insecticide Tested");

            } 
            if (type == "L") {

                $("#canvasf4ss3").hide();
                $("#canvasf4ss3l").show();
                $("#canvasf4ss3p").hide();
                $("#canvasf4ss3d").hide();
                var canvas = $("#canvasf4ss3l");
                LineChart(canvas, chartdata, "CDC Resistance: Mortality vs Insecticide Tested");


            } else if (type == "P") {

                $("#canvasf4ss3").hide();
                $("#canvasf4ss3l").hide();
                $("#canvasf4ss3p").show();
                $("#canvasf4ss3d").hide();
                var canvas = $("#canvasf4ss3p");
                PieChart(canvas, chartdata, "CDC Resistance: Mortality vs Insecticide Tested");

            } else if (type == "D") {

                $("#canvasf4ss3").hide();
                $("#canvasf4ss3l").hide();
                $("#canvasf4ss3p").hide();
                $("#canvasf4ss3d").show();
                var canvas = $("#canvasf4ss3d");
                PolarChart(canvas, chartdata, "CDC Resistance: Mortality vs Insecticide Tested");


            }

            $('#tblf4ss3').html(tabledata(chartdata));
        },
        error: function (data) {
            console.log("Request f4req_ss3 error");
            console.log(data);
        },
        complete: function (data) {
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf4ss3').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');
        
        }


    });
 }




 //f5req_ss3

function f5req_ss3(ctype) {
    $.ajax({
        url: "data2.php?q=f5req_ss3",
        method: "GET",

        dataType: 'json',
        success: function (data) {
            var mkd1 =[];
            var mkd2 =[];
            var mkd3 =[];
            var mkd4 =[];
            var mkd5 =[];
            var mkd6 =[];
            var mkd7 =[];
            var mkd8 =[];
            var mkd9 =[];
            var mkd10 = [];
            var mkd11 =[];
            var mkd12 =[];
            var mkd13 =[];
            var mkd14 =[];
            var mkd15 =[];
            var mkd16 =[];
            var mkd17 =[];
            var mkd18 =[];
            var mkd19 =[];

            var mkd20 =[];
         

            var mt1 = [];
            var mt2 =[];
            var mt3 = [];
            var mt4 =[];
            var it = [];
            
         
            // var labelname = ["Mos KD 3Omin", "Mos KD 60min", "Mos KD Day1", "Mos KD Day2", "Mos KD Day3","Mos KD 30min",
            // "Mos KD 60min","Mos KD Day1","Mos KD Day2",
            //  "Mos KD Day3", "Mos KD 30min", "Mos KD 60min", "Mos KD Day1", "Mos KD Day2","Mos KD 30min","Mos KD 60min","Mos KD Day1",
            //  "Mos KD Day1", "Mos KD Day2", "Mos KD Day3"];

      
                
            for (var i in data) {
                it.push(parseInt(data[i].it));
                mt1.push(parseInt(data[i].mkd1));
                mt1.push(parseInt(data[i].mkd2));
                mt1.push(parseInt(data[i].mkd3));
                mt1.push(parseInt(data[i].mkd4));
                mt1.push(parseInt(data[i].mkd5));
           
                mt2.push(parseInt(data[i].mkd6));
                mt2.push(parseInt(data[i].mkd7));
                mt2.push(parseInt(data[i].mkd8));
                mt2.push(parseInt(data[i].mkd9));
                mt2.push(parseInt(data[i].mkd10));
           

                mt3.push(parseInt(data[i].mkd11));
                mt3.push(parseInt(data[i].mkd12));
                mt3.push(parseInt(data[i].mkd13));
                mt3.push(parseInt(data[i].mkd14));
                mt3.push(parseInt(data[i].mkd15));
           

       
                mt4.push(parseInt(data[i].mkd16));
                mt4.push(parseInt(data[i].mkd17));
                mt4.push(parseInt(data[i].mkd18));
                mt4.push(parseInt(data[i].mkd19));
                mt4.push(parseInt(data[i].mkd20));
           

            }
           
          

            // var dataset = mt1, mt2, mt3,mt4;
            // var labels = labelname;

            // var list = [];

            // list = sortdata(dataset, labels);

            // for (var k = 0; k < list.length; k++) {
            //     dataset[k] = list[k].data;
            //     labels[k] = list[k].label;
            // }


        
            var chartdata = {
                labels: it,
                datasets: [

                    {
                        label: 'An. gambiae s.l',
                        fill: false,
                        backgroundColor: randomColor(),
                        hoverBorderColor: randomColor(),
                        data: mkd1
                    },
                    
                    {
                        label: 'An. funestus',
                        fill: false,
                        backgroundColor: randomColor(),
                        hoverBorderColor: randomColor(),
                        data: mkd2
                    },
                    
                    {
                        label: 'An. coustani',
                        fill: false,
                        backgroundColor: randomColor(),
                        hoverBorderColor: randomColor(),
                        data: mkd3
                    },
                    {
                        label: 'An. pharoensis',
                        fill: false,
                        backgroundColor: randomColor(),
                        hoverBorderColor: randomColor(),
                        data: mkd4
                    },
                    
                     {
                        label: 'An. squamosus',
                        fill: false,
                        backgroundColor: randomColor(),
                        hoverBorderColor: randomColor(),
                        data: mkd4
                    }
                    
                    //  {
                    //     label: 'An. maculipalpis',
                    //     fill: false,
                    //     backgroundColor: randomColor(),
                    //     hoverBorderColor: randomColor(),
                    //     data: l1
                    // },
                    
                    

                    // {
                    //     label: 'An. pretoriensis',
                    //     fill: false,
                    //     backgroundColor: randomColor(),
                    //     hoverBorderColor: randomColor(),
                    //     data: l1
                    // },
                    // {
                    //     label: 'An. paludis',
                    //     fill: false,
                    //     backgroundColor: randomColor(),
                    //     hoverBorderColor: randomColor(),
                    //     data: l2
                    // },
                    // {
                    //     label:'An. wellcomei',
                    //     fill: false,
                    //     backgroundColor: randomColor(),
                    //     hoverBorderColor: randomColor(),
                    //     data: l3
                    // },
                    // {
                    //     label:'An. ziemanni',
                    //     fill: false,
                    //     backgroundColor: randomColor(),
                    //     hoverBorderColor: randomColor(),
                    //     data: l4
                    // },
                    // {
                    //     label:'An. rufipes',
                    //     fill: false,
                    //     backgroundColor: randomColor(),
                    //     hoverBorderColor: randomColor(),
                    //     data: l1l2
                    // },
                    // {
                    //     label:  
                    //    'An. implexus',
                    //     fill: false,
                    //     backgroundColor: randomColor(),
                    //     hoverBorderColor: randomColor(),
                    //     data: l1
                    // }
                ]
            };








                    $('#tblf5ss3').html(tabledata(chartdata));


            
            var type = ctype;

            if (type == "B") {

                $("#canvasf5ss3").show();
                $("#canvasf5ss3l").hide();
                $("#canvasf5ss3p").hide();
                $("#canvasf5ss3d").hide();
                var canvas = $("#canvasf5ss3");
                BarChart(canvas, chartdata, "WHO CONE Resistance: Mortality vs Insecticide Tested");

            } 
            if (type == "L") {

                $("#canvasf5ss3").hide();
                $("#canvasf5ss3l").show();
                $("#canvasf5ss3p").hide();
                $("#canvasf5ss3d").hide();
                var canvas = $("#canvasf5ss3l");
                LineChart(canvas, chartdata, "WHO CONE Resistance: Mortality vs Insecticide Tested");


            } else if (type == "P") {

                $("#canvasf5ss3").hide();
                $("#canvasf5ss3l").hide();
                $("#canvasf5ss3p").show();
                $("#canvasf5ss3d").hide();
                var canvas = $("#canvasf5ss3p");
                PieChart(canvas, chartdata, "WHO CONE Resistance: Mortality vs Insecticide Tested");

            } else if (type == "D") {

                $("#canvasf5ss3").hide();
                $("#canvasf5ss3l").hide();
                $("#canvasf5ss3p").hide();
                $("#canvasf5ss3d").show();
                var canvas = $("#canvasf5ss3d");
                PolarChart(canvas, chartdata, "WHO CONE Resistance: Mortality vs Insecticide Tested");


            }

            $('#tblf5ss3').html(tabledata(chartdata));
        },
        error: function (data) {
            console.log("Request f5req_ss3 error");
            console.log(data);
        },
        complete: function (data) {
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf5ss3').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');
        
        }


    });
 }



 //f6req_ss3


 function f6req_ss3(ctype) {
    $.ajax({
        url: "data2.php?q=f6req_ss3",
        method: "GET",

        dataType: 'json',
        success: function (data) {
            var it = [];
            var mtir1 = [];
            var mtir2 =[];
            var mtir3 = [];
            var mtir4 =[];
            var mtir5 = [];
            var mtir6 =[];
            var mtsr1 =[];
            var mtsr2 =[];
            var mtsr3 =[];
            var mtsr4 =[];
            var kd_d1d = [];
            var kd_d2d = [];
            var kd_d3d = [];
            var kd_d3d = [];
            var kd_d4d = [];
            var kd_d5d = [];
            var kd_d6d = [];
            var kd_d7d = [];
         
            // var labelname = ["Mos KD Day1", "Mos KD Day2", "Mos KD Day3", "Mos KD Day4", "Mos KD Day5","Mos KD Day6","Mos KD Day7"];

            for (var i in data) {
                it.push(parseInt(data[i].it));
                mtir1.push(parseInt(data[i].kd_d1d));
                mtir1.push(parseInt(data[i].kd_d2d));
                mtir1.push(parseInt(data[i].kd_d3d));
                mtir1.push(parseInt(data[i].kd_d4d));
                mtir1.push(parseInt(data[i].kd_d5d));
                mtir1.push(parseInt(data[i].kd_d6d));
                mtir1.push(parseInt(data[i].kd_d7d));
           
                mtir2.push(parseInt(data[i].kd_d1d));
                mtir2.push(parseInt(data[i].kd_d2d));
                mtir2.push(parseInt(data[i].kd_d3d));
                mtir2.push(parseInt(data[i].kd_d4d));
                mtir2.push(parseInt(data[i].kd_d5d));
                mtir2.push(parseInt(data[i].kd_d6d));
                mtir2.push(parseInt(data[i].kd_d7d));

                mtir3.push(parseInt(data[i].kd_d1d));
                mtir3.push(parseInt(data[i].kd_d2d));
                mtir3.push(parseInt(data[i].kd_d3d));
                mtir3.push(parseInt(data[i].kd_d4d));
                mtir3.push(parseInt(data[i].kd_d5d));
                mtir3.push(parseInt(data[i].kd_d6d));
                mtir3.push(parseInt(data[i].kd_d7d));
           
                mtir4.push(parseInt(data[i].kd_d1d));
                mtir4.push(parseInt(data[i].kd_d2d));
                mtir4.push(parseInt(data[i].kd_d3d));
                mtir4.push(parseInt(data[i].kd_d4d));
                mtir4.push(parseInt(data[i].kd_d5d));
                mtir4.push(parseInt(data[i].kd_d6d));
                mtir4.push(parseInt(data[i].kd_d7d));

                mtir5.push(parseInt(data[i].kd_d1d));
                mtir5.push(parseInt(data[i].kd_d2d));
                mtir5.push(parseInt(data[i].kd_d3d));
                mtir5.push(parseInt(data[i].kd_d4d));
                mtir5.push(parseInt(data[i].kd_d5d));
                mtir5.push(parseInt(data[i].kd_d6d));
                mtir5.push(parseInt(data[i].kd_d7d));
           
                mtir6.push(parseInt(data[i].kd_d1d));
                mtir6.push(parseInt(data[i].kd_d2d));
                mtir6.push(parseInt(data[i].kd_d3d));
                mtir6.push(parseInt(data[i].kd_d4d));
                mtir6.push(parseInt(data[i].kd_d5d));
                mtir6.push(parseInt(data[i].kd_d6d));
                mtir6.push(parseInt(data[i].kd_d7d));

                mtsr1.push(parseInt(data[i].kd_d1d));
                mtsr1.push(parseInt(data[i].kd_d2d));
                mtsr1.push(parseInt(data[i].kd_d3d));
                mtsr1.push(parseInt(data[i].kd_d4d));
                mtsr1.push(parseInt(data[i].kd_d5d));
                mtsr1.push(parseInt(data[i].kd_d6d));
                mtsr1.push(parseInt(data[i].kd_d7d));

                mtsr2.push(parseInt(data[i].kd_d1d));
                mtsr2.push(parseInt(data[i].kd_d2d));
                mtsr2.push(parseInt(data[i].kd_d3d));
                mtsr2.push(parseInt(data[i].kd_d4d));
                mtsr2.push(parseInt(data[i].kd_d5d));
                mtsr2.push(parseInt(data[i].kd_d6d));
                mtsr2.push(parseInt(data[i].kd_d7d));

                mtsr3.push(parseInt(data[i].kd_d1d));
                mtsr3.push(parseInt(data[i].kd_d2d));
                mtsr3.push(parseInt(data[i].kd_d3d));
                mtsr3.push(parseInt(data[i].kd_d4d));
                mtsr3.push(parseInt(data[i].kd_d5d));
                mtsr3.push(parseInt(data[i].kd_d6d));
                mtsr3.push(parseInt(data[i].kd_d7d));

                mtsr4.push(parseInt(data[i].kd_d1d));
                mtsr4.push(parseInt(data[i].kd_d2d));
                mtsr4.push(parseInt(data[i].kd_d3d));
                mtsr4.push(parseInt(data[i].kd_d4d));
                mtsr4.push(parseInt(data[i].kd_d5d));
                mtsr4.push(parseInt(data[i].kd_d6d));
                mtsr4.push(parseInt(data[i].kd_d7d));
            }
           
          
            var chartdata = {
                labels: it,
                datasets: [

                    {
                        label: 'An. gambiae s.l',
                        fill: false,
                        backgroundColor: randomColor(),
                        hoverBorderColor: randomColor(),
                        data:kd_d1d
                    },
                    
                    {
                        label: 'An. funestus',
                        fill: false,
                        backgroundColor: randomColor(),
                        hoverBorderColor: randomColor(),
                        data: kd_d2d
                    },
                    
                    {
                        label: 'An. coustani',
                        fill: false,
                        backgroundColor: randomColor(),
                        hoverBorderColor: randomColor(),
                        data: kd_d3d
                    },
                    {
                        label: 'An. pharoensis',
                        fill: false,
                        backgroundColor: randomColor(),
                        hoverBorderColor: randomColor(),
                        data: kd_d4d
                    },
                    
                     {
                        label: 'An. squamosus',
                        fill: false,
                        backgroundColor: randomColor(),
                        hoverBorderColor: randomColor(),
                        data: kd_d5d
                    }
                    
                ]
            };

                    $('#tblf6ss3').html(tabledata(chartdata));


            
            var type = ctype;

            if (type == "B") {

                $("#canvasf6ss3").show();
                $("#canvasf6ss3l").hide();
                $("#canvasf6ss3p").hide();
                $("#canvasf6ss3d").hide();
                var canvas = $("#canvasf6ss3");
                BarChart(canvas, chartdata, "WHO TUBE Resistance: Mortality vs Insecticide Tested");

            } 
            if (type == "L") {

                $("#canvasf6ss3").hide();
                $("#canvasf6ss3l").show();
                $("#canvasf6ss3p").hide();
                $("#canvasf6ss3d").hide();
                var canvas = $("#canvasf6ss3l");
                LineChart(canvas, chartdata, "WHO TUBE Resistance: Mortality vs Insecticide Tested");


            } else if (type == "P") {

                $("#canvasf6ss3").hide();
                $("#canvasf6ss3l").hide();
                $("#canvasf6ss3p").show();
                $("#canvasf6ss3d").hide();
                var canvas = $("#canvasf6ss3p");
                PieChart(canvas, chartdata, "WHO TUBE Resistance: Mortality vs Insecticide Tested");

            } else if (type == "D") {

                $("#canvasf6ss3").hide();
                $("#canvasf6ss3l").hide();
                $("#canvasf6ss3p").hide();
                $("#canvasf6ss3d").show();
                var canvas = $("#canvasf6ss3d");
                PolarChart(canvas, chartdata, "WHO TUBE Resistance: Mortality vs Insecticide Tested");


            }

            $('#tblf6ss3').html(tabledata(chartdata));
        },
        error: function (data) {
            console.log("Request f6req_ss3 error");
            console.log(data);
        },
        complete: function (data) {
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf6ss3').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');
        
        }


    });
 }



//ss4
function f1req_ss4(ctype) {
    $.ajax({
        url: "data2.php?q=f1req_ss4",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var dt = [];
            var species1 = [];
            var species2 = [];

            for (var i in data) {
                dt.push(data[i].DT);
                species1.push(data[i].Biomphalari);
                species2.push(data[i].Bulinus);
            }

            var chartdata = {
                labels: dt,
                datasets: [{
                        label: 'Biomphalari',
                        fill: false,
                        data: species1
                    },
                    {

                        label: 'Bulinus',
                        fill: false,
                        data: species2
                    }
                ]
            };


            var type = ctype;

            if (type == "B") {

                $("#canvasf1ss4").show();
                $("#canvasf1ss4l").hide();
                $("#canvasf1ss4p").hide();
                $("#canvasf1ss4d").hide();
                var canvas = $("#canvasf1ss4");
                BarChart(canvas, chartdata, "Daily Snails Caught");

            }
            if (type == "L") {

                $("#canvasf1ss4").hide();
                $("#canvasf1ss4l").show();
                $("#canvasf1ss4p").hide();
                $("#canvasf1ss4d").hide();
                var canvas = $("#canvasf1ss4l");
                LineChart(canvas, chartdata, "Daily Snails Caught");


            } else if (type == "P") {

                $("#canvasf1ss4").hide();
                $("#canvasf1ss4l").hide();
                $("#canvasf1ss4p").show();
                $("#canvasf1ss4d").hide();
                var canvas = $("#canvasf1ss4p");
                PieChart(canvas, chartdata, "Daily Snails Caught");

            } else if (type == "D") {

                $("#canvasf1ss4").hide();
                $("#canvasf1ss4l").hide();
                $("#canvasf1ss4p").hide();
                $("#canvasf1ss4d").show();
                var canvas = $("#canvasf1ss4d");
                PolarChart(canvas, chartdata, "Daily Snails Caught");


            }

            $('#tblf1ss4').html(tabledata(chartdata));

            if (data.length == 0) {
                $('#loadnonef1ss4').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }

        },
        error: function (data) {
            $('#loadnonef1ss4').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            console.log("Request f1ss4req error");
            console.log(data);
        },
        complete: function (data) {
            console.log("Request f1ss4req done");
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf1ss4').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');
        }


    });
}

function f2req_ss4(ctype) {
    $.ajax({
        url: "data2.php?q=f2req_ss4",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var species1 = [];
            var species2 = [];
            var DT = [];

            for (var i in data) {
                species1.push(data[i].Biomphalari);
                species2.push(data[i].Bulinus);
                DT.push(data[i].weekyear);
            }

            var chartdata = {
                labels: DT,
                datasets: [{
                        label: 'Biomphalari',
                        fill: false,
                        data: species1
                    },
                    {

                        label: 'Bulinus',
                        fill: false,
                        data: species2
                    }
                ]
            };


            var type = ctype;

            if (type == "B") {

                $("#canvasf2ss4").show();
                $("#canvasf2ss4l").hide();
                $("#canvasf2ss4p").hide();
                $("#canvasf2ss4d").hide();
                var canvas = $("#canvasf2ss4");
                BarChart(canvas, chartdata, "Snail Weekly Summary");

            }
            if (type == "L") {

                $("#canvasf2ss4").hide();
                $("#canvasf2ss4l").show();
                $("#canvasf2ss4p").hide();
                $("#canvasf2ss4d").hide();
                var canvas = $("#canvasf2ss4l");
                LineChart(canvas, chartdata, "Snail Weekly Summary");


            } else if (type == "P") {

                $("#canvasf2ss4").hide();
                $("#canvasf2ss4l").hide();
                $("#canvasf2ss4p").show();
                $("#canvasf2ss4d").hide();
                var canvas = $("#canvasf2ss4p");
                PieChart(canvas, chartdata, "Snail Weekly Summary");

            } else if (type == "D") {

                $("#canvasf2ss4").hide();
                $("#canvasf2ss4l").hide();
                $("#canvasf2ss4p").hide();
                $("#canvasf2ss4d").show();
                var canvas = $("#canvasf2ss4d");
                PolarChart(canvas, chartdata, "Snail Weekly Summary");


            }

            $('#tblf2ss4').html(tabledata(chartdata));

            if (data.length == 0) {
                $('#loadnonef2ss4').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }

        },
        error: function (data) {
            $('#loadnonef2ss4').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            console.log("Request f2ss4req error");
            console.log(data);
        },
        complete: function (data) {
            console.log("Request f2ss4req done");
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf2ss4').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');

        }


    });
}

function f3req_ss4(ctype) {
    $.ajax({
        url: "data2.php?q=f3req_ss4",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var dt = [];
            var species1 = [];
            var species2 = [];

            for (var i in data) {
                dt.push(data[i].DT);
                species1.push(data[i].Biomphalari);
                species2.push(data[i].Bulinus);
            }

            var chartdata = {
                labels: dt,
                datasets: [{
                        label: 'Biomphalari',
                        fill: false,
                        data: species1
                    },
                    {

                        label: 'Bulinus',
                        fill: false,
                        data: species2
                    }
                ]
            };


            var type = ctype;

            if (type == "B") {

                $("#canvasf3ss4").show();
                $("#canvasf3ss4l").hide();
                $("#canvasf3ss4p").hide();
                $("#canvasf3ss4d").hide();
                var canvas = $("#canvasf3ss4");
                BarChart(canvas, chartdata, "Monthly Snails Caught");

            }
            if (type == "L") {

                $("#canvasf3ss4").hide();
                $("#canvasf3ss4l").show();
                $("#canvasf3ss4p").hide();
                $("#canvasf3ss4d").hide();
                var canvas = $("#canvasf3ss4l");
                LineChart(canvas, chartdata, "Monthly Snails Caught");


            } else if (type == "P") {

                $("#canvasf3ss4").hide();
                $("#canvasf3ss4l").hide();
                $("#canvasf3ss4p").show();
                $("#canvasf3ss4d").hide();
                var canvas = $("#canvasf3ss4p");
                PieChart(canvas, chartdata, "Monthly Snails Caught");

            } else if (type == "D") {

                $("#canvasf3ss4").hide();
                $("#canvasf3ss4l").hide();
                $("#canvasf3ss4p").hide();
                $("#canvasf3ss4d").show();
                var canvas = $("#canvasf3ss4d");
                PolarChart(canvas, chartdata, "Monthly Snails Caught");


            }

            $('#tblf3ss4').html(tabledata(chartdata));

            if (data.length == 0) {
                $('#loadnonef3ss4').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }

        },
        error: function (data) {
            $('#loadnonef3ss4').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            console.log("Request f3ss4req error");
            console.log(data);
        },
        complete: function (data) {
            console.log("Request f3ss4req done");
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf3ss4').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');

        }


    });
}

function f4req_ss4(ctype) {
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
                    data: total

                }]
            };

            var type = ctype;

            if (type == "B") {

                $("#canvasf4ss4").show();
                $("#canvasf4ss4l").hide();
                $("#canvasf4ss4p").hide();
                $("#canvasf4ss4d").hide();
                var canvas = $("#canvasf4ss4");
                hBarChart(canvas, chartdata, "Snail Population Summary");

            }
            if (type == "L") {

                $("#canvasf4ss4").hide();
                $("#canvasf4ss4l").show();
                $("#canvasf4ss4p").hide();
                $("#canvasf4ss4d").hide();
                var canvas = $("#canvasf4ss4l");
                LineChart(canvas, chartdata, "Snail Population Summary");


            } else if (type == "P") {

                $("#canvasf4ss4").hide();
                $("#canvasf4ss4l").hide();
                $("#canvasf4ss4p").show();
                $("#canvasf4ss4d").hide();
                var canvas = $("#canvasf4ss4p");
                PieChart(canvas, chartdata, "Snail Population Summary");

            } else if (type == "D") {

                $("#canvasf4ss4").hide();
                $("#canvasf4ss4l").hide();
                $("#canvasf4ss4p").hide();
                $("#canvasf4ss4d").show();
                var canvas = $("#canvasf4ss4d");
                PolarChart(canvas, chartdata, "Snail Population Summary");


            }

            $('#tblf4ss4').html(tabledata(chartdata));

            if (data.length == 0) {
                $('#loadnonef4ss4').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }

        },
        error: function (data) {
            $('#loadnonef4ss4').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            console.log("Request f4ss4req error");
            console.log(data);
        },
        complete: function (data) {
            console.log("Request f4ss4req done");
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#loadf4ss4').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');

        }


    });
}


//descriptive ED1

function f1req_ed1() {
    $.ajax({
        url: "datahome.php?q=f1req_ed1",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var field = [];
            var frequency = [];

            for (var i in data) {
                field.push(data[i].ea);
                frequency.push(data[i].frequency);

            }

            var chartdata = {
                labels: field,
                datasets: [{
                    label: 'Enumeration area Frequency',
                    data: frequency
                }]
            };

            var canvas = $("#hcanvas1");

            hBarChart(canvas, chartdata, "");

            if (data.length == 0) {
                $('#loadnoneh1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }


        },
        error: function (data) {
            $('#loadnoneh1').html('<div class="bg-danger has-padding text-center">No data available!</div>');
        },
        complete: function (data) {
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#hload1').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');
        }


    });
}

function f2req_ed1() {
    $.ajax({
        url: "datahome.php?q=f2req_ed1",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var field = [];
            var frequency = [];


            for (var i in data) {
                field.push(data[i].cr);
                frequency.push(data[i].frequency);

            }

            var chartdata = {
                labels: field,
                datasets: [{
                    label: 'Cluster Frequency',
                    data: frequency
                }]

            };

            var canvas = $("#hcanvas2");

            hBarChart(canvas, chartdata, "");

            if (data.length == 0) {
                $('#loadnoneh2').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }


        },
        error: function (data) {
            $('#loadnoneh2').html('<div class="bg-danger has-padding text-center">No data available!</div>');
        },
        complete: function (data) {
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#hload2').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');

        }


    });
}

function f3req_ed1() {
    $.ajax({
        url: "datahome.php?q=f3req_ed1",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var field = [];
            var frequency = [];

            for (var i in data) {
                field.push(data[i].cp);
                frequency.push(data[i].frequency);

            }

            var chartdata = {
                labels: field,
                datasets: [

                    {
                        label: 'Compound Frequency',
                        data: frequency
                    }
                ]

            };

            var canvas = $("#hcanvas3");

            hBarChart(canvas, chartdata, "");

            if (data.length == 0) {
                $('#loadnoneh3').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }


        },
        error: function (data) {
            $('#loadnoneh3').html('<div class="bg-danger has-padding text-center">No data available!</div>');
        },
        complete: function (data) {
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#hload3').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');

        }


    });
}

function f4req_ed1() {
    $.ajax({
        url: "datahome.php?q=f4req_ed1",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var field = [];
            var frequency = [];

            for (var i in data) {
                field.push(data[i].me);
                frequency.push(data[i].frequency);

            }

            var chartdata = {
                labels: field,
                datasets: [

                    {
                        label: 'Method Frequency',
                        data: frequency
                    }
                ]

            };

            var canvas = $("#hcanvas4");

            hBarChart(canvas, chartdata, "");

            if (data.length == 0) {
                $('#loadnoneh4').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }


        },
        error: function (data) {
            $('#loadnoneh4').html('<div class="bg-danger has-padding text-center">No data available!</div>');
        },
        complete: function (data) {
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#hload4').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');

        }


    });
}

function f5req_ed1() {
    $.ajax({
        url: "datahome.php?q=f5req_ed1",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var field = [];
            var frequency = [];

            for (var i in data) {
                field.push(data[i].ind);
                frequency.push(data[i].frequency);

            }

            var chartdata = {
                labels: field,
                datasets: [

                    {
                        label: 'Location Frequency',
                        data: frequency
                    }
                ]

            };

            var canvas = $("#hcanvas5");

            hBarChart(canvas, chartdata, "");

            if (data.length == 0) {
                $('#loadnoneh5').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }


        },
        error: function (data) {
            $('#loadnoneh5').html('<div class="bg-danger has-padding text-center">No data available!</div>');
        },
        complete: function (data) {
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#hload5').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');

        }


    });
}

function f6req_ed1() {
    $.ajax({
        url: "datahome.php?q=f6req_ed1",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var field = [];
            var frequency = [];

            for (var i in data) {
                field.push(data[i].st);
                frequency.push(data[i].frequency);

            }

            var chartdata = {
                labels: field,
                datasets: [

                    {
                        label: 'Start time Frequency',
                        data: frequency
                    }
                ]

            };

            var canvas = $("#hcanvas6");

            BarChart(canvas, chartdata, "");

            if (data.length == 0) {
                $('#loadnoneh6').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }


        },
        error: function (data) {
            $('#loadnoneh6').html('<div class="bg-danger has-padding text-center">No data available!</div>');
        },
        complete: function (data) {
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#hload6').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');

        }


    });
}

function f7req_ed1() {
    $.ajax({
        url: "datahome.php?q=f7req_ed1",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var field = [];
            var frequency = [];

            for (var i in data) {
                field.push(data[i].ft);
                frequency.push(data[i].frequency);

            }

            var chartdata = {
                labels: field,
                datasets: [

                    {
                        label: 'Finish time Frequency',
                        data: frequency
                    }
                ]

            };

            var canvas = $("#hcanvas7");

            BarChart(canvas, chartdata, "");

            if (data.length == 0) {
                $('#loadnoneh7').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }


        },
        error: function (data) {
            $('#loadnoneh7').html('<div class="bg-danger has-padding text-center">No data available!</div>');
        },
        complete: function (data) {
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#hload7').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');

        }


    });
}

function f8req_ed1() {
    $.ajax({
        url: "datahome.php?q=f8req_ed1",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var field = [];
            var frequency = [];

            for (var i in data) {
                field.push(data[i].rnd);
                frequency.push(data[i].frequency);

            }

            var chartdata = {
                labels: field,
                datasets: [

                    {
                        label: 'Round Frequency',
                        data: frequency
                    }
                ]

            };

            var canvas = $("#hcanvas8");

            hBarChart(canvas, chartdata, "");

            if (data.length == 0) {
                $('#loadnoneh8').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }


        },
        error: function (data) {
            $('#loadnoneh8').html('<div class="bg-danger has-padding text-center">No data available!</div>');
        },
        complete: function (data) {
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#hload8').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');

        }


    });
}

function f9req_ed1() {
    $.ajax({
        url: "datahome.php?q=f9req_ed1",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var field = [];
            var frequency = [];

            for (var i in data) {
                field.push(data[i].vi);
                frequency.push(data[i].frequency);

            }

            var chartdata = {
                labels: field,
                datasets: [

                    {
                        label: 'Volunteer initials Frequency',
                        data: frequency
                    }
                ]

            };

            var canvas = $("#hcanvas9");

            hBarChart(canvas, chartdata, "");

            if (data.length == 0) {
                $('#loadnoneh9').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }


        },
        error: function (data) {
            $('#loadnoneh9').html('<div class="bg-danger has-padding text-center">No data available!</div>');
        },
        complete: function (data) {
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#hload9').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');

        }


    });
}

function f10req_ed1() {
    $.ajax({
        url: "datahome.php?q=f10req_ed1",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var field = [];
            var frequency = [];

            for (var i in data) {
                field.push(data[i].hp);
                frequency.push(data[i].frequency);

            }

            var chartdata = {
                labels: field,
                datasets: [

                    {
                        label: 'Holding period Frequency',
                        data: frequency
                    }
                ]

            };

            var canvas = $("#hcanvas10");

            hBarChart(canvas, chartdata, "");

            if (data.length == 0) {
                $('#loadnoneh10').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }


        },
        error: function (data) {
            $('#loadnoneh10').html('<div class="bg-danger has-padding text-center">No data available!</div>');
        },
        complete: function (data) {
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#hload10').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');
        }


    });
}

function f11req_ed1() {
    $.ajax({
        url: "datahome.php?q=f11req_ed1",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var field = [];
            var frequency = [];

            for (var i in data) {
                field.push(data[i].blc);
                frequency.push(data[i].frequency);

            }

            var chartdata = {
                labels: field,
                datasets: [

                    {
                        label: 'Block Frequency',
                        data: frequency
                    }
                ]

            };

            var canvas = $("#hcanvas11");

            hBarChart(canvas, chartdata, "");

            if (data.length == 0) {
                $('#loadnoneh11').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }


        },
        error: function (data) {
            $('#loadnoneh11').html('<div class="bg-danger has-padding text-center">No data available!</div>');
        },
        complete: function (data) {
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#hload11').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');

        }


    });
}

function f12req_ed1() {
    $.ajax({
        url: "datahome.php?q=f12req_ed1",
        method: "GET",
        cache: true,
        dataType: 'json',
        success: function (data) {
            console.log(data);
            var field = [];
            var frequency = [];

            for (var i in data) {
                field.push(data[i].tr);
                frequency.push(data[i].frequency);

            }

            var chartdata = {
                labels: field,
                datasets: [

                    {
                        label: 'Treatment Frequency',
                        data: frequency
                    }
                ]

            };

            var canvas = $("#hcanvas12");

            hBarChart(canvas, chartdata, "");

            if (data.length == 0) {
                $('#loadnoneh12').html('<div class="bg-danger has-padding text-center">No data available!</div>');
            }


        },
        error: function (data) {
            $('#loadnoneh12').html('<div class="bg-danger has-padding text-center">No data available!</div>');
        },
        complete: function (data) {
            $('.loader').fadeOut();
        },
        beforeSend: function (data) {
            $('#hload12').html('<div class="loader"><div class="spinner"><div class="bounce1"></div> <div class="bounce2"></div> <div class="bounce3"></div> </div></div>');


        }


    });
}


function custom_taxon(data) {

    var tx1 = [];
    var tx2 = [];
    var tx3 = [];
    var tx4 = [];
    var tx5 = [];
    var tx6 = [];
    var tx7 = [];
    var tx8 = [];
    var tx9 = [];
    var tx10 = [];
    var tx11 = [];
    var tx12 = [];
    var tx70 = [];

    var dataset = [];

    for (var i in data) {
        tx1.push(data[i].An_gambiae);
        tx2.push(data[i].An_funestus);
        tx3.push(data[i].An_coustani);
        tx4.push(data[i].An_pharoensis);
        tx5.push(data[i].An_squamosus);
        tx6.push(data[i].An_maculipalpis);
        tx7.push(data[i].An_pretoriensis);
        tx8.push(data[i].An_paludis);
        tx9.push(data[i].An_wellcomei);
        tx10.push(data[i].An_ziemanni);
        tx11.push(data[i].An_rufipes);
        tx12.push(data[i].An_implexus);

        tx70.push(data[i].Aedes_sp);
    }


    tx1 = tx1.map(x => Number.parseInt(x, 10));
    var tx1sum = tx1.reduce((a, b) => a + b, 0)

    tx2 = tx2.map(x => Number.parseInt(x, 10));
    var tx2sum = tx2.reduce((a, b) => a + b, 0)

    tx3 = tx3.map(x => Number.parseInt(x, 10));
    var tx3sum = tx3.reduce((a, b) => a + b, 0)

    tx4 = tx4.map(x => Number.parseInt(x, 10));
    var tx4sum = tx4.reduce((a, b) => a + b, 0)

    tx5 = tx5.map(x => Number.parseInt(x, 10));
    var tx5sum = tx5.reduce((a, b) => a + b, 0)

    tx6 = tx6.map(x => Number.parseInt(x, 10));
    var tx6sum = tx6.reduce((a, b) => a + b, 0)

    tx7 = tx7.map(x => Number.parseInt(x, 10));
    var tx7sum = tx7.reduce((a, b) => a + b, 0)

    tx8 = tx8.map(x => Number.parseInt(x, 10));
    var tx8sum = tx8.reduce((a, b) => a + b, 0)

    tx9 = tx9.map(x => Number.parseInt(x, 10));
    var tx9sum = tx9.reduce((a, b) => a + b, 0)

    tx10 = tx10.map(x => Number.parseInt(x, 10));
    var tx10sum = tx10.reduce((a, b) => a + b, 0)

    tx11 = tx11.map(x => Number.parseInt(x, 10));
    var tx11sum = tx11.reduce((a, b) => a + b, 0)

    tx12 = tx12.map(x => Number.parseInt(x, 10));
    var tx12sum = tx12.reduce((a, b) => a + b, 0)


    var taxon1 = {
        label: 'An. gambiae s.l',
        pointRadius: 1,
        pointHoverRadius: 2,
        lineTension: 0.1,
        fill: false,
        data: tx1
    };

    var taxon2 = {
        label: 'An. funestus',
        pointRadius: 1,
        pointHoverRadius: 2,
        lineTension: 0.1,
        fill: false,
        data: tx2
    };

    var taxon3 = {
        label: 'An. coustani',
        pointRadius: 1,
        pointHoverRadius: 2,
        lineTension: 0.1,
        fill: false,
        data: tx3
    };

    var taxon4 = {
        label: 'An. pharoensis',
        pointRadius: 1,
        pointHoverRadius: 2,
        lineTension: 0.1,
        fill: false,
        data: tx4
    };

    var taxon5 = {
        label: 'An. squamosus',
        pointRadius: 1,
        pointHoverRadius: 2,
        lineTension: 0.1,
        fill: false,
        data: tx5
    };

    var taxon6 = {
        label: 'An. maculipalpis',
        pointRadius: 1,
        pointHoverRadius: 2,
        lineTension: 0.1,
        fill: false,
        data: tx6
    };

    var taxon7 = {
        label: 'An. pretoriensis',
        pointRadius: 1,
        pointHoverRadius: 2,
        lineTension: 0.1,
        fill: false,
        data: tx7
    };

    var taxon8 = {
        label: 'An. paludis',
        pointRadius: 1,
        pointHoverRadius: 2,
        lineTension: 0.1,
        fill: false,
        data: tx8
    };

    var taxon9 = {
        label: 'An. wellcomei',
        pointRadius: 1,
        pointHoverRadius: 2,
        lineTension: 0.1,
        fill: false,
        data: tx9
    };

    var taxon10 = {
        label: 'An. ziemanni',
        pointRadius: 1,
        pointHoverRadius: 2,
        lineTension: 0.1,
        fill: false,
        data: tx10
    };

    var taxon11 = {
        label: 'An. rufipes',
        pointRadius: 1,
        pointHoverRadius: 2,
        lineTension: 0.1,
        fill: false,
        data: tx11
    };

    var taxon12 = {
        label: 'An. implexus',
        pointRadius: 1,
        pointHoverRadius: 2,
        lineTension: 0.1,
        fill: false,
        data: tx12
    };



    if (tx1sum > 0) {
        dataset.push(taxon1);
    }
    if (tx2sum > 0) {
        dataset.push(taxon2);
    }
    if (tx3sum > 0) {
        dataset.push(taxon3);
    }
    if (tx4sum > 0) {
        dataset.push(taxon4);
    }
    if (tx5sum > 0) {
        dataset.push(taxon5);
    }
    if (tx6sum > 0) {
        dataset.push(taxon6);
    }
    if (tx7sum > 0) {
        dataset.push(taxon7);
    }
    if (tx8sum > 0) {
        dataset.push(taxon8);
    }
    if (tx9sum > 0) {
        dataset.push(taxon9);
    }
    if (tx10sum > 0) {
        dataset.push(taxon10);
    }
    if (tx11sum > 0) {
        dataset.push(taxon11);
    }
    if (tx12sum > 0) {
        dataset.push(taxon12);
    }

    return dataset;

}

function custom_taxonc(data) {

    var tx1 = [];
    var tx2 = [];
    var tx3 = [];
    var tx4 = [];


    var dataset = [];

    for (var i in data) {
        tx1.push(data[i].culex);
        tx2.push(data[i].mansonia);
        tx3.push(data[i].aedes);
        tx4.push(data[i].coquilettidia);
    }


    tx1 = tx1.map(x => Number.parseInt(x, 10));
    var tx1sum = tx1.reduce((a, b) => a + b, 0)

    tx2 = tx2.map(x => Number.parseInt(x, 10));
    var tx2sum = tx2.reduce((a, b) => a + b, 0)

    tx3 = tx3.map(x => Number.parseInt(x, 10));
    var tx3sum = tx3.reduce((a, b) => a + b, 0)

    tx4 = tx4.map(x => Number.parseInt(x, 10));
    var tx4sum = tx4.reduce((a, b) => a + b, 0)




    var taxon1 = {
        label: 'Culex sp.',
        pointRadius: 1,
        pointHoverRadius: 2,
        lineTension: 0.1,
        fill: false,
        data: tx1
    };

    var taxon2 = {
        label: 'Mansonia sp.',
        pointRadius: 1,
        pointHoverRadius: 2,
        lineTension: 0.1,
        fill: false,
        data: tx2
    };

    var taxon3 = {
        label: 'Aedes sp.',
        pointRadius: 1,
        pointHoverRadius: 2,
        lineTension: 0.1,
        fill: false,
        data: tx3
    };

    var taxon4 = {
        label: 'Coquilettidia sp.',
        pointRadius: 1,
        pointHoverRadius: 2,
        lineTension: 0.1,
        fill: false,
        data: tx4
    };


    if (tx1sum > 0) {
        dataset.push(taxon1);
    }
    if (tx2sum > 0) {
        dataset.push(taxon2);
    }
    if (tx3sum > 0) {
        dataset.push(taxon3);
    }
    if (tx4sum > 0) {
        dataset.push(taxon4);
    }


    return dataset;

}


$(document).ready(function () {

    var homelink = window.location.pathname.split('/');
    if (homelink[homelink.length - 1] === 'summary.php') {
        // f1req('B');
    }
});