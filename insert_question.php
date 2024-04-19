<?php
// Database connection
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "grid";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get form data
$type = $_POST['type'];
$question = $_POST['question'];
$answer = $_POST['answer'];
$explanation = $_POST['explanation'];

// Set default values for fields not applicable to descriptive questions
$options = null;
$correctAnswer = $answer;

// If the question type is MCQ, retrieve the options from the form data
if ($type === 'MCQ') {
    $options = array();
    for ($i = 1; $i <= 4; $i++) {
        if (isset($_POST['option'.$i])) {
            $options[] = $_POST['option'.$i];
        }
    }
    $options = implode(',', $options); // Convert options array to comma-separated string
    $correctAnswer = $_POST['answer']; // Update the correct answer based on the form data
}

// Prepare SQL statement
$sql = "INSERT INTO questions (QuestionText, DifficultyLevel, Topic, Type, Options, CorrectAnswer, Explanation) VALUES (?, ?, ?, ?, ?, ?, ?)";
$stmt = $conn->prepare($sql);

// Bind parameters and execute
$stmt->bind_param("sssssss", $question, $difficulty, $topic, $type, $options, $correctAnswer, $explanation);
$difficulty = 'Medium'; // You can change this based on admin input or set it to a default value
$topic = 'Programming'; // You can change this based on admin input or set it to a default value
$stmt->execute();

echo "Question inserted successfully.";

$stmt->close();
$conn->close();
?>
