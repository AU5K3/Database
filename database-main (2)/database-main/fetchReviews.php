<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION['memberID'])) {
    echo json_encode(['success' => false, 'message' => 'User not logged in.']);
    exit();
}

// Database connection
$username = "root"; 
$password = ""; 
$database = "Caregivers"; 
$connection = new mysqli("localhost", $username, $password, $database);

// Check connection
if ($connection->connect_error) {
    echo json_encode(['success' => false, 'message' => 'Database connection failed: ' . $connection->connect_error]);
    exit();
}

$logged_in_member_id = intval($_SESSION['memberID']);

// Query to fetch up to 10 most recent reviews 
$stmt = $connection->prepare(
    'SELECT reviews.contractID, reviews.rating, reviews.dateOfCompletion, 
            contracts.startDate, contracts.endDate, contracts.dailyHoursWorked
     FROM reviews 
     INNER JOIN contracts ON reviews.contractID = contracts.contractID
     WHERE reviews.caretakerID = ? 
     ORDER BY reviews.dateOfCompletion DESC 
     LIMIT 10'
);

if (!$stmt) {
    echo json_encode(['success' => false, 'message' => 'Failed to prepare the reviews query: ' . $connection->error]);
    exit();
}

$stmt->bind_param('i', $logged_in_member_id);
$stmt->execute();
$result = $stmt->get_result();

$reviews = [];
while ($row = $result->fetch_assoc()) {
    $startDate = new DateTime($row['startDate']);
    $endDate = new DateTime($row['endDate']);
    $interval = $startDate->diff($endDate);
    $totalDaysWorked = $interval->days + 1; // Include the end date as well

    // Calculate money earned 
    $moneyEarned = $row['dailyHoursWorked'] * 30 * $totalDaysWorked;

    $reviews[] = [
        'rating' => $row['rating'],
        'contractID' => $row['contractID'],
        'dateOfCompletion' => $row['dateOfCompletion'],
        'hoursWorkedDaily' => $row['dailyHoursWorked'],
        'totalDaysWorked' => $totalDaysWorked,
        'moneyEarned' => $moneyEarned
    ];
}

$stmt->close();
$connection->close();

if (count($reviews) > 0) {
    echo json_encode(['success' => true, 'reviews' => $reviews]);
} else {
    echo json_encode(['success' => false, 'message' => 'Hmm, there are no jobs completed here...']);
}
?>
