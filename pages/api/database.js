import mysql from 'mysql2';

const pool = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "o709o4@Newpass",
  database: "cuci_sepatu",
});

export default function handler(req, res) {
  pool.getConnection((err, connection) => {
    if (err) {
      console.error('Error connecting to database:', err);
      res.status(500).json({ message: 'Failed to connect to database' });
      return;
    }

    const query = 'SELECT * FROM pelanggan';
    connection.query(query, (error, results) => {
      connection.release();

      if (error) {
        console.error('Error executing query:', error);
        res.status(500).json({ message: 'Failed to execute query' });
        return;
      }

      res.status(200).json(results);
    });
  });
}