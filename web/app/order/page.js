'use client';
import React, { useContext } from 'react';
import { useSelectedId } from '@/components/user/selectedIdContext';

function Page() {
    const { selectedId, setSelectedId } = useSelectedId(); // Correctly destructured
    return (
        <div>
            <h1>Selected ID: {selectedId}</h1>
        </div>
    );
}

export default Page;