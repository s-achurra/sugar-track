$(() => {

    var start = moment().subtract(29, 'days');
    var end = moment();

    function cb(start, end) {
        // TODO: setup callback to update graph
        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        $('#post-chart').empty();
        toggleLoader();
        searchPosts({ start_date: start._d, end_date: end._d });
    }

    $('#reportrange').daterangepicker({
        startDate: start,
        endDate: end,
        ranges: {
           'Today': [moment(), moment()],
           'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
           'Last 7 Days': [moment().subtract(6, 'days'), moment()],
           'Last 30 Days': [moment().subtract(29, 'days'), moment()],
           'This Month': [moment().startOf('month'), moment().endOf('month')],
           'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        }
    }, cb);

    cb(start, end);

});

const searchPosts = (dates) => (
  $.ajax({
    method: 'GET',
    url: 'search/posts',
    data: { dates: dates },
    success: (data) => generateGraph(data)
  })
);

const generateGraph = (data) => {
  toggleLoader()
  new Morris.Line({
    // ID of the element in which to draw the chart.
    element: 'post-chart',
    // Chart data records -- each entry in this array corresponds to a point on
    // the chart.
    data: data,
    // The name of the data record attribute that contains x-values.
    xkey: 'created_at',
    // A list of names of data record attributes that contain y-values.
    ykeys: ['level'],
    // Labels for the ykeys -- will be displayed when you hover over the
    // chart.
    labels: ['Level']
  });
};

const toggleLoader = () => $('#post-chart').toggleClass('loader');
