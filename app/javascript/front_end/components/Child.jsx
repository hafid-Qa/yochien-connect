import React from "react";

const Child = ({ name, age, status, address }) => {
  const profilImgUrl =
    "https://imgs.search.brave.com/93vIQeqFrqeopRkmyUBgIEnccTvF-Qsl5opsKSbzw-c/rs:fit:900:900:1/g:ce/aHR0cHM6Ly95dDMu/Z2dwaHQuY29tL2Ev/QUFUWEFKeXhpWGI0/TVhBMGVMZl92a0ZV/NHRuUU15VVdGV1dq/QUZzb2lNVzFiUT1z/OTAwLWMtay1jMHhm/ZmZmZmZmZi1uby1y/ai1tbw";

  return (
    <div className="col-12">
      <div className="card child-card">
        <div className="child-info">
          <img src={profilImgUrl} alt="" className="child-img" />
          <div className="child-detail">
            <div className="child-name">
              <h5 className="m-0">{name}</h5>
            </div>
            <div className="child-data">
              <p className="m-0">Age: {age}</p>
              <p className="m-0">Address: {address}</p>
            </div>
          </div>
        </div>
        <button className="child-status">{status}</button>
      </div>
    </div>
  );
};

export default Child;
