import React, { useState } from "react";
import Children from "./Children";

const App = (props) => {
  const { initialState, roleType } = props;
  const children = initialState;
  return (
    <main>
      <Children children={children} roleType={roleType} />
    </main>
  );
};

export default App;
