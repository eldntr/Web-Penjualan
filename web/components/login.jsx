// pages/api/login.js

import { verifyCredentials } from '../../lib/auth'; // Fungsi fiktif untuk verifikasi login
import { getUserRole } from '../../lib/user'; // Fungsi fiktif untuk mendapatkan peran pengguna

export default async function handler(req, res) {
  const { username, password } = req.body;
  const isValidUser = await verifyCredentials(username, password);

  if (!isValidUser) {
    return res.status(401).json({ message: 'Invalid credentials' });
  }

  const role = await getUserRole(username);

  res.status(200).json({ success: true, role });
}