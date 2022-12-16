import React, { useState, useEffect } from "react";
import moment from "moment";
import { childrenData, statuses } from "../mockData/data";

import Child from "./Child";

const Children = () => {
  const [filter, setFilter] = useState("all");
  const [children, setChildren] = useState([]);
  const [active, setActive] = useState(0);

  useEffect(() => {
    if (filter === "all") {
      setChildren(childrenData);
    } else {
      const newChildren = childrenData.filter((child) => {
        return child.currentStatus === filter;
      });
      setChildren(newChildren);
    }
  }, [filter]);

  const handleClick = (e, index) => {
    setFilter(e.target.textContent);
    setActive(index);
  };

  return (
    <div className="container mt-5">
      <p className="m-0">{moment().format("dddd, MMM Do YYYY")}</p>
      <h3 className="mt-1 mb-3">{moment().format("h:mm a")}</h3>

      <div className="d-flex gap-2 my-2">
        {statuses.map((status, index) => {
          return (
            <button
              className={`${
                active === index ? "btn-primary" : "btn-secondary"
              } btn`}
              key={index}
              onClick={(e) => {
                handleClick(e, index);
              }}
            >
              {status}
            </button>
          );
        })}
      </div>

      <div className="row gap-2">
        {children.map((child) => {
          return (
            <Child
              key={child.id}
              name={`${child.firstName} ${child.lastName}`}
              age={child.age}
              currentStatus={child.currentStatus}
            />
          );
        })}
      </div>
    </div>
  );
};

export default Children;
