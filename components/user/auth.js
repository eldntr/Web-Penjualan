// lib/auth.js

import connection from "../lib/database";

export async function verifyCredentials(username, password) {
  try {
    const query = `SELECT password FROM users WHERE username = ?`;
    const [rows] = await connection.execute(query, [username]);
    if (rows.length === 0) {
      return false; // Tidak ada pengguna dengan username tersebut
    }

    const user = rows[0];
    return user.password === password; // Perbandingan password (harusnya dengan hash)
  } catch (error) {
    console.error('Database error:', error);
    return false;
  }
}
