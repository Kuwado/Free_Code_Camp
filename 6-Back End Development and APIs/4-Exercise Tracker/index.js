const express = require('express');
const cors = require('cors');
const app = express();
require('dotenv').config();

app.use(cors());
app.use(express.static('public'));
app.use(express.urlencoded({ extended: true })); // To parse form data

app.get('/', (req, res) => {
  res.sendFile(__dirname + '/views/index.html');
});

// In-memory database
let users = [];
let exercises = [];

// Create a new user
app.post('/api/users', (req, res) => {
  const { username } = req.body;
  const _id = users.length + 1;
  const newUser = { username, _id };
  users.push(newUser);
  res.json(newUser);
});

// Get all users
app.get('/api/users', (req, res) => {
  res.json(users);
});

// Add exercise for a user
app.post('/api/users/:_id/exercises', (req, res) => {
  const { _id } = req.params;
  const { description, duration, date } = req.body;
  const user = users.find(user => user._id == _id);

  if (!user) {
    return res.json({ error: 'User not found' });
  }

  const exerciseDate = date ? new Date(date) : new Date();
  const newExercise = {
    username: user.username,
    description,
    duration: parseInt(duration),
    date: exerciseDate.toDateString(),
    _id: user._id,
  };

  exercises.push(newExercise);
  res.json(newExercise);
});

// Get exercise logs for a user
app.get('/api/users/:_id/logs', (req, res) => {
  const { _id } = req.params;
  const { from, to, limit } = req.query;
  const user = users.find(user => user._id == _id);

  if (!user) {
    return res.json({ error: 'User not found' });
  }

  let userExercises = exercises.filter(exercise => exercise._id == _id);

  if (from) {
    const fromDate = new Date(from);
    userExercises = userExercises.filter(exercise => new Date(exercise.date) >= fromDate);
  }

  if (to) {
    const toDate = new Date(to);
    userExercises = userExercises.filter(exercise => new Date(exercise.date) <= toDate);
  }

  if (limit) {
    userExercises = userExercises.slice(0, parseInt(limit));
  }

  res.json({
    username: user.username,
    count: userExercises.length,
    _id: user._id,
    log: userExercises.map(({ description, duration, date }) => ({
      description,
      duration,
      date,
    })),
  });
});

const listener = app.listen(process.env.PORT || 3000, () => {
  console.log('Your app is listening on port ' + listener.address().port);
});
