// Create a context file: SelectedIdContext.js

import React, { createContext, useState, useContext } from 'react';

const SelectedIdContext = createContext();

export function useSelectedId() {
  return useContext(SelectedIdContext);
}

export const SelectedIdProvider = ({ children }) => {
  const [selectedId, setSelectedId] = useState('');

  return (
    <SelectedIdContext.Provider value={{ selectedId, setSelectedId }}>
      {children}
    </SelectedIdContext.Provider>
  );
};
