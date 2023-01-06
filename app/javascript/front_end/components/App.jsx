import React, { useState } from "react";
import Children from "./Children.jsx";

const App = (props) => {
  const { initialState } = props;
  const children = initialState;
  return (
    <main>
      <Children children={children} />
    </main>
  );
};

export default App;
