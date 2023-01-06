import React from "react";
import ReactDOM from "react-dom/client";

import App from "./components/App.jsx";

const initReact = () => {
  const container = document.getElementById("root");
  const initialState = JSON.parse(container.dataset.children);
  if (container) {
    const root = ReactDOM.createRoot(container);
    root.render(<App initialState={initialState} />);
  }
};

export { initReact };
