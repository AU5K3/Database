<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION['memberID'])) {
    echo json_encode(['success' => false, 'message' => 'User not logged in.']);
    exit();
}

// Database connection
$username = "root"; // Replace with your DB username
$password = ""; // Replace with your DB password
$database = "Caregivers"; // Replace with your DB name
$connection = new mysqli("localhost", $username, $password, $database);

// Check connection
if ($connection->connect_error) {
    echo json_encode(['success' => false, 'message' => 'Database connection failed: ' . $connection->connect_error]);
    exit();
}

// Fetch logged-in user's balance
$logged_in_member_id = intval($_SESSION['memberID']);
$stmt = $connection->prepare('SELECT balance FROM member WHERE memberID = ?');
if (!$stmt) {
    echo json_encode(['success' => false, 'message' => 'Failed to prepare balance query: ' . $connection->error]);
    exit();
}
$stmt->bind_param('i', $logged_in_member_id);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    $balance = $row['balance'];
} else {
    echo json_encode(['success' => false, 'message' => 'User balance not found.']);
    $stmt->close();
    $connection->close();
    exit();
}
$stmt->close();

// Fetch other members excluding the logged-in user
$members_stmt = $connection->prepare('SELECT username, address, averageRating, balance, availability FROM member WHERE memberID != ?');
if (!$members_stmt) {
    echo json_encode(['success' => false, 'message' => 'Failed to prepare members query: ' . $connection->error]);
    exit();
}
$members_stmt->bind_param('i', $logged_in_member_id);
$members_stmt->execute();
$members_result = $members_stmt->get_result();

$members = [];
while ($row = $members_result->fetch_assoc()) {
    $members[] = $row;
}
$members_stmt->close();

// Output the response in JSON format
echo json_encode([
    'success' => true,
    'balance' => $balance,
    'members' => $members
]);

$connection->close();
?>
