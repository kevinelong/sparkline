document.addEventListener("DOMContentLoaded",()->
  console.log("init/loaded")
  target = "target"
  valueName="value"
  d = data;
  S = new Spark()
  line = S.spark(d,valueName)
  document.getElementById(target).innerHTML = line
)