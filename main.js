// Generated by CoffeeScript 1.9.3
(function() {
  document.addEventListener("DOMContentLoaded", function() {
    var S, d, line, target, valueName;
    console.log("init/loaded");
    target = "target";
    valueName = "value";
    d = data;
    S = new Spark();
    line = S.spark(d, valueName);
    return document.getElementById(target).innerHTML = line;
  });

}).call(this);

//# sourceMappingURL=main.js.map