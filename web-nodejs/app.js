const express = require('express');
const app = express();
const path = require('path');
const ejs = require('ejs');
const bodyParser = require('body-parser');

// Set the view engine to ejs
app.set('view engine', 'ejs');

// Set the views directory
app.set('views', path.join(__dirname, 'customer'));

// Serve static files from the "public" directory
app.use(express.static(path.join(__dirname, 'customer')));

// Parse form data
app.use(bodyParser.urlencoded({ extended: true }));

app.get('/', function(req, res) {
    // Render the EJS template
    res.render('page');
});

app.post('/register', function(req, res) {
    // Log the form data to the console
    console.log(req.body);
    res.redirect('/order');
});

app.get('/order', function(req, res) {
    // Render the EJS template
    res.render('page2');
});

app.post('/submit', function(req, res) {
    // Log the form data to the console
    console.log(req.body);
    res.redirect('/');
});

app.get('/receipt', function(req, res) {
    // Render the EJS template
    res.render('page3');
});

app.listen(3000, function () {
  console.log('App listening on port 3000!');
});