 <!-- f1req_ss1  -->
 <div id="sumchart_f1req_ss1" class="modal fade" tabindex="-1" role="dialog">
     <div class="modal-dialog modal-lg">
         <div class="modal-content">
             <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                 <h5 class="modal-title">Anopheline Mosquito Population Summary</h5>
             </div>
             <div class="has-padding2">
                 <ul class="nav nav-pills nav-jt">
                     <li class="active">
                         <a data-toggle="tab" href="#tabf1ss12a">Chart</a></li>
                     <li>
                         <a data-toggle="tab" id="bs-tab2" href="#tabf1ss12b">Table</a>
                     </li>
                 </ul>
                 <div class="tab-content has-padding">
                     <div id="tabf1ss12a" class="tab-pane fade active in animate__animated animate__zoomIn">
                         <div id="loadf1ss1"></div>

                         <div class="text-right">
                             <input type="button" class="btn btn-xs btn-default" value="Bar" onClick="f1req_ss1('B')">
                             <input type="button" class="btn btn-xs btn-default" value="Line" onClick="f1req_ss1('L')">
                             <input type="button" class="btn btn-xs btn-default" value="Pie" onClick="f1req_ss1('P')">
                             <input type="button" class="btn btn-xs btn-default" value="Polar Area" onClick="f1req_ss1('D')">
                         </div>

                         <br />
                         <div id="loadnonef1ss1"></div>

                         <canvas id="canvasf1ss1" class="chart1"></canvas>
                         <canvas id="canvasf1ss1l" class="chart1"></canvas>
                         <canvas id="canvasf1ss1p" class="chart1"></canvas>
                         <canvas id="canvasf1ss1d" class="chart1"></canvas>



                     </div>
                     <div id="tabf1ss12b" class="tab-pane">
                         <div class="table-responsive">
                             <div id="tblf1ss1"></div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </div>
 <!-- / f1req_ss1 -->

 <!-- f2req_ss1 -->
 <div id="sumchart_f2req_ss1" class="modal fade" tabindex="-1" role="dialog">
     <div class="modal-dialog modal-lg">
         <div class="modal-content">
             <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                 <h5 class="modal-title">Culicine Mosquito Population Summary</h5>
             </div>
             <div class="has-padding2">
                 <ul class="nav nav-pills nav-jt">
                     <li class="active">
                         <a data-toggle="tab" href="#tabf2ss12a">Chart</a></li>
                     <li>
                         <a data-toggle="tab" id="bs-tab2" href="#tabf2ss12b">Table</a>
                     </li>
                 </ul>
                 <div class="tab-content has-padding">
                     <div id="tabf2ss12a" class="tab-pane fade active in animate__animated animate__zoomIn">
                         <div id="loadf2ss1"></div>

                         <div class="text-right">
                             <input type="button" class="btn btn-xs btn-default" value="Bar" onClick="f2req_ss1('B')">
                             <input type="button" class="btn btn-xs btn-default" value="Line" onClick="f2req_ss1('L')">
                             <input type="button" class="btn btn-xs btn-default" value="Pie" onClick="f2req_ss1('P')">
                             <input type="button" class="btn btn-xs btn-default" value="Polar Area" onClick="f2req_ss1('D')">
                         </div>

                         <br />

                         <div id="loadnonef2ss1"></div>

                         <canvas id="canvasf2ss1" class="chart1"></canvas>
                         <canvas id="canvasf2ss1l" class="chart1"></canvas>
                         <canvas id="canvasf2ss1p" class="chart1"></canvas>
                         <canvas id="canvasf2ss1d" class="chart1"></canvas>

                     </div>
                     <div id="tabf2ss12b" class="tab-pane">
                         <div class="table-responsive">
                             <div id="tblf2ss1"></div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </div>
 <!-- / f2req_ss1 -->

 <!-- f3req_ss1 -->
 <div id="sumchart_f3req_ss1" class="modal fade" tabindex="-1" role="dialog">
     <div class="modal-dialog modal-lg">
         <div class="modal-content">
             <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                 <h5 class="modal-title">Daily Anopheline Female Mosquito Caught</h5>
             </div>
             <div class="has-padding2">
                 <ul class="nav nav-pills nav-jt">
                     <li class="active">
                         <a data-toggle="tab" href="#tabf3ss12a">Chart</a></li>
                     <li>
                         <a data-toggle="tab" id="bs-tab2" href="#tabf3ss12b">Table</a>
                     </li>
                 </ul>
                 <div class="tab-content has-padding">
                     <div id="tabf3ss12a" class="tab-pane fade active in animate__animated animate__zoomIn">
                         <div id="loadf3ss1"></div>

                         <div class="text-right">
                             <input type="button" class="btn btn-xs btn-default" value="Bar" onClick="f3req_ss1('B')">
                             <input type="button" class="btn btn-xs btn-default" value="Line" onClick="f3req_ss1('L')">
                             <input type="button" class="btn btn-xs btn-default" value="Pie" onClick="f3req_ss1('P')">
                             <input type="button" class="btn btn-xs btn-default" value="Polar Area" onClick="f3req_ss1('D')">
                         </div>

                         <br />

                         <div id="loadnonef3ss1"></div>

                         <canvas id="canvasf3ss1" class="chart1"></canvas>
                         <canvas id="canvasf3ss1l" class="chart1"></canvas>
                         <canvas id="canvasf3ss1p" class="chart1"></canvas>
                         <canvas id="canvasf3ss1d" class="chart1"></canvas>

                     </div>
                     <div id="tabf3ss12b" class="tab-pane">
                         <div class="table-responsive">
                             <div id="tblf3ss1"></div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </div>
 <!-- / f3req_ss1 -->

 <!-- f4req_ss1 -->
 <div id="sumchart_f4req_ss1" class="modal fade" tabindex="-1" role="dialog">
     <div class="modal-dialog modal-lg">
         <div class="modal-content">
             <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                 <h5 class="modal-title">Weekly AnophelineFemale Mosquito Caught</h5>
             </div>

             <div class="has-padding2">
                 <ul class="nav nav-pills nav-jt">
                     <li class="active">
                         <a data-toggle="tab" href="#tabf4ss12a">Chart</a></li>
                     <li>
                         <a data-toggle="tab" id="bs-tab2" href="#tabf4ss12b">Table</a>
                     </li>
                 </ul>
                 <div class="tab-content has-padding">
                     <div id="tabf4ss12a" class="tab-pane fade active in animate__animated animate__zoomIn">
                         <div id="loadf4ss1"></div>

                         <div class="text-right">
                             <input type="button" class="btn btn-xs btn-default " value="Bar" onClick="f4req_ss1('B')">
                             <input type="button" class="btn btn-xs btn-default" value="Line" onClick="f4req_ss1('L')">
                             <input type="button" class="btn btn-xs btn-default" value="Pie" onClick="f4req_ss1('P')">
                             <input type="button" class="btn btn-xs btn-default" value="Polar Area" onClick="f4req_ss1('D')">
                         </div>

                         <br />
                         <div id="loadnonef4ss1"></div>

                         <canvas id="canvasf4ss1" class="chart1"></canvas>
                         <canvas id="canvasf4ss1l" class="chart1"></canvas>
                         <canvas id="canvasf4ss1p" class="chart1"></canvas>
                         <canvas id="canvasf4ss1d" class="chart1"></canvas>

                     </div>
                     <div id="tabf4ss12b" class="tab-pane">
                         <div class="table-responsive">
                             <div id="tblf4ss1"></div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </div>
 <!-- / f4req_ss1 -->

 <!-- f5req_ss1 -->
 <div id="sumchart_f5req_ss1" class="modal fade" tabindex="-1" role="dialog">
     <div class="modal-dialog modal-lg">
         <div class="modal-content">
             <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                 <h5 class="modal-title">Monthly Anopheline Female Mosquito Caught</h5>
             </div>

             <div class="has-padding2">
                 <ul class="nav nav-pills nav-jt">
                     <li class="active">
                         <a data-toggle="tab" href="#tabf5ss12a">Chart</a></li>
                     <li>
                         <a data-toggle="tab" id="bs-tab2" href="#tabf5ss12b">Table</a>
                     </li>
                 </ul>
                 <div class="tab-content has-padding">
                     <div id="tabf5ss12a" class="tab-pane fade active in animate__animated animate__zoomIn">
                         <div id="loadf5ss1"></div>

                         <div class="text-right">
                             <input type="button" class="btn btn-xs btn-default " value="Bar" onClick="f5req_ss1('B')">
                             <input type="button" class="btn btn-xs btn-default" value="Line" onClick="f5req_ss1('L')">
                             <input type="button" class="btn btn-xs btn-default" value="Pie" onClick="f5req_ss1('P')">
                             <input type="button" class="btn btn-xs btn-default" value="Polar Area" onClick="f5req_ss1('D')">
                         </div>

                         <br />

                         <div id="loadnonef5ss1"></div>

                         <canvas id="canvasf5ss1" class="chart1"></canvas>
                         <canvas id="canvasf5ss1l" class="chart1"></canvas>
                         <canvas id="canvasf5ss1p" class="chart1"></canvas>
                         <canvas id="canvasf5ss1d" class="chart1"></canvas>

                     </div>
                     <div id="tabf5ss12b" class="tab-pane">
                         <div class="table-responsive">
                             <div id="tblf5ss1"></div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </div>
 <!-- / f5req_ss1 -->

 <!-- f6req_ss1 -->
 <div id="sumchart_f6req_ss1" class="modal fade" tabindex="-1" role="dialog">
     <div class="modal-dialog modal-lg">
         <div class="modal-content">
             <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                 <h5 class="modal-title">Daily Culicine Female Mosquito Caught</h5>
             </div>
             <div class="has-padding2">
                 <ul class="nav nav-pills nav-jt">
                     <li class="active">
                         <a data-toggle="tab" href="#tabf6ss12a">Chart</a></li>
                     <li>
                         <a data-toggle="tab" id="bs-tab2" href="#tabf6ss12b">Table</a>
                     </li>
                 </ul>
                 <div class="tab-content has-padding">
                     <div id="tabf6ss12a" class="tab-pane fade active in animate__animated animate__zoomIn">
                         <div id="loadf6ss1"></div>

                         <div class="text-right">
                             <input type="button" class="btn btn-xs btn-default" value="Bar" onClick="f6req_ss1('B')">
                             <input type="button" class="btn btn-xs btn-default" value="Line" onClick="f6req_ss1('L')">
                             <input type="button" class="btn btn-xs btn-default" value="Pie" onClick="f6req_ss1('P')">
                             <input type="button" class="btn btn-xs btn-default" value="Polar Area" onClick="f6req_ss1('D')">
                         </div>

                         <br />

                         <div id="loadnonef6ss1"></div>

                         <canvas id="canvasf6ss1" class="chart1"></canvas>
                         <canvas id="canvasf6ss1l" class="chart1"></canvas>
                         <canvas id="canvasf6ss1p" class="chart1"></canvas>
                         <canvas id="canvasf6ss1d" class="chart1"></canvas>

                     </div>
                     <div id="tabf6ss12b" class="tab-pane">
                         <div class="table-responsive">
                             <div id="tblf6ss1"></div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </div>
 <!-- / f6req_ss1 -->

 <!-- f7req_ss1 -->
 <div id="sumchart_f7req_ss1" class="modal fade" tabindex="-1" role="dialog">
     <div class="modal-dialog modal-lg">
         <div class="modal-content">
             <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                 <h5 class="modal-title">Weekly Culicine Female Mosquito Caught</h5>
             </div>

             <div class="has-padding2">
                 <ul class="nav nav-pills nav-jt">
                     <li class="active">
                         <a data-toggle="tab" href="#tabf7ss12a">Chart</a></li>
                     <li>
                         <a data-toggle="tab" id="bs-tab2" href="#tabf7ss12b">Table</a>
                     </li>
                 </ul>
                 <div class="tab-content has-padding">
                     <div id="tabf7ss12a" class="tab-pane fade active in animate__animated animate__zoomIn">
                         <div id="loadf7ss1"></div>

                         <div class="text-right">
                             <input type="button" class="btn btn-xs btn-default " value="Bar" onClick="f7req_ss1('B')">
                             <input type="button" class="btn btn-xs btn-default" value="Line" onClick="f7req_ss1('L')">
                             <input type="button" class="btn btn-xs btn-default" value="Pie" onClick="f7req_ss1('P')">
                             <input type="button" class="btn btn-xs btn-default" value="Polar Area" onClick="f7req_ss1('D')">
                         </div>

                         <br />

                         <div id="loadnonef7ss1"></div>

                         <canvas id="canvasf7ss1" class="chart1"></canvas>
                         <canvas id="canvasf7ss1l" class="chart1"></canvas>
                         <canvas id="canvasf7ss1p" class="chart1"></canvas>
                         <canvas id="canvasf7ss1d" class="chart1"></canvas>

                     </div>
                     <div id="tabf7ss12b" class="tab-pane">
                         <div class="table-responsive">
                             <div id="tblf7ss1"></div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </div>
 <!-- / f7req_ss1 -->

 <!-- f8req_ss1 -->
 <div id="sumchart_f8req_ss1" class="modal fade" tabindex="-1" role="dialog">
     <div class="modal-dialog modal-lg">
         <div class="modal-content">
             <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                 <h5 class="modal-title">Monthly Culicine Female Mosquito Caught</h5>
             </div>

             <div class="has-padding2">
                 <ul class="nav nav-pills nav-jt">
                     <li class="active">
                         <a data-toggle="tab" href="#tabf8ss12a">Chart</a></li>
                     <li>
                         <a data-toggle="tab" id="bs-tab2" href="#tabf8ss12b">Table</a>
                     </li>
                 </ul>
                 <div class="tab-content has-padding">
                     <div id="tabf8ss12a" class="tab-pane fade active in animate__animated animate__zoomIn">
                         <div id="loadf8ss1"></div>

                         <div class="text-right">
                             <input type="button" class="btn btn-xs btn-default " value="Bar" onClick="f8req_ss1('B')">
                             <input type="button" class="btn btn-xs btn-default" value="Line" onClick="f8req_ss1('L')">
                             <input type="button" class="btn btn-xs btn-default" value="Pie" onClick="f8req_ss1('P')">
                             <input type="button" class="btn btn-xs btn-default" value="Polar Area" onClick="f8req_ss1('D')">
                         </div>

                         <br />

                         <div id="loadnonef8ss1"></div>

                         <canvas id="canvasf8ss1" class="chart1"></canvas>
                         <canvas id="canvasf8ss1l" class="chart1"></canvas>
                         <canvas id="canvasf8ss1p" class="chart1"></canvas>
                         <canvas id="canvasf8ss1d" class="chart1"></canvas>

                     </div>
                     <div id="tabf8ss12b" class="tab-pane">
                         <div class="table-responsive">
                             <div id="tblf8ss1"></div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </div>
 <!-- / f8req_ss1 -->

 <!-- f9req_ss1 -->
 <div id="sumchart_f9req_ss1" class="modal fade" tabindex="-1" role="dialog">
     <div class="modal-dialog modal-lg">
         <div class="modal-content">
             <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                 <h5 class="modal-title">Mosquito Population Summary by Enumeration area</h5>
             </div>
             <div class="has-padding2">

                 <ul class="nav nav-pills nav-jt">
                     <li class="active">
                         <a data-toggle="tab" href="#tabf9ss12a">Chart</a></li>
                     <li>
                         <a data-toggle="tab" id="bs-tab2" href="#tabf9ss12b">Table</a>
                     </li>
                 </ul>
                 <div class="tab-content has-padding">
                     <div id="tabf9ss12a" class="tab-pane fade active in animate__animated animate__zoomIn">
                         <div id="loadf9ss1"></div>

                         <div class="text-right">
                             <input type="button" class="btn btn-xs btn-default" value="Bar" onClick="f9req_ss1('B')">
                             <input type="button" class="btn btn-xs btn-default" value="Line" onClick="f9req_ss1('L')">
                             <input type="button" class="btn btn-xs btn-default" value="Pie" onClick="f9req_ss1('P')">
                             <input type="button" class="btn btn-xs btn-default" value="Polar Area" onClick="f9req_ss1('D')">
                         </div>

                         <br />


                         <div style="width: 100%; overflow-x: auto; overflow-y: hidden">
                             <div style="width: 1000px; height: 350">

                                 <div id="loadnonef9ss1"></div>

                                 <canvas id="canvasf9ss1" height="300" width="0"></canvas>
                                 <canvas id="canvasf9ss1l" height="300" width="0"></canvas>
                                 <canvas id="canvasf9ss1p" height="300" width="0"></canvas>
                                 <canvas id="canvasf9ss1d" height="300" width="0"></canvas>
                             </div>
                         </div>

                     </div>
                     <div id="tabf9ss12b" class="tab-pane">
                         <div class="table-responsive">
                             <div id="tblf9ss1"></div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </div>
 <!-- / f9req_ss1 -->

 <!-- f10req_ss1 -->
 <div id="sumchart_f10req_ss1" class="modal fade" tabindex="-1" role="dialog">
     <div class="modal-dialog modal-lg">
         <div class="modal-content">
             <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                 <h5 class="modal-title">An. gambiae s.l abdominal status</h5>
             </div>

             <div class="has-padding2">
                 <ul class="nav nav-pills nav-jt">
                     <li class="active">
                         <a data-toggle="tab" href="#tabf10ss12a">Chart</a></li>
                     <li>
                         <a data-toggle="tab" id="bs-tab2" href="#tabf10ss12b">Table</a>
                     </li>
                 </ul>
                 <div class="tab-content has-padding">
                     <div id="tabf10ss12a" class="tab-pane fade active in animate__animated animate__zoomIn">
                         <div id="loadf10ss1"></div>

                         <div class="text-right">
                             <input type="button" class="btn btn-xs btn-default" value="Bar" onClick="f10req_ss1('B')">
                             <input type="button" class="btn btn-xs btn-default" value="Line" onClick="f10req_ss1('L')">
                             <input type="button" class="btn btn-xs btn-default" value="Pie" onClick="f10req_ss1('P')">
                             <input type="button" class="btn btn-xs btn-default" value="Polar Area" onClick="f10req_ss1('D')">
                         </div>

                         <br />

                         <div id="loadnonef10ss1"></div>

                         <canvas id="canvasf10ss1" class="chart1"></canvas>
                         <canvas id="canvasf10ss1l" class="chart1"></canvas>
                         <canvas id="canvasf10ss1p" class="chart1"></canvas>
                         <canvas id="canvasf10ss1d" class="chart1"></canvas>
                     </div>
                     <div id="tabf10ss12b" class="tab-pane">
                         <div class="table-responsive">
                             <div id="tblf10ss1"></div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </div>
 <!-- / f10req_ss1 -->

 <!-- f11req_ss1 -->
 <div id="sumchart_f11req_ss1" class="modal fade" tabindex="-1" role="dialog">
     <div class="modal-dialog modal-lg">
         <div class="modal-content">
             <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                 <h5 class="modal-title">An. funestus abdominal status</h5>
             </div>

             <div class="has-padding2">

                 <ul class="nav nav-pills nav-jt">
                     <li class="active">
                         <a data-toggle="tab" href="#tabf11ss12a">Chart</a></li>
                     <li>
                         <a data-toggle="tab" id="bs-tab2" href="#tabf11ss12b">Table</a>
                     </li>
                 </ul>
                 <div class="tab-content has-padding">
                     <div id="tabf11ss12a" class="tab-pane fade active in animate__animated animate__zoomIn">
                         <div id="loadf11ss1"></div>

                         <div class="text-right">
                             <input type="button" class="btn btn-xs btn-default" value="Bar" onClick="f11req_ss1('B')">
                             <input type="button" class="btn btn-xs btn-default" value="Line" onClick="f11req_ss1('L')">
                             <input type="button" class="btn btn-xs btn-default" value="Pie" onClick="f11req_ss1('P')">
                             <input type="button" class="btn btn-xs btn-default" value="Polar Area" onClick="f11req_ss1('D')">
                         </div>

                         <br />

                         <div id="loadnonef11ss1"></div>

                         <canvas id="canvasf11ss1" class="chart1"></canvas>
                         <canvas id="canvasf11ss1l" class="chart1"></canvas>
                         <canvas id="canvasf11ss1p" class="chart1"></canvas>
                         <canvas id="canvasf11ss1d" class="chart1"></canvas>

                     </div>
                     <div id="tabf11ss12b" class="tab-pane">
                         <div class="table-responsive">
                             <div id="tblf11ss1"></div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </div>
 <!-- / f11req_ss1 -->

 <!-- f12req_ss1 -->
 <div id="sumchart_f12req_ss1" class="modal fade" tabindex="-1" role="dialog">
     <div class="modal-dialog modal-lg">
         <div class="modal-content">
             <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                 <h5 class="modal-title">Hourly Biting Rate</h5>
             </div>

             <div class="has-padding2">

                 <ul class="nav nav-pills nav-jt">
                     <li class="active">
                         <a data-toggle="tab" href="#tabf12ss12a">Chart</a></li>
                     <li>
                         <a data-toggle="tab" id="bs-tab2" href="#tabf12ss12b">Table</a>
                     </li>
                 </ul>
                 <div class="tab-content has-padding">
                     <div id="tabf12ss12a" class="tab-pane fade active in animate__animated animate__zoomIn">
                         <div id="loadf12ss1"></div>

                         <div class="text-right">
                             <input type="button" class="btn btn-xs btn-default" value="Bar" onClick="f12req_ss1('B')">
                             <input type="button" class="btn btn-xs btn-default" value="Line" onClick="f12req_ss1('L')">
                             <input type="button" class="btn btn-xs btn-default" value="Pie" onClick="f12req_ss1('P')">
                             <input type="button" class="btn btn-xs btn-default" value="Polar Area" onClick="f12req_ss1('D')">
                         </div>

                         <br />

                         <div id="loadnonef12ss1"></div>

                         <canvas id="canvasf12ss1" class="chart1"></canvas>
                         <canvas id="canvasf12ss1l" class="chart1"></canvas>
                         <canvas id="canvasf12ss1p" class="chart1"></canvas>
                         <canvas id="canvasf12ss1d" class="chart1"></canvas>

                     </div>
                     <div id="tabf12ss12b" class="tab-pane">
                         <div class="table-responsive">
                             <div id="tblf12ss1"></div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </div>
 <!-- / f12req_ss1 -->

 <!-- f13req_ss1 -->
 <div id="sumchart_f13req_ss1" class="modal fade" tabindex="-1" role="dialog">
     <div class="modal-dialog modal-lg">
         <div class="modal-content">
             <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                 <h5 class="modal-title">Species Composition</h5>
             </div>

             <div class="has-padding2">

                 <ul class="nav nav-pills nav-jt">
                     <li class="active">
                         <a data-toggle="tab" href="#tabf13ss12a">Chart</a></li>
                     <li>
                         <a data-toggle="tab" id="bs-tab2" href="#tabf13ss12b">Table</a>
                     </li>
                 </ul>
                 <div class="tab-content has-padding">
                     <div id="tabf13ss12a" class="tab-pane fade active in animate__animated animate__zoomIn">
                         <div id="loadf13ss1"></div>

                         <div class="text-right">
                             <input type="button" class="btn btn-xs btn-default" value="Bar" onClick="f13req_ss1('B')">
                             <input type="button" class="btn btn-xs btn-default" value="Line" onClick="f13req_ss1('L')">
                             <input type="button" class="btn btn-xs btn-default" value="Pie" onClick="f13req_ss1('P')">
                             <input type="button" class="btn btn-xs btn-default" value="Polar Area" onClick="f13req_ss1('D')">
                         </div>

                         <br />

                         <div id="loadnonef13ss1"></div>

                         <canvas id="canvasf13ss1" class="chart1"></canvas>
                         <canvas id="canvasf13ss1l" class="chart1"></canvas>
                         <canvas id="canvasf13ss1p" class="chart1"></canvas>
                         <canvas id="canvasf13ss1d" class="chart1"></canvas>

                     </div>
                     <div id="tabf13ss12b" class="tab-pane">
                         <div class="table-responsive">
                             <div id="tblf13ss1"></div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </div>
 <!-- / f13req_ss1 -->