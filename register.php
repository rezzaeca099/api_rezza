<?php
include 'config.php';

header('Content-Type: application/json');

$data = json_decode(file_get_contents("php://input"));

$username = $data->username;
$password = $data->password;

if (empty($username) || empty($password)) {
    echo json_encode(["status" => "error", "message" => "Username and Password required"]);
    exit();
}

$sql = "SELECT id FROM users WHERE username = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $username);
$stmt->execute();
$stmt->store_result();

if ($stmt->num_rows > 0) {
    echo json_encode(["status" => "error", "message" => "Username already taken"]);
    exit();
}

$passwordHash = password_hash($password, PASSWORD_BCRYPT);
$sql = "INSERT INTO users (username, password) VALUES (?, ?)";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $username, $passwordHash);

if ($stmt->execute()) {
    echo json_encode(["status" => "success", "message" => "User registered successfully"]);
} else {
    echo json_encode(["status" => "error", "message" => "Failed to register user"]);
}

$conn->close();
?>
