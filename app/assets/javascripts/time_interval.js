var time_interval = {
  start: null,
  end: null,
  init: function () {
    this.start = new Date().getTime();
  },
  send_results: function (url) {
    this.end = new Date().getTime();

    var data = {
      'start': this.start,
      'end': this.end
    };

    var xhr = new XMLHttpRequest();

    xhr.open('POST', url);
    xhr.setRequestHeader("Content-Type", "text/plain;charset=UTF-8");
    xhr.send(JSON.stringify(data));
  }
};

function start_time_interval(url)
{
  send = function () {
    time_interval.send_results(url);
  };

  window.onbeforeunload = send;

  document.addEventListener('page:before-change', send);

  time_interval.init();
}

