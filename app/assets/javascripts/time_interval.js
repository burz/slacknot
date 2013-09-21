var time_interval = {
  start: null,
  end: null,
  init: function () {
    this.start = new Date().getTime() / 1000;
  },
  send_results: function (url) {
    this.end = new Date().getTime() / 1000;

    var data = JSON.stringify({
      'start': this.start,
      'end': this.end
    });

    $.ajax({
      url: url,
      type: 'post',
      data: data
    });
  }
};

function start_time_interval(url)
{
  window.onbeforeunload = function () {
    time_interval.send_results(url);
    return '';
  };

  time_interval.init();
}

