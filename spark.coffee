class @Spark
  OPEN = "<svg width=\"100\" height=\"50\" viewPort=\"0 0 100 50\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\">"
  PREFIX = "<polyline  points=\""
  SUFFIX = "\" style=\"stroke:#006600;\" fill=\"none\" />"
  CLOSE = "</svg>"

  constructor: ()->
    console.log "creating a spark factory"
  spark: (data, valueName)->
    list = []
    console.log "creating a spark from data"
    for item, index in data
      x = index * 10
      list.push x + "," + item[valueName]
    output = list.join " "
    final = OPEN + PREFIX + output + SUFFIX + CLOSE
    console.log final
    return final
