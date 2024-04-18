# grid_task_1
Practice Module for Aptitude, Logical, Reasoning:
Create question table:
● QuestionID: A unique identifier for each question.
● QuestionText: The text of the question.
● DifficultyLevel: The difficulty level of the question (e.g., Easy, Medium, Hard).
● Topic: The topic or category of the question (e.g., Aptitude, Logical, Reasoning).
● Type: Specifies whether the question is an MCQ or a descriptive question.
● Options: Stores options for MCQs as a JSON array. For descriptive questions,
this field can be NULL.
● CorrectAnswer: Stores the correct option for MCQs. For descriptive questions,
this field can be NULL.
● Explanation: Provides an explanation for the correct answer or solution to the
question.
Create a frontend and php page to fetch 10 questions randomly and display to the user
one by one depending on mcq or descriptive.
Validate the answer with the field accordingly and proceed to the next question.
Display explanation in a modal on click of explanation button.
