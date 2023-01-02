import React, { useState } from "react";
import Children from "./Children";

const App = (props) => {
  const { initialState } = props;
  const children = initialState;
  console.log(children);
  return (
    <main>
      <Children children={children} />
    </main>
  );
};

export default App;
