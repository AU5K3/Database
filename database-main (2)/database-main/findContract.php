<?php
header('Content-Type: application/json');

$servername = "localhost";
$username = "username";
$password = "password";
$dbName = "CareGivers";

$connection = new mysqli($servername, $username, $password, $dbName);

if ($connection->connect_error) {
    die(json_encode(["error" => "Connection failed: " . $connection->connect_error]));
}
$caretakerID = $connection->insert_id;
$result = $connection->query("SELECT contractID, clientID, startDate, endDate, dailyHoursWorked FROM contracts WHERE caretakerID = $caretakerID");

$allContracts = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $allContracts[] = $row;
    }
}

$connection->close();

echo json_encode($allContracts);
?>