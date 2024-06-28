// routes/pelanggan.js
const express = require('express');
const router = express.Router();

let pelanggan = [
    { id: 1, nama: "Budi", alamat: "Jakarta" },
    { id: 2, nama: "Sari", alamat: "Surabaya" }
];

router.get('/', (req, res) => {
    res.render('index', { pelanggan: pelanggan });
});

router.get('/add', (req, res) => {
    res.render('add');
});

router.post('/add', (req, res) => {
    const { nama, alamat } = req.body;
    let id = pelanggan[pelanggan.length - 1].id + 1;
    pelanggan.push({ id, nama, alamat });
    res.redirect('/');
});

router.get('/edit/:id', (req, res) => {
    const id = req.params.id;
    const pelangganData = pelanggan.find(p => p.id == id);
    res.render('edit', { pelanggan: pelangganData });
});

router.post('/edit/:id', (req, res) => {
    const id = req.params.id;
    const { nama, alamat } = req.body;
    let index = pelanggan.findIndex(p => p.id == id);
    pelanggan[index] = { id, nama, alamat };
    res.redirect('/');
});

router.get('/delete/:id', (req, res) => {
    const id = req.params.id;
    pelanggan = pelanggan.filter(p => p.id != id);
    res.redirect('/');
});

module.exports = router;