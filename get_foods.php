<?php
header('Content-Type: application/json');

// Database configuration
$servername = "localhost";
$username = "mobw7774_user_rezza";
$password = "Rezzaeca_03";
$dbname = "mobw7774_api_rezza";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    http_response_code(500); // Set response code to 500 for server error
    echo json_encode(['error' => 'Database connection failed: ' . $conn->connect_error]);
    exit();
}

// SQL query to get all foods
$sql = "SELECT * FROM tbl_food";
$result = $conn->query($sql);

$foods = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $foods[] = $row;
    }
} else {
    http_response_code(404); // Set response code to 404 if no records found
    echo json_encode(['message' => 'No foods found']);
    $conn->close();
    exit();
}

// Send JSON response
echo json_encode(['foods' => $foods]);

// Close connection
$conn->close();
?>
