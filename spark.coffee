class @Spark
  OPEN = "<svg width=\"100\" height=\"100\" viewPort=\"0 0 100 100\" viewport-fill=\"black\" xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\">"
  PREFIX = "<polyline  points=\""
  SUFFIX = "\" style=\"stroke:#00ff00;\" fill=\"none\" />"
  CLOSE = "</svg>"

  constructor: ()->
    console.log "creating a spark factory"

  spark: (data, valueName)->
    list = []
    console.log "creating a spark from data"
    startIndex =  data.length < 100 ? 0 : data.length - 100
    endIndex = data.length
    for item, index in data[startIndex..endIndex]
      console.log index
      console.log item
      x = index * 1
      list.push x + "," + item[valueName]
    output = list.join " "
    final = OPEN + PREFIX + output + SUFFIX + CLOSE
    console.log final
    return final
