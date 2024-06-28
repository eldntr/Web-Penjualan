'use client';
import React from 'react';
import { SelectedIdProvider } from '../components/user/selectedIdContext'; // Adjust the path as necessary

export default function RootLayout({ children }) {
  return (
    <html>
      <body>
        <div>
          <SelectedIdProvider>
            {children}
          </SelectedIdProvider>
        </div>
      </body>
    </html>
  );
}