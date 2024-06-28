const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const PORT = 3000;

// Data simulasikan sebagai database sederhana
let orders = [
  { id: 1, name: "Pesanan A", completed: false },
  { id: 2, name: "Pesanan B", completed: true }
];

app.set('view engine', 'ejs');
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static('public'));

app.get('/', (req, res) => {
  res.render('index', { orders });
});

app.post('/toggle-complete', (req, res) => {
  const orderId = parseInt(req.body.id);
  const order = orders.find(order => order.id === orderId);
  if (order) {
    order.completed = !order.completed;
  }
  res.redirect('/');
});

app.get('/edit/:id', (req, res) => {
  const order = orders.find(order => order.id === parseInt(req.params.id));
  if (order) {
    res.render('edit', { order });
  } else {
    res.redirect('/');
  }
});

app.post('/edit/:id', (req, res) => {
  const orderId = parseInt(req.params.id);
  const { name } = req.body;
  const order = orders.find(order => order.id === orderId);
  if (order) {
    order.name = name;
  }
  res.redirect('/');
});

app.post('/delete/:id', (req, res) => {
  orders = orders.filter(order => order.id !== parseInt(req.params.id));
  res.redirect('/');
});

app.listen(PORT, () => {
  console.log(`Server is running on http://localhost:${PORT}`);
});
