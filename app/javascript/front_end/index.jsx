import React from "react";
import ReactDOM from "react-dom/client";

import App from "./components/App";

const initReact = () => {
  const container = document.getElementById("root");
  const initialState = JSON.parse(container.dataset.children);
  const roleType = container.dataset.role;
  
  if (container) {
    const root = ReactDOM.createRoot(container);
    root.render(<App initialState={initialState} roleType={roleType} />);
  }
};

export { initReact };
