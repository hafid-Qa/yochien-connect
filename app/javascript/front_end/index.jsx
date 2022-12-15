import React from "react";
import ReactDOM from "react-dom/client";

import App from "./components/App";
// document.addEventListener("DOMContentLoaded", () => {
//   const container = document.getElementById("root");
//   if (container) {
//     const root = ReactDOM.createRoot(container);
//     root.render(<App />);
//   }
// });

const initReact = () => {
  const container = document.getElementById("root");

  if (container) {
    const root = ReactDOM.createRoot(container);
    root.render(<App />);
  }
};

export { initReact };
