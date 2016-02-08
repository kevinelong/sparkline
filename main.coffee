data = [];

onData = ()->
  raw = JSON.parse this.responseText
  data.push( raw["data"][0] );
  target = "target"
  valueName = "value"
  S = new Spark()
  line = S.spark(data, valueName)
  document.getElementById(target).innerHTML = line

getData = ()->
  method="GET"
  url="data.php"
  request = new XMLHttpRequest()
  request.addEventListener("load",onData)
  request.open(method, url)
  request.send(null)
  setTimeout(getData,300)

document.addEventListener("DOMContentLoaded", getData)