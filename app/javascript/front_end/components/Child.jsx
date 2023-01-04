import React from "react";
import { statuses } from "../mockData/data";

const Child = ({ child, handleChange, roleType }) => {
  const profileImgUrl =
    "https://imgs.search.brave.com/93vIQeqFrqeopRkmyUBgIEnccTvF-Qsl5opsKSbzw-c/rs:fit:900:900:1/g:ce/aHR0cHM6Ly95dDMu/Z2dwaHQuY29tL2Ev/QUFUWEFKeXhpWGI0/TVhBMGVMZl92a0ZV/NHRuUU15VVdGV1dq/QUZzb2lNVzFiUT1z/OTAwLWMtay1jMHhm/ZmZmZmZmZi1uby1y/ai1tbw";
  return (
    <div className="col-12">
      <div className="card child-card">
        <div className="child-info">
          <img src={profileImgUrl} alt="" className="child-img" />
          <div className="child-detail">
            <div className="child-name">
              <h5 className="m-0">{child.full_name}</h5>
            </div>
            <div className="child-data">
              <p className="m-0">Age: {child.age}</p>
              <p className="m-0">Address: {child.full_address}</p>
            </div>
          </div>
        </div>
        <select
          id="child-status"
          name="child-status"
          defaultValue={child.trip.status}
          onChange={(e) => handleChange(e, child)}
        >
          {statuses[roleType].map((status, i) => {
            return (
              <option value={status} key={i}>
                {status}
              </option>
            );
          })}
        </select>
      </div>
    </div>
  );
};

export default Child;
