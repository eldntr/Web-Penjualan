'use client';
import React, { useState, useContext } from 'react';
import { useSelectedId } from '../../components/user/selectedIdContext'; // Ensure the path is correct

function CustomerForm() {
    const [pelangganId, setPelangganId] = useState('');
    const [nama, setNama] = useState('');
    const [alamat, setAlamat] = useState('');
    const { setSelectedId } = useSelectedId();

    const handleSubmit = async (event) => {
        event.preventDefault();
        
        const body = { pelanggan_id: pelangganId, pelanggan_nama: nama, pelanggan_alamat: alamat };
        try {
            const response = await fetch('/api/customer', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(body)
            });
            const result = await response.json();
            if (response.ok) {
                setSelectedId(result.insertedId); // Assuming API returns the inserted ID
                console.log('Customer added:', result);
            } else {
                console.error('Failed to add customer:', result.error);
            }
        } catch (error) {
            console.error('Failed to submit form:', error);
        }
    };

    return (
        <form onSubmit={handleSubmit}>
            <input
                type="text"
                value={pelangganId}
                onChange={(e) => setPelangganId(e.target.value)}
                placeholder="Customer ID (Phone Number)"
                required
            />
            <input
                type="text"
                value={nama}
                onChange={(e) => setNama(e.target.value)}
                placeholder="Customer Name"
                required
            />
            <input
                type="text"
                value={alamat}
                onChange={(e) => setAlamat(e.target.value)}
                placeholder="Customer Address"
                required
            />
            <button type="submit">Add Customer</button>
        </form>
    );
}

export default CustomerForm;
