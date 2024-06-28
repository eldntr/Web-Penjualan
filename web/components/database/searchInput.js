'use client';
import React, { useState, useEffect } from 'react';
import { useSelectedId } from '../user/selectedIdContext'; // Adjust the path as necessary

function SearchInput() {
  const [query, setQuery] = useState('');
  const [results, setResults] = useState([]);
  const { selectedId, setSelectedId } = useSelectedId(); // Correctly destructured

  useEffect(() => {
    const fetchResults = async () => {
      if (query.length > 1) {
        const res = await fetch(`/api/search?query=${query}`);
        const data = await res.json();
        console.log(data);
        setResults(data);
        if (data.length > 0) {
          setSelectedId(data[0].pelanggan_id); // Default to the first result's ID
        }
      } else {
        setResults([]);
        setSelectedId(''); // Clear selection when there are no results
      }
    };

    const timerId = setTimeout(fetchResults, 300);
    return () => clearTimeout(timerId);
  }, [query, setSelectedId]); // Include setSelectedId in the dependency array

  return (
    <div>
      <input
        type="text"
        placeholder="Type to search..."
        value={query}
        onChange={(e) => setQuery(e.target.value)}
      />
      {results.length > 0 && (
        <select
          value={selectedId}
          onChange={(e) => setSelectedId(e.target.value)}
        >
          {results.map((item, index) => (
            <option key={index} value={item.pelanggan_id}>
              {item.pelanggan_nama} - {item.pelanggan_alamat}
            </option>
          ))}
        </select>
      )}
      <div>
        Selected ID: {selectedId}
      </div>
    </div>
  );
}

export default SearchInput;
