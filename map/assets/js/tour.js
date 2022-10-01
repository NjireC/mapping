function TourGuide() {

    var _this = this;

    function initTour() {
        // Instance the tour

        var tourSteps = [
            {
                element: "#project",
                title: "STEP 1: Project",
                smartPlacement: true,
                content: "Select Project from the list"
            }, {
                element: "#exp",
                title: "STEP 2: Experiment",
                smartPlacement: true,
                content: "Select Experiment from the list"
            },
           
        ];
        _this.tour = new Tour({steps: tourSteps});
    }

    initTour();


}

TourGuide.prototype = {

    prototype: TourGuide,

    start: function () {
        this.tour.start();
    },

    restart: function () {
        this.tour.restart();
    }
};