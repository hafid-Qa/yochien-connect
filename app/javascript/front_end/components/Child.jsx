import React from "react";

const Child = () => {
  return (
    <div className="d-flex gap-3 justify-content-around align-items-center bg-white p-3 mb-3">
      <div className="d-flex gap-2">
        <p className="m-0 bg-dark text-white rounded">child.jpg</p>
        <h5 className="m-0">children name</h5>
      </div>
      <p className="m-0">Address: Meugro, Tokyo</p>
      <button className="rounded-pill">status</button>
    </div>
  );
};

export default Child;
