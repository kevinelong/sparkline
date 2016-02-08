<?php
session_start();
header("content-type: text/json");

function getMovingAverage(array $data, $range)
{
    $sum = array_sum(array_slice($data, 0, $range));

    $result = array($range - 1 => $sum / $range);

    for ($i = $range, $n = count($data); $i != $n; ++$i) {
        $result[$i] = $result[$i - 1] + ($data[$i] - $data[$i - $range]) / $range;
    }

    return $result;
}

function getItem($index, $averages, $values, $max_height)
{
    $value = ($index >= 15) ? $averages[$index] : $values[$index];

    $item = array(
        "id" => rand(0, $max_height),
        "value" => $value
    );
    return $item;
}

function getValues($max_height,$final_limit)
{
    $values = array();

    for ($i = 0; $i < $final_limit; $i++) {
        $values[] = rand(0, $max_height);
    }
    return $values;
}

function getData($moving_limit, $final_limit, $averages, $values, $max_height){
    $data = array();

    for ($index = $moving_limit; $index < $final_limit; $index++) {
        $data[$index] = getItem($index, $averages, $values, $max_height);
    }
    return $data;
}

$moving_limit = 5;
$sample_size = 100;
$max_height = 100;
$final_limit = $sample_size + $moving_limit;
//$_SESSION["data"] = null;
if (!isset($_SESSION["data"])) {
    $values = getValues($max_height, $final_limit);
    $averages = getMovingAverage($values, $moving_limit);
    $data = getData($moving_limit, $final_limit, $averages, $values, $max_height);
    $_SESSION["data"] = $data;
    $_SESSION["index"] = $moving_limit;
}

echo json_encode(array("data" => array($_SESSION["data"][$_SESSION["index"]])) );

$_SESSION["index"]++;
if ($_SESSION["index"] > $final_limit) {
    $_SESSION["data"] = null;
    $_SESSION["index"] = $moving_limit;
}
