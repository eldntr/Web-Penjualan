// pages/api/customers.js
import db from '../lib/database'; // Ensure you have a db module to handle database connections

export default async function handler(req, res) {
    if (req.method === 'POST') {
        const { pelanggan_id, pelanggan_nama, pelanggan_alamat } = req.body;
        try {
            const result = await db.query(
                'INSERT INTO pelanggan (pelanggan_id, pelanggan_nama, pelanggan_alamat) VALUES (?, ?, ?)',
                [pelanggan_id, pelanggan_nama, pelanggan_alamat]
            );
            console.log('Insert result:', result);
            res.status(200).json({ message: 'Customer added', insertedId: pelanggan_id });
        } catch (error) {
            res.status(500).json({ error: 'Database error' });
        }
    } else {
        res.status(405).json({ error: 'Method not allowed' });
    }
}
