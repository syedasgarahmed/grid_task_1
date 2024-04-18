<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div id="question-container">
        <h2 id="question"></h2>
        <div id="options-container"></div>
        <textarea id="answer" style="display:none;"></textarea>
        <button id="next-btn">Next</button>
        <button id="validate-btn" style="display:none;">Validate Answer</button>
        <button id="explanation-btn" style="display:none;">Explanation</button>
    </div>
    <div id="explanation-modal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <p id="explanation-text"></p>
        </div>
    </div>
    <script src="script.js"></script>
</body>
</html>

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

$sql = "SELECT * FROM questions ORDER BY RAND() LIMIT 5";
$result = $conn->query($sql);

$questions = array();

if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $questions[] = $row;
    }
}

$conn->close();
?>

<script>
let currentQuestionIndex = -1;
let questions = <?php echo json_encode($questions); ?>;

function displayNextQuestion() {
    currentQuestionIndex++;
    if (currentQuestionIndex < questions.length) {
        let question = questions[currentQuestionIndex];
        document.getElementById('question').innerHTML = question.QuestionText;

        if (question.Type === 'MCQ') {
            let optionsContainer = document.getElementById('options-container');
            optionsContainer.innerHTML = '';
            question.Options.split(',').forEach((option, index) => {
                let optionElement = document.createElement('button');
                optionElement.textContent = option.trim();
                optionElement.onclick = () => checkAnswer(option.trim());
                optionsContainer.appendChild(optionElement);
            });
            document.getElementById('answer').style.display = 'none';
            document.getElementById('validate-btn').style.display = 'none'; // Hide the validate button for MCQ
        } else if (question.Type === 'Descriptive') {
            document.getElementById('options-container').innerHTML = '';
            document.getElementById('answer').style.display = 'block';
            document.getElementById('validate-btn').style.display = 'block'; // Show the validate button for Descriptive
        }

        document.getElementById('next-btn').style.display = 'block';
        document.getElementById('explanation-btn').style.display = 'none';
    } else {
        alert('Quiz completed!');
    }
}

function checkAnswer(answer) {
    let question = questions[currentQuestionIndex];
    if (question.Type === 'MCQ') {
        if (answer === question.CorrectAnswer) {
            alert('Correct!');
        } else {
            alert('Incorrect!');
        }
    } else if (question.Type === 'Descriptive') {
        let userAnswer = document.getElementById('answer').value.trim();
        if (userAnswer === question.CorrectAnswer) {
            alert('Correct!');
        } else {
            alert('Incorrect!');
        }
    }
    document.getElementById('next-btn').style.display = 'block';
    document.getElementById('explanation-btn').style.display = 'block';
}

document.getElementById('next-btn').addEventListener('click', displayNextQuestion);

document.getElementById('explanation-btn').addEventListener('click', () => {
    let explanationModal = document.getElementById('explanation-modal');
    let explanationText = questions[currentQuestionIndex].Explanation;
    document.getElementById('explanation-text').textContent = explanationText;
    explanationModal.style.display = 'block';
});

document.getElementById('validate-btn').addEventListener('click', () => {
    let userAnswer = document.getElementById('answer').value.trim();
    checkAnswer(userAnswer);
});

document.getElementsByClassName('close')[0].addEventListener('click', () => {
    document.getElementById('explanation-modal').style.display = 'none';
});

window.addEventListener('click', (event) => {
    let explanationModal = document.getElementById('explanation-modal');
    if (event.target == explanationModal) {
        explanationModal.style.display = 'none';
    }
});

displayNextQuestion();
</script>
