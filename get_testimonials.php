<?php
header("Content-Type: application/json");

// Database connection
$servername = "localhost";
$username = "mobw7774_user_rezza";
$password = "Rezzaeca_03";
$dbname = "mobw7774_api_rezza";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die(json_encode(["status" => "error", "message" => "Connection failed: " . $conn->connect_error]));
}

// Fetch testimonials from tbl_testimoni
$sql = "
  SELECT testimonial, created_at
  FROM tbl_testimoni
";
$result = $conn->query($sql);

$testimonials = [];

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $testimonials[] = $row;
    }
    echo json_encode(["status" => "success", "testimonials" => $testimonials]);
} else {
    echo json_encode(["status" => "success", "testimonials" => []]);
}

$conn->close();
?>
