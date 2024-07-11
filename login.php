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

$sql = "SELECT id, password FROM users WHERE username = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $username);
$stmt->execute();
$stmt->store_result();
$stmt->bind_result($id, $hashedPassword);
$stmt->fetch();

if ($stmt->num_rows > 0 && password_verify($password, $hashedPassword)) {
    echo json_encode(["status" => "success", "message" => "Login successful"]);
} else {
    echo json_encode(["status" => "error", "message" => "Invalid credentials"]);
}

$conn->close();
?>
