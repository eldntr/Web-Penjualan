const express = require('express');
const router = express.Router();
const connection = require('../lib/db'); // Sesuaikan dengan file koneksi database Anda

// Retrieve all pelanggan
router.get('/', (req, res) => {
    connection.query('SELECT * FROM pelanggan', (err, results) => {
        if (err) throw err;
        res.render('index', { pelanggan: results });
    });
});

// Add new pelanggan form
router.get('/add', (req, res) => {
    res.render('add');
});

// Add new pelanggan
router.post('/add', (req, res) => {
    const { nama, alamat } = req.body;
    connection.query('INSERT INTO pelanggan (pelanggan_nama, pelanggan_alamat) VALUES (?, ?)', [nama, alamat], (err, results) => {
        if (err) throw err;
        res.redirect('/');
    });
});

// Edit pelanggan form
router.get('/edit/:id', (req, res) => {
    const id = req.params.id;
    connection.query('SELECT * FROM pelanggan WHERE pelanggan_id = ?', [id], (err, results) => {
        if (err) throw err;
        res.render('edit', { pelanggan: results[0] });
    });
});

// Update pelanggan
router.post('/edit/:id', (req, res) => {
    const id = req.params.id;
    const { nama, alamat } = req.body;
    connection.query('UPDATE pelanggan SET pelanggan_nama = ?, pelanggan_alamat = ? WHERE pelanggan_id = ?', [nama, alamat, id], (err, results) => {
        if (err) throw err;
        res.redirect('/');
    });
});

// Delete pelanggan
router.post('/delete/:id', (req, res) => {
    const id = req.params.id;
    connection.query('DELETE FROM pelanggan WHERE pelanggan_id = ?', [id], (err, results) => {
        if (err) throw err;
        res.redirect('/');
    });
});

module.exports = router;
