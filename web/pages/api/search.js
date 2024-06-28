// pages/api/search.js

import db from '../../components/lib/database';

export default async function handler(req, res) {
  const { query } = req.query;
  if (!query) {
    return res.status(400).json({ error: 'Query parameter is required' });
  }

  try {
    const results = await db.query(
      'SELECT pelanggan_id, pelanggan_nama, pelanggan_alamat FROM pelanggan WHERE pelanggan_nama LIKE ? LIMIT 10',
      [`%${query}%`]
    );

    console.log(results);

    const result = results[0]

    // Normalize the results
    const normalizedResults = result.map(item => ({
      pelanggan_id: item.pelanggan_id ? item.pelanggan_id : 'No ID Provided', // Default value in case of null
      pelanggan_nama: item.pelanggan_nama ? item.pelanggan_nama : 'No Name Provided', // Default value in case of null
      pelanggan_alamat: item.pelanggan_alamat ? item.pelanggan_alamat : 'No Address Provided' // Default value in case of null
    }));

    console.log(normalizedResults);

    res.status(200).json(normalizedResults);
  } catch (error) {
    console.error('Database error:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
}
