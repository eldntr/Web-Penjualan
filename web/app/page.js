'use client';
import { useEffect, useState } from 'react';

export default function Home() {
  const [data, setData] = useState([]);

  useEffect(() => {
    const fetchData = async () => {
      const response = await fetch('/api/database');
      const jsonData = await response.json();
      setData(jsonData);
    };

    fetchData();
  }, []);

  return (
    <div>
      <h1>Data from MySQL</h1>
      <table>
        <thead>
          <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Address</th>
            <th>Phone Number</th>
          </tr>
        </thead>
        <tbody>
          {data.map((item, index) => (
            <tr key={index}>
              <td>{item.pelanggan_id}</td>
              <td>{item.pelanggan_nama}</td>
              <td>{item.pelanggan_alamat}</td>
              <td>{item.pelanggan_nomor_telepon}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
}
